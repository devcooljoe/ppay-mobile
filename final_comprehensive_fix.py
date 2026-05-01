#!/usr/bin/env python3
import os
import re

def count_braces(content):
    """Count opening and closing braces"""
    open_count = content.count('{')
    close_count = content.count('}')
    return open_count, close_count

def fix_closing_braces(content):
    """Fix missing closing braces"""
    # Check if file ends with incomplete closing
    if re.search(r'}\s*$', content):
        # Count braces
        open_count, close_count = count_braces(content)
        
        if open_count > close_count:
            # Add missing closing braces
            diff = open_count - close_count
            content = content.rstrip()
            content += '\n' + ('  }\n' * (diff - 1)) + '}\n'
    
    return content

def fix_page_file(filepath):
    """Comprehensive fix for page files"""
    try:
        with open(filepath, 'r', encoding='utf-8') as f:
            content = f.read()
        
        original_content = content
        
        # Fix 1: Remove orphaned lines at top
        content = re.sub(r'^\s*\);\s*\n', '', content)
        
        # Fix 2: Remove State class remnants
        content = re.sub(r'@override\s+State<\w+>\s+createState\(\)\s*=>\s*_\w+State\(\);\s*}\s*\n', '', content)
        content = re.sub(r'class\s+_\w+State\s+extends\s+State<\w+>\s*{\s*', '', content)
        
        # Fix 3: Fix broken build signatures
        content = re.sub(r'Widget\s+build\(BuildContext\s+context,\s+WidgetRef\s+ref\)\s*{[/\"]+', 
                        r'Widget build(BuildContext context, WidgetRef ref) {', content)
        
        # Fix 4: Fix broken onPressed
        content = re.sub(r'onPressed:\s*\(\)\s*{\s*}\s*},', r'onPressed: () {},', content)
        
        # Fix 5: Fix route names
        content = re.sub(r'(\w+)ScreenRoute\(\)', r'\1Route()', content)
        
        # Fix 6: Fix incomplete closing at end
        content = re.sub(r'\),\s*}\s*}\s*$', r'        ),\n      ),\n    );\n  }\n}\n', content)
        content = re.sub(r'\s*}\s*}\s*$', r'  }\n}\n', content)
        
        # Fix 7: Fix closing braces
        content = fix_closing_braces(content)
        
        # Fix 8: Clean up whitespace
        content = re.sub(r'\n{3,}', '\n\n', content)
        content = re.sub(r'[ \t]+$', '', content, flags=re.MULTILINE)
        
        # Fix 9: Ensure proper @RoutePage placement
        content = re.sub(r'(@RoutePage\(\))\s*\n+\s*(class\s+\w+Page)', r'\1\n\2', content)
        
        # Only write if changed
        if content != original_content:
            with open(filepath, 'w', encoding='utf-8') as f:
                f.write(content)
            return True, None
        return False, None
    except Exception as e:
        return False, str(e)

def main():
    module_dir = 'lib/module'
    fixed_count = 0
    error_count = 0
    
    for root, dirs, files in os.walk(module_dir):
        for file in files:
            if file.endswith('_page.dart'):
                filepath = os.path.join(root, file)
                fixed, error = fix_page_file(filepath)
                if error:
                    error_count += 1
                    print(f"✗ {filepath}: {error}")
                elif fixed:
                    fixed_count += 1
                    print(f"✓ {filepath}")
    
    print(f"\n{'='*60}")
    print(f"Fixed: {fixed_count} files")
    print(f"Errors: {error_count} files")
    print(f"{'='*60}")

if __name__ == '__main__':
    main()
