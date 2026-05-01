#!/bin/bash

# Batch Conversion Script for Flutter Screen to Page Migration
# This script will help you convert remaining files quickly

echo "🚀 Flutter Screen to Page Batch Converter"
echo "=========================================="
echo ""

# Colors
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

# Progress tracking
CONVERTED=0
TOTAL=0

# Function to show what's been done
show_completed() {
    echo -e "${GREEN}✅ COMPLETED MODULES:${NC}"
    echo ""
    echo "Module 1: Onboarding (6/6 files)"
    echo "  ✅ splash_page.dart"
    echo "  ✅ onboard_page.dart"
    echo "  ✅ fingerprint_page.dart"
    echo "  ✅ fingerprint_complete_page.dart"
    echo "  ✅ set_up_fingerprint_page.dart"
    echo "  ✅ setting_up_fingerprint_page.dart"
    echo ""
    echo "Module 2: Auth (2/14 files - PARTIAL)"
    echo "  ✅ login_page.dart"
    echo "  ✅ signup_page.dart"
    echo "  ⏳ 12 files remaining..."
    echo ""
    echo "Module 3: Dashboard (1/4 files - PARTIAL)"
    echo "  ✅ home_page.dart"
    echo "  ⏳ 3 files remaining..."
    echo ""
    echo -e "${YELLOW}📊 Overall Progress: 9/160 files (6%)${NC}"
    echo ""
}

# Function to list remaining files by module
list_remaining() {
    echo -e "${BLUE}📋 REMAINING FILES TO CONVERT:${NC}"
    echo ""
    
    echo "Auth Module (12 files):"
    echo "  - create_password.dart → create_password_page.dart"
    echo "  - create_pin_screen.dart → create_pin_page.dart"
    echo "  - created_pin_screen.dart → created_pin_page.dart"
    echo "  - forgot_password_screen.dart → forgot_password_page.dart"
    echo "  - login_password_changed_screen.dart → login_password_changed_page.dart"
    echo "  - login_password_reset_screen.dart → login_password_reset_page.dart"
    echo "  - password_changed.dart → password_changed_page.dart"
    echo "  - password_changed_two_screen.dart → password_changed_two_page.dart"
    echo "  - passwordreset_screen.dart → passwordreset_page.dart"
    echo "  - verify_code.dart → verify_code_page.dart"
    echo "  - verify_forgot_screen.dart → verify_forgot_page.dart"
    echo "  - verify_phone.dart → verify_phone_page.dart"
    echo ""
    
    echo "Dashboard Module (3 files):"
    echo "  - route_screen.dart → route_page.dart"
    echo "  - features_screen.dart → features_page.dart"
    echo "  - notification_screen.dart → notification_page.dart"
    echo ""
    
    echo "Settings Module (18 files):"
    echo "  - All *_screen.dart and *.dart files"
    echo ""
    
    echo "Transaction Module (7 files):"
    echo "  - All *_screen.dart files"
    echo ""
    
    echo "Bills Module (23 files):"
    echo "  - All *_screen.dart files (skip tv_cable_pin_bottomsheet.dart)"
    echo ""
    
    echo "Crypto Module (15 files):"
    echo "  - All *_screen.dart files"
    echo ""
    
    echo "Gift Card Module (10 files):"
    echo "  - All *_screen.dart files"
    echo ""
    
    echo "KYC Module (7 files):"
    echo "  - All *_screen.dart files"
    echo ""
    
    echo "Shopping Module (8 files):"
    echo "  - All *_screen.dart files"
    echo ""
    
    echo "Virtual Card Module (11 files):"
    echo "  - All *_screen.dart files"
    echo ""
    
    echo "Flight Module (44 files):"
    echo "  - All *_screen.dart files (skip bottomsheets and update_flight_search_card.dart)"
    echo ""
}

# Function to show next steps
show_next_steps() {
    echo -e "${YELLOW}📝 NEXT STEPS:${NC}"
    echo ""
    echo "1. Continue converting files manually using the pattern:"
    echo "   - Rename file: *_screen.dart → *_page.dart"
    echo "   - Rename class: *Screen → *Page"
    echo "   - Add @RoutePage() annotation"
    echo "   - Convert to HookWidget or HookConsumerWidget"
    echo "   - Convert navigation to AutoRoute"
    echo ""
    echo "2. Use the example files as reference:"
    echo "   - lib/module/onboarding/splash_page.dart"
    echo "   - lib/module/onboarding/onboard_page.dart"
    echo "   - lib/module/auth/login_page.dart"
    echo "   - lib/module/auth/signup_page.dart"
    echo "   - lib/module/dashboard/home_page.dart"
    echo ""
    echo "3. Keep QUICK_REFERENCE.md open for patterns"
    echo ""
    echo "4. Update PROGRESS_TRACKER.md as you complete files"
    echo ""
    echo "5. After converting each module, run:"
    echo "   flutter pub run build_runner build --delete-conflicting-outputs"
    echo ""
    echo "6. Test frequently!"
    echo ""
}

# Function to generate a template for a new page
generate_template() {
    echo ""
    echo "Enter the old file name (e.g., forgot_password_screen.dart):"
    read old_file
    
    # Extract base name
    base_name=$(echo "$old_file" | sed 's/_screen\.dart$//' | sed 's/\.dart$//')
    
    # Convert to PascalCase for class name
    class_name=$(echo "$base_name" | sed -r 's/(^|_)([a-z])/\U\2/g')
    
    echo ""
    echo "Template for ${base_name}_page.dart:"
    echo "======================================"
    echo ""
    cat << EOF
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';

@RoutePage()
class ${class_name}Page extends HookWidget {
  const ${class_name}Page({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: Copy your widget content here
    // TODO: Convert setState to hooks
    // TODO: Convert Navigator.push to context.router.push
    
    return Scaffold(
      // Your content here
    );
  }
}
EOF
    echo ""
    echo "======================================"
    echo ""
}

# Main menu
while true; do
    echo ""
    echo "Choose an option:"
    echo "1. Show completed work"
    echo "2. List remaining files"
    echo "3. Show next steps"
    echo "4. Generate page template"
    echo "5. Count remaining *_screen.dart files"
    echo "6. Exit"
    echo ""
    echo -n "Enter choice: "
    read choice
    
    case $choice in
        1)
            show_completed
            ;;
        2)
            list_remaining
            ;;
        3)
            show_next_steps
            ;;
        4)
            generate_template
            ;;
        5)
            count=$(find lib/module -name "*_screen.dart" -type f | wc -l | tr -d ' ')
            echo ""
            echo -e "${GREEN}Remaining *_screen.dart files: $count${NC}"
            ;;
        6)
            echo ""
            echo -e "${GREEN}Good luck with your conversion! 🚀${NC}"
            exit 0
            ;;
        *)
            echo ""
            echo -e "${YELLOW}Invalid option${NC}"
            ;;
    esac
    
    echo ""
    echo -n "Press Enter to continue..."
    read
    clear
done
