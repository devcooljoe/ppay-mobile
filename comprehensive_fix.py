#!/usr/bin/env python3
import os
import re

def fix_page_file(filepath):
    """Fix all issues in a converted page file"""
    with open(filepath, 'r', encoding='utf-8') as f:
        content = f.read()
    
    original_content = content
    
    # Issue 1: Remove orphaned closing parenthesis and semicolon at top
    content = re.sub(r'^\s*\);\s*$', '', content, flags=re.MULTILINE)
    
    # Issue 2: Remove old StatefulWidget remnants
    content = re.sub(r'@override\s+State<\w+>\s+createState\(\)\s*=>\s*_\w+State\(\);\s*}', '', content, flags=re.MULTILINE | re.DOTALL)
    content = re.sub(r'class\s+_\w+State\s+extends\s+State<\w+>\s*{', '', content)
    
    # Issue 3: Fix incomplete build method signature
    content = re.sub(
        r'Widget build\(BuildContext context, WidgetRef ref\)\s*{/\"',
        r'Widget build(BuildContext context, WidgetRef ref) {',
        content
    )
    
    # Issue 4: Fix broken onPressed handlers
    content = re.sub(
        r'onPressed:\s*\(\)\s*{\s*}\s*},',
        r'onPressed: () {},',
        content
    )
    
    # Issue 5: Remove empty State class definitions
    content = re.sub(r'class\s+_\w+State\s+extends\s+State<\w+>\s*{\s*@override\s+void\s+initState\(\)', 
                     r'@override\nvoid initState()', content)
    
    # Issue 6: Fix SplashPage - convert initState to useEffect
    if 'SplashPage' in filepath:
        # Remove State class completely
        content = re.sub(r'class\s+_SplashScreenState.*?(?=@override\s+Widget\s+build)', '', content, flags=re.DOTALL)
        
        # Add useEffect for navigation
        if 'useEffect' not in content:
            build_match = re.search(r'(@override\s+Widget\s+build\(BuildContext\s+context,\s+WidgetRef\s+ref\)\s*{)', content)
            if build_match:
                effect_code = '''
    useEffect(() {
      Future.delayed(Duration(seconds: 3), () {
        if (context.mounted) {
          context.router.push(OnboardRoute());
        }
      });
      return null;
    }, []);

'''
                content = content[:build_match.end()] + effect_code + content[build_match.end():]
    
    # Issue 7: Fix route names (ScreenRoute -> Route)
    content = re.sub(r'(\w+)ScreenRoute\(\)', r'\1Route()', content)
    
    # Issue 8: Clean up multiple blank lines
    content = re.sub(r'\n{3,}', '\n\n', content)
    
    # Issue 9: Remove trailing whitespace
    content = re.sub(r'[ \t]+$', '', content, flags=re.MULTILINE)
    
    # Issue 10: Ensure proper @RoutePage() placement
    if '@RoutePage()' in content:
        # Remove duplicate @RoutePage()
        content = re.sub(r'(@RoutePage\(\)\s*)+', r'@RoutePage()\n', content)
        
        # Ensure @RoutePage() is right before class definition
        content = re.sub(
            r'(@RoutePage\(\))\s*\n+\s*(class\s+\w+Page\s+extends\s+(?:HookConsumerWidget|HookWidget))',
            r'\1\n\2',
            content
        )
    
    # Only write if changes were made
    if content != original_content:
        with open(filepath, 'w', encoding='utf-8') as f:
            f.write(content)
        return True
    return False

def main():
    module_dir = 'lib/module'
    fixed_count = 0
    error_count = 0
    
    for root, dirs, files in os.walk(module_dir):
        for file in files:
            if file.endswith('_page.dart'):
                filepath = os.path.join(root, file)
                try:
                    if fix_page_file(filepath):
                        fixed_count += 1
                        print(f"✓ Fixed: {filepath}")
                except Exception as e:
                    error_count += 1
                    print(f"✗ Error in {filepath}: {e}")
    
    print(f"\n{'='*60}")
    print(f"Fixed: {fixed_count} files")
    print(f"Errors: {error_count} files")
    print(f"{'='*60}")

if __name__ == '__main__':
    main()
