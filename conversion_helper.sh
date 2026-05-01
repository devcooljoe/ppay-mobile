#!/bin/bash

# Flutter Screen to Page Conversion Helper Script
# This script provides utilities to help with the conversion process

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to print colored output
print_color() {
    color=$1
    message=$2
    echo -e "${color}${message}${NC}"
}

# Function to show menu
show_menu() {
    clear
    print_color "$BLUE" "=================================="
    print_color "$BLUE" "Flutter Conversion Helper"
    print_color "$BLUE" "=================================="
    echo ""
    echo "1. Count remaining *_screen.dart files"
    echo "2. List all *_screen.dart files"
    echo "3. Find files importing old screens"
    echo "4. Run build_runner"
    echo "5. Clean and rebuild project"
    echo "6. Show conversion progress"
    echo "7. Backup project"
    echo "8. Exit"
    echo ""
    echo -n "Choose an option: "
}

# Function to count remaining screen files
count_screens() {
    print_color "$YELLOW" "\nCounting remaining *_screen.dart files..."
    count=$(find lib/module -name "*_screen.dart" -type f | wc -l | tr -d ' ')
    print_color "$GREEN" "Found $count files still to convert"
    
    echo ""
    print_color "$YELLOW" "Breakdown by module:"
    for dir in lib/module/*/; do
        module=$(basename "$dir")
        module_count=$(find "$dir" -name "*_screen.dart" -type f | wc -l | tr -d ' ')
        if [ "$module_count" -gt 0 ]; then
            echo "  $module: $module_count files"
        fi
    done
}

# Function to list all screen files
list_screens() {
    print_color "$YELLOW" "\nListing all *_screen.dart files:"
    find lib/module -name "*_screen.dart" -type f | sort
}

# Function to find imports of old screens
find_old_imports() {
    print_color "$YELLOW" "\nSearching for imports of *_screen.dart files..."
    grep -r "import.*_screen.dart" lib/ --include="*.dart" | grep -v "splash_screen.dart" | head -20
    echo ""
    print_color "$GREEN" "Showing first 20 results. Run 'grep -r \"import.*_screen.dart\" lib/' for full list"
}

# Function to run build_runner
run_build_runner() {
    print_color "$YELLOW" "\nRunning build_runner..."
    flutter pub run build_runner build --delete-conflicting-outputs
    
    if [ $? -eq 0 ]; then
        print_color "$GREEN" "✓ Build runner completed successfully"
    else
        print_color "$RED" "✗ Build runner failed"
    fi
}

# Function to clean and rebuild
clean_rebuild() {
    print_color "$YELLOW" "\nCleaning project..."
    flutter clean
    
    print_color "$YELLOW" "Getting dependencies..."
    flutter pub get
    
    print_color "$YELLOW" "Running build_runner..."
    flutter pub run build_runner build --delete-conflicting-outputs
    
    print_color "$YELLOW" "Building app..."
    flutter build apk --debug
    
    if [ $? -eq 0 ]; then
        print_color "$GREEN" "✓ Clean rebuild completed successfully"
    else
        print_color "$RED" "✗ Clean rebuild failed"
    fi
}

# Function to show progress
show_progress() {
    print_color "$YELLOW" "\nCalculating conversion progress..."
    
    total_files=160
    screen_files=$(find lib/module -name "*_screen.dart" -type f | wc -l | tr -d ' ')
    page_files=$(find lib/module -name "*_page.dart" -type f | wc -l | tr -d ' ')
    converted=$((total_files - screen_files))
    percentage=$((converted * 100 / total_files))
    
    print_color "$BLUE" "\n=================================="
    print_color "$BLUE" "Conversion Progress"
    print_color "$BLUE" "=================================="
    echo "Total files: $total_files"
    echo "Converted: $converted"
    echo "Remaining: $screen_files"
    echo "Progress: $percentage%"
    print_color "$BLUE" "=================================="
    
    # Progress bar
    filled=$((percentage / 2))
    empty=$((50 - filled))
    printf "\n["
    printf "%${filled}s" | tr ' ' '='
    printf "%${empty}s" | tr ' ' '-'
    printf "] $percentage%%\n\n"
}

# Function to backup project
backup_project() {
    print_color "$YELLOW" "\nCreating backup..."
    timestamp=$(date +%Y%m%d_%H%M%S)
    git add .
    git commit -m "Backup before conversion - $timestamp"
    
    if [ $? -eq 0 ]; then
        print_color "$GREEN" "✓ Backup created successfully"
    else
        print_color "$YELLOW" "Note: No changes to commit or git not initialized"
    fi
}

# Main loop
while true; do
    show_menu
    read choice
    
    case $choice in
        1)
            count_screens
            ;;
        2)
            list_screens
            ;;
        3)
            find_old_imports
            ;;
        4)
            run_build_runner
            ;;
        5)
            clean_rebuild
            ;;
        6)
            show_progress
            ;;
        7)
            backup_project
            ;;
        8)
            print_color "$GREEN" "\nGoodbye! Happy coding! 🚀"
            exit 0
            ;;
        *)
            print_color "$RED" "\nInvalid option. Please try again."
            ;;
    esac
    
    echo ""
    echo -n "Press Enter to continue..."
    read
done
