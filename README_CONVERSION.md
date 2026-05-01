# Flutter Project Conversion: Screens → Pages with Hooks & AutoRoute

## 📋 Project Overview

This project involves converting a Flutter application from traditional StatefulWidget/StatelessWidget architecture to a modern hooks-based architecture with AutoRoute navigation.

### What's Being Changed:
1. **File Names**: `*_screen.dart` → `*_page.dart`
2. **Class Names**: `*Screen` → `*Page`
3. **Widgets**: StatefulWidget/StatelessWidget → HookWidget/HookConsumerWidget
4. **Navigation**: MaterialPageRoute → AutoRoute
5. **State Management**: setState → Hooks (useState, useEffect, etc.)

## 📚 Documentation Files

### 1. **CONVERSION_GUIDE.md** ⭐ START HERE
Complete guide with:
- Conversion rules
- Code examples
- Hooks patterns
- AutoRoute setup
- Common issues & solutions

### 2. **QUICK_REFERENCE.md** 🚀 KEEP THIS OPEN
Quick lookup for:
- Conversion patterns
- Hook examples
- Navigation syntax
- Common errors & fixes

### 3. **CONVERSION_SUMMARY.md** 📊 YOUR ROADMAP
Detailed breakdown:
- Phase-by-phase plan
- Time estimates
- Module-by-module checklist
- Tips for success

### 4. **PROGRESS_TRACKER.md** ✅ TRACK YOUR WORK
Interactive checklist:
- All 160+ files listed
- Check off as you complete
- Progress percentage
- Time tracking

## 🎯 Example Files (Reference These!)

I've converted 5 key files as complete examples:

### 1. `/lib/module/onboarding/splash_page.dart`
- Simple HookConsumerWidget
- Shows basic structure
- AutoRoute annotation

### 2. `/lib/module/onboarding/onboard_page.dart`
- HookWidget with useState
- PageController with hooks
- Complex state management example

### 3. `/lib/module/auth/login_page.dart`
- Form handling
- Navigation conversion
- Simple page structure

### 4. `/lib/module/auth/signup_page.dart`
- Multiple form fields
- Navigation between pages
- TouchOpacity usage

### 5. `/lib/module/dashboard/home_page.dart` ⭐ MOST COMPLEX
- useMemoized for lists
- Multiple navigation calls
- Bottom sheet integration
- Complex UI structure

## 🚀 Quick Start Guide

### Step 1: Read the Documentation (30 min)
```bash
1. Read CONVERSION_GUIDE.md (15 min)
2. Skim QUICK_REFERENCE.md (5 min)
3. Read CONVERSION_SUMMARY.md (10 min)
```

### Step 2: Study the Examples (30 min)
```bash
1. Open splash_page.dart - understand basic structure
2. Open onboard_page.dart - see hooks in action
3. Open home_page.dart - study complex example
```

### Step 3: Start Converting (Module by Module)
```bash
1. Open PROGRESS_TRACKER.md
2. Start with Onboarding module (easiest)
3. Check off each file as you complete it
4. Commit after each module
```

### Step 4: Test & Fix
```bash
flutter clean
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
flutter run
```

## 📦 Project Structure

```
lib/
├── app/
│   └── router/
│       └── app_router.dart          ← AutoRoute configuration
├── module/
│   ├── auth/                        ← 14 files to convert
│   ├── bills/                       ← 23 files to convert
│   ├── crypto/                      ← 15 files to convert
│   ├── dashboard/                   ← 4 files to convert
│   ├── flight/                      ← 44 files to convert (largest!)
│   ├── gift_card/                   ← 10 files to convert
│   ├── kyc/                         ← 7 files to convert
│   ├── onboarding/                  ← 6 files to convert
│   ├── settings/                    ← 18 files to convert
│   ├── shopping/                    ← 8 files to convert
│   ├── transaction/                 ← 7 files to convert
│   └── virtual_card/                ← 11 files to convert
└── shared/
    └── widgets/                     ← Convert to hooks, but NO @RoutePage()

CONVERSION_GUIDE.md                  ← Complete guide
QUICK_REFERENCE.md                   ← Quick lookup
CONVERSION_SUMMARY.md                ← Detailed plan
PROGRESS_TRACKER.md                  ← Checklist
```

## 🎓 Learning Path

### Beginner Level (Start Here)
1. Read CONVERSION_GUIDE.md sections:
   - "Conversion Rules"
   - "Widget Conversion"
   - "Navigation Conversion"

2. Study these example files:
   - `splash_page.dart` (simplest)
   - `login_page.dart` (forms)

3. Convert these modules first:
   - Onboarding (6 files)
   - Auth (14 files)

### Intermediate Level
1. Read CONVERSION_GUIDE.md sections:
   - "Common Hooks Patterns"
   - "AutoRoute Setup"

2. Study these example files:
   - `onboard_page.dart` (hooks)
   - `signup_page.dart` (complex forms)

3. Convert these modules:
   - Dashboard (4 files)
   - Settings (18 files)
   - Transaction (7 files)

