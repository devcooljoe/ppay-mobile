#!/usr/bin/env python3
"""
Automated Flutter Screen to Page Converter
Converts ALL screens to pages with HookWidget/HookConsumerWidget
"""
import os
import re
import shutil

# Files to skip (bottomsheets, dialogs, widgets)
SKIP_FILES = [
    'tv_cable_pin_bottomsheet.dart',
    'flight_two_pin_bottomsheet.dart',
    'update_flight_search_card.dart',
]

def should_skip(filename):
    """Check if file should be skipped"""
    if filename in SKIP_FILES:
        return True
    if 'bottomsheet' in filename.lower():
        return True
    if 'dialog' in filename.lower():
        return True
    return False

def get_new_filename(old_filename):
    """Convert filename to page format"""
    if old_filename.endswith('_screen.dart'):
        return old_filename.replace('_screen.dart', '_page.dart')
    elif old_filename.endswith('.dart') and not old_filename.endswith('_page.dart'):
        base = old_filename.replace('.dart', '')
        return f"{base}_page.dart"
    return old_filename

def get_class_name_from_file(content):
    """Extract class name from file content"""
    # Match StatefulWidget or StatelessWidget
    match = re.search(r'class\s+(\w+)\s+extends\s+(StatefulWidget|StatelessWidget)', content)
    if match:
        return match.group(1), match.group(2)
    return None, None

def convert_class_name(old_class_name):
    """Convert class name to Page format"""
    if old_class_name.endswith('Screen'):
        return old_class_name.replace('Screen', 'Page')
    elif not old_class_name.endswith('Page'):
        return f"{old_class_name}Page"
    return old_class_name

def add_imports(content):
    """Add necessary imports if not present"""
    imports_to_add = []
    
    if 'import \'package:auto_route/auto_route.dart\';' not in content:
        imports_to_add.append("import 'package:auto_route/auto_route.dart';")
    
    if 'import \'package:flutter_hooks/flutter_hooks.dart\';' not in content:
        imports_to_add.append("import 'package:flutter_hooks/flutter_hooks.dart';")
    
    if 'import \'package:hooks_riverpod/hooks_riverpod.dart\';' not in content:
        imports_to_add.append("import 'package:hooks_riverpod/hooks_riverpod.dart';")
    
    if imports_to_add:
        # Find first import and add after it
        first_import = re.search(r"import '[^']+';", content)
        if first_import:
            insert_pos = first_import.end()
            imports_str = '\n' + '\n'.join(imports_to_add)
            content = content[:insert_pos] + imports_str + content[insert_pos:]
    
    return content

def convert_navigation(content):
    """Convert Navigator.push to context.router.push"""
    # Pattern 1: Navigator.push with MaterialPageRoute
    content = re.sub(
        r'Navigator\.push\(\s*context,\s*MaterialPageRoute\(\s*builder:\s*\([^)]*\)\s*=>\s*(\w+)\(\)\s*\),?\s*\)',
        r'context.router.push(\1Route())',
        content
    )
    
    # Pattern 2: Navigator.pop
    content = re.sub(
        r'Navigator\.pop\(context\)',
        r'context.router.pop()',
        content
    )
    
    # Pattern 3: Navigator.pushAndRemoveUntil
    content = re.sub(
        r'Navigator\.pushAndRemoveUntil\(\s*context,\s*MaterialPageRoute\([^)]+\),\s*\([^)]+\)\s*=>\s*false\s*\)',
        lambda m: 'context.router.replaceAll([' + re.search(r'(\w+)\(\)', m.group(0)).group(1) + 'Route()])',
        content
    )
    
    return content

