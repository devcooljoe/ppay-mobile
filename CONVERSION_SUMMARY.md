# Project Conversion Summary

## What I've Done

### 1. Created Reference Files
I've converted several key files as complete examples:

#### ✅ Completed Conversions:
- `/lib/module/onboarding/splash_page.dart` - HookConsumerWidget example
- `/lib/module/onboarding/onboard_page.dart` - HookWidget with useState example
- `/lib/module/auth/login_page.dart` - HookWidget example
- `/lib/module/auth/signup_page.dart` - HookWidget example

#### 📄 Documentation Created:
- `/CONVERSION_GUIDE.md` - Complete conversion guide with examples
- `/convert_to_pages.py` - Python script for automation (needs customization)
- `/app/router/app_router.dart` - AutoRoute configuration starter

## What You Need to Do

### Phase 1: Setup & Preparation (30 minutes)

1. **Backup your project**
   ```bash
   git add .
   git commit -m "Before screen to page conversion"
   ```

2. **Review the example files I created**
   - Look at `splash_page.dart`, `onboard_page.dart`, `login_page.dart`, `signup_page.dart`
   - Understand the pattern

3. **Read the CONVERSION_GUIDE.md**
   - Understand the conversion rules
   - Note the hooks patterns

### Phase 2: Module-by-Module Conversion (8-12 hours)

Convert files in this order (easiest to hardest):

#### 1. Onboarding Module (30 min)
Files to convert:
- ✅ `splash_screen.dart` → `splash_page.dart` (DONE)
- ✅ `onboard_screen.dart` → `onboard_page.dart` (DONE)
- `fingerprint_screen.dart` → `fingerprint_page.dart`
- `fingerprint_complete.dart` → `fingerprint_complete_page.dart`
- `set_up_fingerprint.dart` → `set_up_fingerprint_page.dart`
- `setting_up_fingerprint.dart` → `setting_up_fingerprint_page.dart`

#### 2. Auth Module (1 hour)
Files to convert:
- ✅ `login_screen.dart` → `login_page.dart` (DONE)
- ✅ `signup_screen.dart` → `signup_page.dart` (DONE)
- `create_password.dart` → `create_password_page.dart`
- `create_pin_screen.dart` → `create_pin_page.dart`
- `created_pin_screen.dart` → `created_pin_page.dart`
- `forgot_password_screen.dart` → `forgot_password_page.dart`
- `login_password_changed_screen.dart` → `login_password_changed_page.dart`
- `login_password_reset_screen.dart` → `login_password_reset_page.dart`
- `password_changed.dart` → `password_changed_page.dart`
- `password_changed_two_screen.dart` → `password_changed_two_page.dart`
- `passwordreset_screen.dart` → `passwordreset_page.dart`
- `verify_code.dart` → `verify_code_page.dart`
- `verify_forgot_screen.dart` → `verify_forgot_page.dart`
- `verify_phone.dart` → `verify_phone_page.dart`

#### 3. Dashboard Module (1 hour)
- `home_screen.dart` → `home_page.dart`
- `route_screen.dart` → `route_page.dart`
- `features_screen.dart` → `features_page.dart`
- `notification_screen.dart` → `notification_page.dart`

#### 4. Settings Module (1 hour)
- `settings_screen.dart` → `settings_page.dart`
- `profile_screen.dart` → `profile_page.dart`
- `privacy_screen.dart` → `privacy_page.dart`
- `refer_screen.dart` → `refer_page.dart`
- `bank_accounts.dart` → `bank_accounts_page.dart`
- `change_password.dart` → `change_password_page.dart`
- `contact.dart` → `contact_page.dart`
- `edit_account.dart` → `edit_account_page.dart`
- `edit_profile.dart` → `edit_profile_page.dart`
- `faq.dart` → `faq_page.dart`
- `help_and_support.dart` → `help_and_support_page.dart`
- `notification.dart` → `notification_page.dart`
- `pin_reset.dart` → `pin_reset_page.dart`
- `pin_reset_complete.dart` → `pin_reset_complete_page.dart`
- `reset_password.dart` → `reset_password_page.dart`
- `terms_and_conditions.dart` → `terms_and_conditions_page.dart`
- `transaction_limit.dart` → `transaction_limit_page.dart`
- `veriify_password_details.dart` → `verify_password_details_page.dart`

#### 5. Transaction Module (45 min)
- `amount_and_info_screen.dart` → `amount_and_info_page.dart`
- `confirm_transaction_screen.dart` → `confirm_transaction_page.dart`
- `fund_wallet_screen.dart` → `fund_wallet_page.dart`
- `receipt_screen.dart` → `receipt_page.dart`
- `transaction_history_screen.dart` → `transaction_history_page.dart`
- `transaction_successful_screen.dart` → `transaction_successful_page.dart`
- `transfer_funds_screen.dart` → `transfer_funds_page.dart`