### Advanced Level
1. Read all documentation thoroughly

2. Study this example file:
   - `home_page.dart` (most complex)

3. Convert these modules:
   - Bills (23 files)
   - Crypto (15 files)
   - Flight (44 files - largest!)
   - Gift Card (10 files)
   - KYC (7 files)
   - Shopping (8 files)
   - Virtual Card (11 files)

## ⏱️ Time Estimates

| Phase | Task | Time |
|-------|------|------|
| 1 | Setup & Learning | 1 hour |
| 2 | Easy Modules (Onboarding, Auth, Dashboard) | 2-3 hours |
| 3 | Medium Modules (Settings, Transaction) | 2-3 hours |
| 4 | Complex Modules (Bills, Crypto, etc.) | 4-6 hours |
| 5 | Flight Module (largest) | 2-3 hours |
| 6 | Update Imports | 2-3 hours |
| 7 | AutoRoute Setup | 1 hour |
| 8 | Testing & Fixes | 2-3 hours |
| **TOTAL** | | **16-23 hours** |

Spread over 3-4 days for best results.

## ✅ Conversion Checklist (Per File)

For each file, follow this process:

1. **Prepare**
   - [ ] Open the file
   - [ ] Identify if it's StatefulWidget or StatelessWidget
   - [ ] Check if it needs state management

2. **Rename**
   - [ ] Rename file: `*_screen.dart` → `*_page.dart`
   - [ ] Rename class: `*Screen` → `*Page`

3. **Add Imports**
   - [ ] `import 'package:auto_route/auto_route.dart';`
   - [ ] `import 'package:flutter_hooks/flutter_hooks.dart';`
   - [ ] `import 'package:hooks_riverpod/hooks_riverpod.dart';` (if needed)

4. **Convert Widget**
   - [ ] Add `@RoutePage()` annotation
   - [ ] Convert to HookWidget or HookConsumerWidget
   - [ ] Remove State class (if StatefulWidget)
   - [ ] Update build method signature

5. **Convert State**
   - [ ] Replace `setState` with `useState`
   - [ ] Replace `initState` with `useEffect`
   - [ ] Replace controllers with `use*Controller` hooks

6. **Convert Navigation**
   - [ ] Replace `Navigator.push` with `context.router.push`
   - [ ] Replace `Navigator.pop` with `context.router.pop`

7. **Test**
   - [ ] File compiles without errors
   - [ ] Update imports in other files
   - [ ] Test the page works

8. **Commit**
   - [ ] `git add .`
   - [ ] `git commit -m "Convert [module]: [file] to page with hooks"`

## 🛠️ Tools & Commands

### Build Runner (Generate AutoRoute files)
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

### Clean Build
```bash
flutter clean
flutter pub get
flutter run
```

### Find Old Imports
```bash
grep -r "import.*_screen.dart" lib/
```

### Count Remaining Files
```bash
find lib/module -name "*_screen.dart" | wc -l
```

## 🐛 Common Issues

### Issue 1: "The method 'push' isn't defined"
**Solution:** Import AutoRoute
```dart
import 'package:auto_route/auto_route.dart';
```

### Issue 2: "setState called after dispose"
**Solution:** Use hooks instead
```dart
final counter = useState(0);
counter.value++;  // No setState needed
```

### Issue 3: "Route not found"
**Solution:** Generate routes
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

### Issue 4: Build method signature error
**Solution:** Check widget type
- HookWidget: `Widget build(BuildContext context)`
- HookConsumerWidget: `Widget build(BuildContext context, WidgetRef ref)`

## 📊 Progress Tracking

Update PROGRESS_TRACKER.md as you go:
- Check off completed files
- Track time spent
- Note any issues

## 🎉 Success Criteria

You're done when:
- [ ] All 160+ files converted
- [ ] All imports updated
- [ ] AutoRoute configured
- [ ] App builds without errors
- [ ] All navigation works
- [ ] All pages load correctly
- [ ] No setState errors
- [ ] All tests pass

## 💡 Tips for Success

1. **Work in small batches** - One module at a time
2. **Commit frequently** - After each module
3. **Test as you go** - Don't wait until the end
4. **Use the examples** - Refer to the 5 files I converted
5. **Keep QUICK_REFERENCE.md open** - For quick lookups
6. **Take breaks** - This is a marathon, not a sprint
7. **Ask for help** - If you get stuck
8. **Stay organized** - Use PROGRESS_TRACKER.md

## 📞 Need Help?

If you get stuck:
1. Check QUICK_REFERENCE.md
2. Look at the example files
3. Read the relevant section in CONVERSION_GUIDE.md
4. Check the "Common Issues" section
5. Ask for help with specific error messages

## 🎯 Next Steps

1. ✅ Read this README
2. ✅ Read CONVERSION_GUIDE.md
3. ✅ Study the 5 example files
4. ✅ Open PROGRESS_TRACKER.md
5. ✅ Start with Onboarding module
6. ✅ Work through each module systematically
7. ✅ Test frequently
8. ✅ Celebrate when done! 🎉

Good luck! You've got this! 💪
