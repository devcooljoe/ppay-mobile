#!/usr/bin/env python3
import os
import re

def fix_unbalanced_braces(content):
    """Fix unbalanced braces by removing extra closing braces at the end"""
    open_count = content.count('{')
    close_count = content.count('}')
    
    if close_count > open_count:
        # Remove extra closing braces from the end
        diff = close_count - open_count
        lines = content.split('\n')
        
        # Remove extra closing braces from end
        removed = 0
        for i in range(len(lines) - 1, -1, -1):
            if removed >= diff:
                break
            if lines[i].strip() in ['}', '  }', '    }']:
                lines[i] = ''
                removed += 1
        
        content = '\n'.join(lines)
        # Clean up multiple blank lines
        content = re.sub(r'\n{3,}', '\n\n', content)
        content = content.rstrip() + '\n'
    
    return content

def convert_setstate_to_usestate(content):
    """Convert setState calls to useState hooks"""
    # Find all setState patterns
    setstate_pattern = r'setState\(\(\)\s*{\s*(\w+)\s*=\s*([^;]+);\s*}\);'
    
    matches = re.findall(setstate_pattern, content)
    
    for var_name, value in matches:
        # Replace setState with direct assignment
        content = re.sub(
            rf'setState\(\(\)\s*{{\s*{var_name}\s*=\s*{re.escape(value)};\s*}}\);',
            f'{var_name}.value = {value};',
            content
        )
    
    return content

def fix_build_signature(content):
    """Fix broken build method signatures"""
    # Fix broken signatures with trailing characters
    content = re.sub(
        r'Widget\s+build\(BuildContext\s+context,\s+WidgetRef\s+ref\)\s*{[^\w\s{].*?(?=\n)',
        r'Widget build(BuildContext context, WidgetRef ref) {',
        content
    )
    
    return content

def fix_page_file(filepath):
    """Comprehensive fix for a page file"""
    try:
        with open(filepath, 'r', encoding='utf-8') as f:
            content = f.read()
        
        original_content = content
        
        # Apply fixes
        content = fix_build_signature(content)
        content = convert_setstate_to_usestate(content)
        content = fix_unbalanced_braces(content)
        
        # Clean up
        content = re.sub(r'\n{3,}', '\n\n', content)
        content = re.sub(r'[ \t]+$', '', content, flags=re.MULTILINE)
        
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