#### 6. Bills Module (1.5 hours)
- All `*_screen.dart` files → `*_page.dart`
- SKIP: `tv_cable_pin_bottomsheet.dart` (it's a bottom sheet, not a page)

#### 7. Crypto Module (1 hour)
- All `*_screen.dart` files → `*_page.dart`

#### 8. Gift Card Module (45 min)
- All `*_screen.dart` files → `*_page.dart`

#### 9. KYC Module (45 min)
- All `*_screen.dart` files → `*_page.dart`

#### 10. Shopping Module (45 min)
- All `*_screen.dart` files → `*_page.dart`

#### 11. Virtual Card Module (1 hour)
- All `*_screen.dart` files → `*_page.dart`

#### 12. Flight Module (2-3 hours) - LARGEST MODULE
- All `*_screen.dart` files → `*_page.dart`
- SKIP: `flight_two_pin_bottomsheet.dart` (it's a bottom sheet)
- SKIP: `update_flight_search_card.dart` (it's a widget, not a page)

### Phase 3: Update Imports (2-3 hours)

After converting all files, you need to update all imports:

```bash
# Find all files that import the old screen names
grep -r "import.*_screen.dart" lib/
```

For each import, update:
- `import 'package:ppay_mobile/module/auth/login_screen.dart';`
- TO: `import 'package:ppay_mobile/module/auth/login_page.dart';`

### Phase 4: AutoRoute Setup (1 hour)

1. **Complete the app_router.dart**
   Add all your routes to the router configuration

2. **Generate AutoRoute files**
   ```bash
   flutter pub run build_runner build --delete-conflicting-outputs
   ```

3. **Update main.dart**
   ```dart
   import 'package:flutter/material.dart';
   import 'package:hooks_riverpod/hooks_riverpod.dart';
   import 'app/router/app_router.dart';

   void main() {
     runApp(
       ProviderScope(
         child: MyApp(),
       ),
     );
   }

   class MyApp extends StatelessWidget {
     final _appRouter = AppRouter();

     @override
     Widget build(BuildContext context) {
       return MaterialApp.router(
         routerConfig: _appRouter.config(),
       );
     }
   }
   ```

### Phase 5: Testing (2-3 hours)

1. **Build the app**
   ```bash
   flutter clean
   flutter pub get
   flutter pub run build_runner build --delete-conflicting-outputs
   flutter run
   ```

2. **Test each module**
   - Navigate through all screens
   - Verify all buttons work
   - Check that hooks are working (no setState errors)

3. **Fix any issues**
   - Missing imports
   - Incorrect route names
   - Hook conversion issues

## Conversion Checklist Template

For each file, follow this checklist:

- [ ] Rename file: `*_screen.dart` → `*_page.dart`
- [ ] Rename class: `*Screen` → `*Page`
- [ ] Add imports:
  - [ ] `import 'package:auto_route/auto_route.dart';`
  - [ ] `import 'package:flutter_hooks/flutter_hooks.dart';`
  - [ ] `import 'package:hooks_riverpod/hooks_riverpod.dart';`
- [ ] Add `@RoutePage()` annotation
- [ ] Convert widget:
  - [ ] StatelessWidget → HookWidget
  - [ ] StatefulWidget → HookConsumerWidget (if needs state) or HookWidget
- [ ] Convert state:
  - [ ] `setState(() { counter++; })` → `counter.value++`
  - [ ] `initState()` → `useEffect(() { ... }, [])`
  - [ ] `dispose()` → `useEffect(() { return () { ... }; }, [])`
- [ ] Convert navigation:
  - [ ] `Navigator.push(context, MaterialPageRoute(...))` → `context.router.push(...Route())`
  - [ ] `Navigator.pop(context)` → `context.router.pop()`
- [ ] Update all imports in other files that reference this file
- [ ] Test the page

## Estimated Total Time

- **Phase 1 (Setup):** 30 minutes
- **Phase 2 (Conversion):** 8-12 hours
- **Phase 3 (Imports):** 2-3 hours
- **Phase 4 (AutoRoute):** 1 hour
- **Phase 5 (Testing):** 2-3 hours

**Total: 14-20 hours** (spread over 2-3 days)

## Tips for Success

1. **Work in small batches** - Convert one module at a time
2. **Commit frequently** - After each module, commit your changes
3. **Test as you go** - Don't wait until the end to test
4. **Use the examples** - Refer to the files I converted
5. **Read the guide** - CONVERSION_GUIDE.md has all the patterns
6. **Don't rush** - Take breaks, this is a lot of work

## Common Patterns You'll See

### Pattern 1: Simple StatelessWidget
```dart
// Before
class MyScreen extends StatelessWidget {
  Widget build(BuildContext context) => Scaffold(...);
}

// After
@RoutePage()
class MyPage extends HookWidget {
  Widget build(BuildContext context) => Scaffold(...);
}
```

### Pattern 2: StatefulWidget with setState
```dart
// Before
class MyScreen extends StatefulWidget {
  State<MyScreen> createState() => _MyScreenState();
}
class _MyScreenState extends State<MyScreen> {
  int count = 0;
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() => count++),
      child: Text('$count'),
    );
  }
}

// After
@RoutePage()
class MyPage extends HookWidget {
  Widget build(BuildContext context) {
    final count = useState(0);
    return GestureDetector(
      onTap: () => count.value++,
      child: Text('${count.value}'),
    );
  }
}
```

### Pattern 3: Navigation
```dart
// Before
Navigator.push(context, MaterialPageRoute(builder: (_) => HomePage()));

// After
context.router.push(HomeRoute());
```

## Files I've Created for You

1. ✅ `/lib/module/onboarding/splash_page.dart`
2. ✅ `/lib/module/onboarding/onboard_page.dart`
3. ✅ `/lib/module/auth/login_page.dart`
4. ✅ `/lib/module/auth/signup_page.dart`
5. ✅ `/lib/app/router/app_router.dart`
6. ✅ `/CONVERSION_GUIDE.md`
7. ✅ `/convert_to_pages.py`
8. ✅ This summary file

## Next Steps

1. Read the CONVERSION_GUIDE.md
2. Study the example files I created
3. Start with the onboarding module
4. Work through each module systematically
5. Test frequently
6. Ask for help if you get stuck

Good luck! This is a big task, but it's very doable if you work systematically. 🚀
