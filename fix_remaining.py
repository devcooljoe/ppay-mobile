#!/usr/bin/env python3
import os
import re

def fix_remaining_issues(filepath):
    """Fix remaining setState and brace issues"""
    try:
        with open(filepath, 'r', encoding='utf-8') as f:
            content = f.read()
        
        original_content = content
        
        # Fix all setState patterns more aggressively
        # Pattern: setState(() { ... });
        content = re.sub(r'setState\(\(\)\s*{\s*', '', content)
        content = re.sub(r'}\s*\);', ';', content)
        
        # Fix unbalanced braces
        open_count = content.count('{')
        close_count = content.count('}')
        
        if close_count > open_count:
            diff = close_count - open_count
            lines = content.split('\n')
            removed = 0
            for i in range(len(lines) - 1, -1, -1):
                if removed >= diff:
                    break
                if lines[i].strip() in ['}', '  }', '    }', '      }']:
                    lines[i] = ''
                    removed += 1
            content = '\n'.join(lines)
            content = re.sub(r'\n{3,}', '\n\n', content)
            content = content.rstrip() + '\n'
        
        # Clean up
        content = re.sub(r'[ \t]+$', '', content, flags=re.MULTILINE)
        
        if content != original_content:
            with open(filepath, 'w', encoding='utf-8') as f:
                f.write(content)
            return True, None
        return False, None
    except Exception as e:
        return False, str(e)

def main():
    files_with_issues = [
        'lib/module/auth/create_pin_page.dart',
        'lib/module/bills/airtime_page.dart',
        'lib/module/bills/bet_page.dart',
        'lib/module/bills/data_page.dart',
        'lib/module/bills/electricity_page.dart',
        'lib/module/bills/tv_cable_page.dart',
        'lib/module/crypto/buy_crypto_page.dart',
        'lib/module/crypto/sell_crypto_page.dart',
        'lib/module/flight/flight_payment_page.dart',
        'lib/module/flight/flight_two_payment_page.dart',
        'lib/module/flight/multi_payment_page.dart',
        'lib/module/kyc/bvnconfirm_page.dart',
        'lib/module/kyc/kyc_verification_complete_page.dart',
        'lib/module/settings/edit_account_page.dart',
        'lib/module/settings/pin_reset_page.dart',
        'lib/module/transaction/amount_and_info_page.dart',
        'lib/module/transaction/transaction_history_page.dart',
        'lib/module/transaction/transfer_funds_page.dart',
        'lib/module/virtual_card/fund_card_page.dart',
    ]
    
    fixed_count = 0
    error_count = 0
    
    for filepath in files_with_issues:
        if os.path.exists(filepath):
            fixed, error = fix_remaining_issues(filepath)
            if error:
                error_count += 1
                print(f"✗ {filepath}: {error}")
            elif fixed:
                fixed_count += 1
                print(f"✓ {filepath}")
        else:
            print(f"⚠ File not found: {filepath}")
    
    print(f"\n{'='*60}")
    print(f"Fixed: {fixed_count} files")
    print(f"Errors: {error_count} files")
    print(f"{'='*60}")

if __name__ == '__main__':
    main()
