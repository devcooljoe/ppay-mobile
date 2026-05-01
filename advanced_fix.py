#!/usr/bin/env python3
import os
import re

def fix_splash_page(content):
    """Special handling for SplashPage with useEffect"""
    # Remove all State class remnants
    content = re.sub(r'}\s*@override\s+void\s+initState\(\).*?super\.initState\(\);\s*}', '', content, flags=re.DOTALL)
    
    # Find the build method
    build_pattern = r'(@override\s+Widget\s+build\(BuildContext\s+context,\s+WidgetRef\s+ref\)\s*{)'
    build_match = re.search(build_pattern, content)
    
    if build_match and 'useEffect' not in content:
        # Add useEffect hook
        effect_code = '''
    useEffect(() {
      Future.delayed(const Duration(seconds: 3), () {
        if (context.mounted) {
          context.router.push(const OnboardRoute());
        }
      });
      return null;
    }, []);
'''
        content = content[:build_match.end()] + effect_code + content[build_match.end():]
    
    # Fix closing braces
    content = re.sub(r'}\s*}\s*$', '  }\n}\n', content)
    
    return content

def fix_page_structure(content):
    """Fix structural issues in page files"""
    
    # Remove orphaned closing braces and semicolons at top
    content = re.sub(r'^\s*\);\s*$', '', content, flags=re.MULTILINE)
    
    # Remove State class remnants completely
    content = re.sub(r'@override\s+State<\w+>\s+createState\(\)\s*=>\s*_\w+State\(\);\s*}', '', content)
    content = re.sub(r'class\s+_\w+State\s+extends\s+State<\w+>\s*{', '', content)
    
    # Fix broken build method signatures
    content = re.sub(
        r'Widget\s+build\(BuildContext\s+context,\s+WidgetRef\s+ref\)\s*{[/\"]+',
        r'Widget build(BuildContext context, WidgetRef ref) {',
        content
    )
    
    # Fix broken onPressed handlers
    content = re.sub(r'onPressed:\s*\(\)\s*{\s*}\s*},', r'onPressed: () {},', content)
    
    # Fix route names
    content = re.sub(r'(\w+)ScreenRoute\(\)', r'\1Route()', content)
    
    # Fix missing closing braces for build method
    # Count opening and closing braces
    open_count = content.count('{')
    close_count = content.count('}')
    
    if open_count > close_count:
        diff = open_count - close_count
        content = content.rstrip() + '\n' + ('  }\n' * diff)
    
    # Clean up multiple blank lines
    content = re.sub(r'\n{3,}', '\n\n', content)
    
    # Remove trailing whitespace
    content = re.sub(r'[ \t]+$', '', content, flags=re.MULTILINE)
    
    # Ensure proper @RoutePage() placement
    content = re.sub(r'(@RoutePage\(\))\s*\n+\s*(class\s+\w+Page)', r'\1\n\2', content)
    
    return content

def fix_page_file(filepath):
    """Fix all issues in a page file"""
    try:
        with open(filepath, 'r', encoding='utf-8') as f:
            content = f.read()
        
        original_content = content
        
        # Special handling for splash_page
        if 'splash_page.dart' in filepath:
            content = fix_splash_page(content)
        else:
            content = fix_page_structure(content)
        
        # Only write if changes were made
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
    errors = []
    
    for root, dirs, files in os.walk(module_dir):
        for file in files:
            if file.endswith('_page.dart'):
                filepath = os.path.join(root, file)
                fixed, error = fix_page_file(filepath)
                if error:
                    error_count += 1
                    errors.append(f"{filepath}: {error}")
                    print(f"✗ Error: {filepath}")
                elif fixed:
                    fixed_count += 1
                    print(f"✓ Fixed: {filepath}")
    
    print(f"\n{'='*60}")
    print(f"Fixed: {fixed_count} files")
    print(f"Errors: {error_count} files")
    if errors:
        print("\nErrors:")
        for err in errors:
            print(f"  - {err}")
    print(f"{'='*60}")

if __name__ == '__main__':
    main()
