#!/usr/bin/env python3
import os
import re

def fix_build_signature_and_setstate(filepath):
    """Fix build signature for HookConsumerWidget and convert setState"""
    try:
        with open(filepath, 'r', encoding='utf-8') as f:
            content = f.read()
        
        original_content = content
        
        # Check if it's HookConsumerWidget
        if 'HookConsumerWidget' in content:
            # Fix build signature - should have (BuildContext context, WidgetRef ref)
            # But currently has (BuildContext context)
            content = re.sub(
                r'(@override\s+Widget\s+build\(BuildContext\s+context)\)',
                r'\1, WidgetRef ref)',
                content
            )
        
        # Convert setState patterns to useState
        # Pattern 1: setState(() { variable = value; });
        setstate_matches = re.findall(r'setState\(\(\)\s*{\s*(\w+)\s*=\s*([^;]+);\s*}\);', content)
        for var_name, value in setstate_matches:
            # Add useState declaration if not present
            if f'{var_name} = useState' not in content and f'final {var_name} = useState' not in content:
                # Find the build method and add useState
                build_match = re.search(r'(@override\s+Widget\s+build\([^)]+\)\s*{)', content)
                if build_match:
                    # Add useState declaration after build method opening
                    use_state_line = f'\n    final {var_name} = useState(0);\n'
                    content = content[:build_match.end()] + use_state_line + content[build_match.end():]
            
            # Replace setState with direct assignment
            content = re.sub(
                rf'setState\(\(\)\s*{{\s*{var_name}\s*=\s*{re.escape(value)};\s*}}\);',
                f'{var_name}.value = {value};',
                content
            )
        
        # Pattern 2: setState(() => variable = value);
        setstate_matches2 = re.findall(r'setState\(\(\)\s*=>\s*(\w+)\s*=\s*([^;)]+)\);', content)
        for var_name, value in setstate_matches2:
            content = re.sub(
                rf'setState\(\(\)\s*=>\s*{var_name}\s*=\s*{re.escape(value)}\);',
                f'{var_name}.value = {value};',
                content
            )
        
        if content != original_content:
            with open(filepath, 'w', encoding='utf-8') as f:
                f.write(content)
            return True, None
        return False, None
    except Exception as e:
        return False, str(e)

def main():
    # List of files with issues from validation
    files_with_issues = [
        'lib/module/auth/create_pin_page.dart',
        'lib/module/auth/forgot_password_page.dart',
        'lib/module/auth/verify_forgot_page.dart',
        'lib/module/bills/airtime_page.dart',
        'lib/module/bills/bet_page.dart',
        'lib/module/bills/data_page.dart',
        'lib/module/bills/electricity_page.dart',
        'lib/module/bills/payment_page.dart',
        'lib/module/bills/tv_cable_page.dart',
        'lib/module/crypto/buy_crypto_page.dart',
        'lib/module/crypto/sell_crypto_page.dart',
        'lib/module/dashboard/route_page.dart',
        'lib/module/flight/active_flight_page.dart',
        'lib/module/flight/boarding_pass_page.dart',
        'lib/module/flight/flight_book_page.dart',
        'lib/module/flight/flight_payment_page.dart',
        'lib/module/flight/flight_two_payment_page.dart',
        'lib/module/flight/multi_payment_page.dart',
        'lib/module/flight/past_flight_screens_page.dart',
        'lib/module/gift_card/buy_gift_card_features_page.dart',
        'lib/module/kyc/bvnconfirm_page.dart',
        'lib/module/onboarding/onboard_page.dart',
        'lib/module/settings/edit_account_page.dart',
        'lib/module/settings/pin_reset_page.dart',
        'lib/module/settings/settings_page.dart',
        'lib/module/shopping/check_out_page.dart',
        'lib/module/shopping/cloths_details_page.dart',
        'lib/module/shopping/shopping_page.dart',
        'lib/module/transaction/amount_and_info_page.dart',
        'lib/module/transaction/transfer_funds_page.dart',
        'lib/module/virtual_card/card_page.dart',
        'lib/module/virtual_card/fund_card_page.dart',
    ]
    
    fixed_count = 0
    error_count = 0
    
    for filepath in files_with_issues:
        if os.path.exists(filepath):
            fixed, error = fix_build_signature_and_setstate(filepath)
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
