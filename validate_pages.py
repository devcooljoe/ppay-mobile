#!/usr/bin/env python3
import os
import re

def validate_page_file(filepath):
    """Validate a page file for common issues"""
    issues = []
    
    with open(filepath, 'r', encoding='utf-8') as f:
        content = f.read()
    
    # Check 1: Has @RoutePage()
    if '@RoutePage()' not in content:
        issues.append("Missing @RoutePage() annotation")
    
    # Check 2: Uses HookConsumerWidget or HookWidget
    if 'HookConsumerWidget' not in content and 'HookWidget' not in content:
        issues.append("Not using HookConsumerWidget or HookWidget")
    
    # Check 3: No StatefulWidget/StatelessWidget (except for internal widgets)
    if re.search(r'class\s+\w+Page\s+extends\s+(StatefulWidget|StatelessWidget)', content):
        issues.append("Page class still uses StatefulWidget/StatelessWidget")
    
    # Check 4: No setState calls
    if 'setState(' in content and 'class _' not in content:
        issues.append("Contains setState() calls")
    
    # Check 5: Proper imports
    required_imports = [
        'package:flutter/material.dart',
        'package:auto_route/auto_route.dart',
        'package:flutter_hooks/flutter_hooks.dart',
        'package:hooks_riverpod/hooks_riverpod.dart'
    ]
    
    for imp in required_imports:
        if imp not in content:
            issues.append(f"Missing import: {imp}")
    
    # Check 6: No old *ScreenRoute references
    if re.search(r'\w+ScreenRoute\(\)', content):
        issues.append("Contains old *ScreenRoute() references")
    
    # Check 7: Balanced braces
    open_count = content.count('{')
    close_count = content.count('}')
    if open_count != close_count:
        issues.append(f"Unbalanced braces: {open_count} open, {close_count} close")
    
    # Check 8: Proper build method signature
    if 'HookConsumerWidget' in content:
        if not re.search(r'Widget\s+build\(BuildContext\s+context,\s+WidgetRef\s+ref\)', content):
            issues.append("Incorrect build method signature for HookConsumerWidget")
    elif 'HookWidget' in content:
        if not re.search(r'Widget\s+build\(BuildContext\s+context\)', content):
            issues.append("Incorrect build method signature for HookWidget")
    
    return issues

def main():
    module_dir = 'lib/module'
    total_files = 0
    files_with_issues = 0
    all_issues = {}
    
    for root, dirs, files in os.walk(module_dir):
        for file in files:
            if file.endswith('_page.dart'):
                filepath = os.path.join(root, file)
                total_files += 1
                
                issues = validate_page_file(filepath)
                if issues:
                    files_with_issues += 1
                    all_issues[filepath] = issues
    
    print(f"\n{'='*60}")
    print(f"VALIDATION REPORT")
    print(f"{'='*60}")
    print(f"Total page files: {total_files}")
    print(f"Files with issues: {files_with_issues}")
    print(f"Clean files: {total_files - files_with_issues}")
    print(f"{'='*60}\n")
    
    if all_issues:
        print("FILES WITH ISSUES:\n")
        for filepath, issues in sorted(all_issues.items()):
            print(f"❌ {filepath}")
            for issue in issues:
                print(f"   - {issue}")
            print()
    else:
        print("✅ All page files are valid!")
    
    return len(all_issues)

if __name__ == '__main__':
    exit(main())
