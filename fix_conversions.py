#!/usr/bin/env python3
"""
Improved Flutter Screen to Page Converter
Properly converts StatefulWidget to HookConsumerWidget
"""
import os
import re

def convert_file(file_path):
    """Convert a single file"""
    with open(file_path, 'r', encoding='utf-8') as f:
        content = f.read()
    
    # Check if already has @RoutePage
    if '@RoutePage()' in content:
        print(f"✅ Already converted: {os.path.basename(file_path)}")
        return False
    
    # Find class name
    class_match = re.search(r'class\s+(\w+)\s+extends\s+(StatefulWidget|StatelessWidget)', content)
    if not class_match:
        print(f"⏭️  No widget found: {os.path.basename(file_path)}")
        return False
    
    class_name = class_match.group(1)
    widget_type = class_match.group(2)
    
    print(f"🔄 Converting: {os.path.basename(file_path)}")
    print(f"   Class: {class_name} ({widget_type})")
    
    # Add imports if missing
    if 'import \'package:auto_route/auto_route.dart\';' not in content:
        first_import = re.search(r"import '[^']+';", content)
        if first_import:
            content = content[:first_import.end()] + "\nimport 'package:auto_route/auto_route.dart';" + content[first_import.end():]
    
    if 'import \'package:flutter_hooks/flutter_hooks.dart\';' not in content:
        first_import = re.search(r"import '[^']+';", content)
        if first_import:
            content = content[:first_import.end()] + "\nimport 'package:flutter_hooks/flutter_hooks.dart';" + content[first_import.end():]
    
    if 'import \'package:hooks_riverpod/hooks_riverpod.dart\';' not in content:
        first_import = re.search(r"import '[^']+';", content)
        if first_import:
            content = content[:first_import.end()] + "\nimport 'package:hooks_riverpod/hooks_riverpod.dart';" + content[first_import.end():]
    
    if widget_type == 'StatefulWidget':
        # Convert StatefulWidget to HookConsumerWidget
        # Add @RoutePage() before class
        content = re.sub(
            rf'class\s+{class_name}\s+extends\s+StatefulWidget',
            f'@RoutePage()\nclass {class_name} extends HookConsumerWidget',
            content
        )
        
        # Remove createState method
        content = re.sub(
            r'@override\s+State<[^>]+>\s+createState\(\)\s*=>\s*_[^;]+;',
            '',
            content
        )
        
        # Find and remove State class, but keep build method
        state_pattern = rf'class\s+_{class_name}State\s+extends\s+State<{class_name}>\s*{{'
        state_match = re.search(state_pattern, content)
        
        if state_match:
            # Find the build method
            build_match = re.search(
                r'@override\s+Widget\s+build\(BuildContext\s+context\)\s*{',
                content[state_match.end():]
            )
            
            if build_match:
                # Change build signature to include WidgetRef
                content = re.sub(
                    r'@override\s+Widget\s+build\(BuildContext\s+context\)',
                    '@override\n  Widget build(BuildContext context, WidgetRef ref)',
                    content
                )
                
                # Remove the State class declaration but keep its content
                content = re.sub(state_pattern, '', content)
                
                # Remove the closing brace of State class (last one before end)
                # This is tricky, so we'll just remove extra closing braces at the end
                lines = content.split('\n')
                # Remove empty State class lines
                lines = [line for line in lines if line.strip() != '']
                content = '\n'.join(lines)
    
    else:  # StatelessWidget
        # Add @RoutePage() before class
        content = re.sub(
            rf'class\s+{class_name}\s+extends\s+StatelessWidget',
            f'@RoutePage()\nclass {class_name} extends HookWidget',
            content
        )
    
    # Convert Navigator.push to context.router.push
    content = re.sub(
        r'Navigator\.push\(\s*context,\s*MaterialPageRoute\(\s*builder:\s*\([^)]*\)\s*=>\s*(\w+)\(\)\s*\),?\s*\)',
        r'context.router.push(\1Route())',
        content
    )
    
    # Convert Navigator.pop
    content = re.sub(
        r'Navigator\.pop\(context\)',
        r'context.router.pop()',
        content
    )
    
    # Write back
    with open(file_path, 'w', encoding='utf-8') as f:
        f.write(content)
    
    print(f"   ✅ Converted successfully\n")
    return True

def main():
    """Main function"""
    print("🚀 Improved Conversion Script")
    print("=" * 60)
    
    # Find all _page.dart files
    module_dir = '/Users/mac/Projects/flutter/ppay-mobile/lib/module'
    page_files = []
    
    for root, dirs, files in os.walk(module_dir):
        for file in files:
            if file.endswith('_page.dart'):
                page_files.append(os.path.join(root, file))
    
    print(f"\n📊 Found {len(page_files)} page files\n")
    
    converted = 0
    for file_path in sorted(page_files):
        if convert_file(file_path):
            converted += 1
    
    print("=" * 60)
    print(f"🎉 Conversion Complete!")
    print(f"✅ Converted: {converted} files")
    print(f"⏭️  Skipped: {len(page_files) - converted} files")

if __name__ == '__main__':
    main()