def convert_to_hook_widget(content, old_class_name, new_class_name, widget_type):
    """Convert StatefulWidget/StatelessWidget to HookWidget/HookConsumerWidget"""
    
    if widget_type == 'StatefulWidget':
        # Remove State class
        state_pattern = rf'class\s+_{old_class_name}State\s+extends\s+State<{old_class_name}>\s*{{[^}}]*(?:{{[^}}]*}}[^}}]*)*}}'
        state_match = re.search(state_pattern, content, re.DOTALL)
        
        if state_match:
            state_content = state_match.group(0)
            
            # Extract build method
            build_match = re.search(
                r'@override\s+Widget\s+build\(BuildContext\s+context\)\s*{',
                state_content
            )
            
            if build_match:
                # Find the complete build method
                build_start = state_content.find('@override', build_match.start())
                brace_count = 0
                build_end = build_match.end()
                
                for i in range(build_match.end(), len(state_content)):
                    if state_content[i] == '{':
                        brace_count += 1
                    elif state_content[i] == '}':
                        brace_count -= 1
                        if brace_count == 0:
                            build_end = i + 1
                            break
                
                build_method = state_content[build_start:build_end]
                
                # Replace the entire StatefulWidget and State with HookConsumerWidget
                new_widget = f'''@RoutePage()
class {new_class_name} extends HookConsumerWidget {{
  const {new_class_name}({{super.key}});

  @override
  Widget build(BuildContext context, WidgetRef ref) {{'''
                
                # Extract body of build method
                build_body_match = re.search(r'Widget\s+build\(BuildContext\s+context\)\s*{(.+)}$', build_method, re.DOTALL)
                if build_body_match:
                    build_body = build_body_match.group(1).strip()
                    new_widget += '\n    ' + build_body + '\n  }\n}'
                
                # Remove old widget and state class
                content = re.sub(
                    rf'class\s+{old_class_name}\s+extends\s+StatefulWidget\s*{{[^}}]*}}',
                    '',
                    content
                )
                content = re.sub(state_pattern, new_widget, content, flags=re.DOTALL)
            
    else:  # StatelessWidget
        # Replace StatelessWidget with HookWidget
        widget_pattern = rf'class\s+{old_class_name}\s+extends\s+StatelessWidget\s*{{[^}}]*(?:{{[^}}]*}}[^}}]*)*}}'
        widget_match = re.search(widget_pattern, content, re.DOTALL)
        
        if widget_match:
            widget_content = widget_match.group(0)
            
            # Add @RoutePage() and change to HookWidget
            new_widget = widget_content.replace(
                f'class {old_class_name} extends StatelessWidget',
                f'@RoutePage()\nclass {new_class_name} extends HookWidget'
            )
            
            content = content.replace(widget_content, new_widget)
    
    # Replace all occurrences of old class name with new one
    content = re.sub(rf'\b{old_class_name}\b', new_class_name, content)
    
    return content

def process_file(file_path):
    """Process a single file"""
    filename = os.path.basename(file_path)
    
    # Skip if needed
    if should_skip(filename):
        print(f"⏭️  Skipping: {filename}")
        return None
    
    # Read file
    try:
        with open(file_path, 'r', encoding='utf-8') as f:
            content = f.read()
    except Exception as e:
        print(f"❌ Error reading {filename}: {e}")
        return None
    
    # Get class name and type
    old_class_name, widget_type = get_class_name_from_file(content)
    if not old_class_name:
        print(f"⏭️  Skipping {filename}: No widget class found")
        return None
    
    # Convert class name
    new_class_name = convert_class_name(old_class_name)
    
    # Get new filename
    new_filename = get_new_filename(filename)
    new_file_path = os.path.join(os.path.dirname(file_path), new_filename)
    
    print(f"🔄 Converting: {filename}")
    print(f"   Class: {old_class_name} → {new_class_name}")
    print(f"   File: {filename} → {new_filename}")
    
    # Add imports
    content = add_imports(content)
    
    # Convert to HookWidget/HookConsumerWidget
    content = convert_to_hook_widget(content, old_class_name, new_class_name, widget_type)
    
    # Convert navigation
    content = convert_navigation(content)
    
    # Update imports of app_router
    if 'app/router/app_router.gr.dart' not in content:
        content = content.replace(
            "import 'package:auto_route/auto_route.dart';",
            "import 'package:auto_route/auto_route.dart';\nimport 'package:ppay_mobile/app/router/app_router.gr.dart';"
        )
    
    return {
        'old_path': file_path,
        'new_path': new_file_path,
        'content': content,
        'old_class': old_class_name,
        'new_class': new_class_name
    }

def main():
    """Main conversion function"""
    print("🚀 Starting Automated Conversion")
    print("=" * 60)
    
    # Find all dart files
    module_dir = '/Users/mac/Projects/flutter/ppay-mobile/lib/module'
    dart_files = []
    
    for root, dirs, files in os.walk(module_dir):
        for file in files:
            if file.endswith('.dart') and not file.endswith('_page.dart'):
                dart_files.append(os.path.join(root, file))
    
    print(f"\n📊 Found {len(dart_files)} files to process\n")
    
    # Process all files
    conversions = []
    skipped = 0
    
    for file_path in sorted(dart_files):
        result = process_file(file_path)
        if result:
            conversions.append(result)
        else:
            skipped += 1
        print()
    
    print("=" * 60)
    print(f"\n✅ Processed: {len(conversions)} files")
    print(f"⏭️  Skipped: {skipped} files")
    print(f"\n💾 Ready to write {len(conversions)} converted files")
    
    # Write all files
    print("\n📝 Writing converted files...")
    for conv in conversions:
        try:
            # Write new file
            with open(conv['new_path'], 'w', encoding='utf-8') as f:
                f.write(conv['content'])
            
            # Delete old file if different
            if conv['old_path'] != conv['new_path'] and os.path.exists(conv['old_path']):
                os.remove(conv['old_path'])
            
            print(f"✅ {os.path.basename(conv['new_path'])}")
        except Exception as e:
            print(f"❌ Error writing {os.path.basename(conv['new_path'])}: {e}")
    
    print("\n" + "=" * 60)
    print("🎉 Conversion Complete!")
    print(f"✅ Converted {len(conversions)} files")
    print("\n📋 Next steps:")
    print("1. Run: flutter pub run build_runner build --delete-conflicting-outputs")
    print("2. Update all imports in other files")
    print("3. Test the app")

if __name__ == '__main__':
    main()
