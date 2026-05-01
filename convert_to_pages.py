#!/usr/bin/env python3
"""
Script to convert Flutter screens to pages with hooks and AutoRoute
"""
import os
import re
import shutil
from pathlib import Path

# Base directory
BASE_DIR = "/Users/mac/Projects/flutter/ppay-mobile/lib/module"

# Files that are NOT pages (bottom sheets, dialogs, widgets)
NON_PAGE_FILES = [
    'tv_cable_pin_bottomsheet.dart',
    'flight_two_pin_bottomsheet.dart',
    'update_flight_search_card.dart',  # This is a widget/card, not a page
]

def is_page_file(filename):
    """Determine if a file is a page/screen"""
    if filename in NON_PAGE_FILES:
        return False
    if 'bottomsheet' in filename.lower():
        return False
    if 'dialog' in filename.lower():
        return False
    return filename.endswith('_screen.dart') or filename.endswith('.dart')

def convert_filename(old_name):
    """Convert filename from *_screen.dart to *_page.dart"""
    if old_name.endswith('_screen.dart'):
        return old_name.replace('_screen.dart', '_page.dart')
    elif not old_name.endswith('_page.dart') and old_name.endswith('.dart'):
        # Files without _screen suffix
        base = old_name.replace('.dart', '')
        return f"{base}_page.dart"
    return old_name

def convert_class_name(old_name):
    """Convert class name from *Screen to *Page"""
    if old_name.endswith('Screen'):
        return old_name.replace('Screen', 'Page')
    else:
        return f"{old_name}Page"

def convert_file_content(content, old_class_name, new_class_name, is_stateful):
    """Convert file content to use hooks and AutoRoute"""
    
    # Add imports if not present
    imports_to_add = []
    if 'import \'package:auto_route/auto_route.dart\';' not in content:
        imports_to_add.append("import 'package:auto_route/auto_route.dart';")
    if 'import \'package:hooks_riverpod/hooks_riverpod.dart\';' not in content:
        imports_to_add.append("import 'package:hooks_riverpod/hooks_riverpod.dart';")
    if 'import \'package:flutter_hooks/flutter_hooks.dart\';' not in content and is_stateful:
        imports_to_add.append("import 'package:flutter_hooks/flutter_hooks.dart';")
    
    # Find the first import and add our imports after it
    if imports_to_add:
        first_import_match = re.search(r"import '[^']+';", content)
        if first_import_match:
            insert_pos = first_import_match.end()
            imports_str = '\n' + '\n'.join(imports_to_add)
            content = content[:insert_pos] + imports_str + content[insert_pos:]
    
    # Replace class names in the entire file
    content = re.sub(rf'\b{old_class_name}\b', new_class_name, content)
    
    # Convert StatefulWidget to HookConsumerWidget
    if is_stateful:
        # Remove the State class
        state_class_pattern = rf'class _{old_class_name}State extends State<{old_class_name}> {{.*?^}}'
        state_match = re.search(state_class_pattern, content, re.MULTILINE | re.DOTALL)
        
        if state_match:
            # Extract build method and other methods from State class
            state_content = state_match.group(0)
            
            # Find build method
            build_match = re.search(r'@override\s+Widget build\(BuildContext context\)', state_content)
            if build_match:
                # Replace with HookConsumerWidget build signature
                state_content = state_content.replace(
                    '@override\n  Widget build(BuildContext context)',
                    '@override\n  Widget build(BuildContext context, WidgetRef ref)'
                )
            
            # Replace setState calls with hooks (this is simplified, manual review needed)
            # state_content = state_content.replace('setState(() {', '// TODO: Convert to hooks - ')
            
            # Remove State class wrapper
            content = content.replace(state_match.group(0), '')
        
        # Convert the main class
        content = re.sub(
            rf'class {new_class_name} extends StatefulWidget',
            f'@RoutePage()\nclass {new_class_name} extends HookConsumerWidget',
            content
        )
        
        # Remove createState method
        content = re.sub(r'@override\s+State<[^>]+> createState\(\) => _[^;]+;', '', content)
        
    else:
        # Convert StatelessWidget to HookWidget
        content = re.sub(
            rf'class {new_class_name} extends StatelessWidget',
            f'@RoutePage()\nclass {new_class_name} extends HookWidget',
            content
        )
        
        # Update build method signature for HookWidget
        content = re.sub(
            r'@override\s+Widget build\(BuildContext context\)',
            '@override\n  Widget build(BuildContext context)',
            content
        )
    
    # Convert Navigator.push to AutoRoute
    content = re.sub(
        r'Navigator\.push\(\s*context,\s*MaterialPageRoute\(builder: \(context\) => ([^(]+)\(\)\),?\s*\)',
        r'context.router.push(\1Route())',
        content
    )
    
    content = re.sub(
        r'Navigator\.push\(\s*context,\s*MaterialPageRoute\(builder: \(_\) => ([^(]+)\(\)\),?\s*\)',
        r'context.router.push(\1Route())',
        content
    )
    
    return content

