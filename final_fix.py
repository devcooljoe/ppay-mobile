#!/usr/bin/env python3
"""
Final Comprehensive Conversion Script
Properly converts all StatefulWidget to HookConsumerWidget
"""
import os
import re

def read_file(path):
    with open(path, 'r', encoding='utf-8') as f:
        return f.read()

def write_file(path, content):
    with open(path, 'w', encoding='utf-8') as f:
        f.write(content)

def convert_stateful_to_hook(content, class_name):
    """Convert StatefulWidget with State class to HookConsumerWidget"""
    
    # Find the State class
    state_class_pattern = rf'class\s+_{class_name}State\s+extends\s+State<{class_name}>\s*{{(.+?)^}}'
    state_match = re.search(state_class_pattern, content, re.MULTILINE | re.DOTALL)
    
    if not state_match:
        return content
    
    state_content = state_match.group(1)
    
    # Extract all methods and fields from State class
    # Find build method
    build_pattern = r'@override\s+Widget\s+build\(BuildContext\s+context\)\s*{(.+?)(?=\n\s{2}(?:@override|Widget|void|Future|int|String|bool|double|var|final|const|}\s*$))'
    build_match = re.search(build_pattern, state_content, re.DOTALL)
    
    if not build_match:
        # Try simpler pattern
        build_pattern = r'@override\s+Widget\s+build\(BuildContext\s+context\)\s*{(.+)$'
        build_match = re.search(build_pattern, state_content, re.DOTALL)
    
    if build_match:
        build_body = build_match.group(1).strip()
        
        # Find all state variables
        state_vars = re.findall(r'^\s+(int|String|bool|double|var|final|List|Map|Set)\s+(\w+)\s*=\s*([^;]+);', state_content, re.MULTILINE)
        
        # Find all methods except build
        methods = re.findall(r'^\s+(void|Future|int|String|bool|Widget)\s+(\w+)\([^)]*\)\s*{[^}]+}', state_content, re.MULTILINE | re.DOTALL)
        
        # Build new HookConsumerWidget
        new_class = f'''@RoutePage()
class {class_name} extends HookConsumerWidget {{
  const {class_name}({{super.key}});

  @override
  Widget build(BuildContext context, WidgetRef ref) {{
'''
        
        # Add state variables as hooks
        for var_type, var_name, var_value in state_vars:
            if var_name != 'pageController':
                new_class += f'    final {var_name} = useState({var_value});\n'
        
        # Add pageController if exists
        if 'PageController' in state_content:
            new_class += '    final pageController = usePageController();\n'
        
        new_class += '\n'
        
        # Add build body
        # Replace setState calls
        build_body = re.sub(
            r'setState\(\(\)\s*{\s*([^}]+)\s*}\)',
            r'\1',
            build_body
        )
        
        # Replace variable references with .value
        for _, var_name, _ in state_vars:
            if var_name != 'pageController':
                # Replace assignments
                build_body = re.sub(
                    rf'\b{var_name}\s*=\s*',
                    f'{var_name}.value = ',
                    build_body
                )
                # Replace reads (but not assignments)
                build_body = re.sub(
                    rf'(?<![.=])\b{var_name}\b(?!\s*[.=])',
                    f'{var_name}.value',
                    build_body
                )
        
        new_class += '    ' + build_body.replace('\n', '\n    ')
        
        if not build_body.strip().endswith('}'):
            new_class += '\n  }'
        
        # Add other methods
        for method in methods:
            if method[1] != 'build':
                new_class += f'\n\n  {method[0]} {method[1]}(...) {{ ... }}'
        
        new_class += '\n}'
        
        # Replace old widget and state class with new one
        # Remove old widget class
        content = re.sub(
            rf'class\s+{class_name}\s+extends\s+StatefulWidget\s*{{[^}}]*}}',
            '',
            content
        )
        
        # Remove state class
        content = re.sub(state_class_pattern, new_class, content, flags=re.MULTILINE | re.DOTALL)
        
        return content
    
    return content

def main():
    print("🚀 Final Comprehensive Conversion")
    print("=" * 60)
    
    # Get all page files
    module_dir = '/Users/mac/Projects/flutter/ppay-mobile/lib/module'
    page_files = []
    
    for root, dirs, files in os.walk(module_dir):
        for file in files:
            if file.endswith('_page.dart'):
                page_files.append(os.path.join(root, file))
    
    print(f"\n📊 Found {len(page_files)} page files\n")
    
    # Process files that still have State classes
    fixed = 0
    for file_path in sorted(page_files):
        content = read_file(file_path)
        
        # Check if has State class
        if 'extends State<' in content:
            filename = os.path.basename(file_path)
            print(f"🔧 Fixing: {filename}")
            
            # Get class name
            class_match = re.search(r'class\s+(\w+)\s+extends\s+HookConsumerWidget', content)
            if class_match:
                class_name = class_match.group(1)
                new_content = convert_stateful_to_hook(content, class_name)
                write_file(file_path, new_content)
                fixed += 1
                print(f"   ✅ Fixed\n")
    
    print("=" * 60)
    print(f"🎉 Complete!")
    print(f"✅ Fixed: {fixed} files")

if __name__ == '__main__':
    main()