def detect_widget_type(content):
    """Detect if widget is StatefulWidget or StatelessWidget"""
    if 'extends StatefulWidget' in content:
        return True, 'StatefulWidget'
    elif 'extends StatelessWidget' in content:
        return False, 'StatelessWidget'
    return None, None

def process_file(file_path):
    """Process a single file"""
    print(f"Processing: {file_path}")
    
    with open(file_path, 'r', encoding='utf-8') as f:
        content = f.read()
    
    # Detect widget type
    is_stateful, widget_type = detect_widget_type(content)
    if is_stateful is None:
        print(f"  Skipping: Not a widget file")
        return None
    
    # Extract old class name
    class_match = re.search(r'class (\w+) extends (StatefulWidget|StatelessWidget)', content)
    if not class_match:
        print(f"  Skipping: Could not find class")
        return None
    
    old_class_name = class_match.group(1)
    new_class_name = convert_class_name(old_class_name)
    
    print(f"  Converting: {old_class_name} -> {new_class_name}")
    print(f"  Type: {widget_type}")
    
    # Convert content
    new_content = convert_file_content(content, old_class_name, new_class_name, is_stateful)
    
    # Generate new filename
    old_filename = os.path.basename(file_path)
    new_filename = convert_filename(old_filename)
    new_file_path = os.path.join(os.path.dirname(file_path), new_filename)
    
    print(f"  New file: {new_filename}")
    
    return {
        'old_path': file_path,
        'new_path': new_file_path,
        'old_class': old_class_name,
        'new_class': new_class_name,
        'content': new_content,
        'is_stateful': is_stateful
    }

def main():
    """Main conversion function"""
    print("Starting conversion...")
    print(f"Base directory: {BASE_DIR}")
    
    # Find all Dart files
    dart_files = []
    for root, dirs, files in os.walk(BASE_DIR):
        for file in files:
            if file.endswith('.dart') and is_page_file(file):
                dart_files.append(os.path.join(root, file))
    
    print(f"\nFound {len(dart_files)} files to process\n")
    
    conversions = []
    for file_path in sorted(dart_files):
        result = process_file(file_path)
        if result:
            conversions.append(result)
        print()
    
    print(f"\n{'='*60}")
    print(f"Conversion Summary:")
    print(f"{'='*60}")
    print(f"Total files processed: {len(conversions)}")
    print(f"\nReady to write files. Proceed? (y/n): ", end='')
    
    # For automation, we'll just print the summary
    print("\n\nTo apply changes, uncomment the write section in the script.")
    
    # Uncomment below to actually write files
    # for conv in conversions:
    #     with open(conv['new_path'], 'w', encoding='utf-8') as f:
    #         f.write(conv['content'])
    #     if conv['old_path'] != conv['new_path']:
    #         os.remove(conv['old_path'])
    #     print(f"✓ {conv['new_class']}")

if __name__ == '__main__':
    main()
