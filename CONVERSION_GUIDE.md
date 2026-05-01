# Flutter Project Conversion Guide: Screens to Pages with Hooks & AutoRoute

## Overview
This guide covers converting your Flutter project from:
- StatefulWidget/StatelessWidget → HookWidget/HookConsumerWidget
- Screen naming → Page naming
- MaterialPageRoute → AutoRoute navigation

## Conversion Rules

### 1. File Naming
- `home_screen.dart` → `home_page.dart`
- `login_screen.dart` → `login_page.dart`
- `dashboard.dart` → `dashboard_page.dart`
- Files already ending in `_page.dart` → Keep as is
- Bottom sheets, dialogs, widgets → Keep original names (NOT pages)

### 2. Class Naming
- `HomeScreen` → `HomePage`
- `LoginScreen` → `LoginPage`
- `Dashboard` → `DashboardPage`
- Classes already ending in `Page` → Keep as is

### 3. Widget Conversion

#### StatelessWidget → HookWidget
```dart
// BEFORE
class HomePage extends StatelessWidget {
  const HomePage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(...);
  }
}

// AFTER
@RoutePage()
class HomePage extends HookWidget {
  const HomePage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(...);
  }
}
```

#### StatefulWidget → HookConsumerWidget (with state management)
```dart
// BEFORE
class HomePage extends StatefulWidget {
  const HomePage({super.key});
  
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int counter = 0;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('$counter'),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            counter++;
          });
        },
      ),
    );
  }
}

// AFTER
@RoutePage()
class HomePage extends HookConsumerWidget {
  const HomePage({super.key});
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = useState(0);
    
    return Scaffold(
      body: Text('${counter.value}'),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counter.value++;
        },
      ),
    );
  }
}
```

#### StatefulWidget → HookWidget (no state management needed)
```dart
// BEFORE
class HomePage extends StatefulWidget {
  const HomePage({super.key});
  
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(...);
  }
}

// AFTER
@RoutePage()
class HomePage extends HookWidget {
  const HomePage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(...);
  }
}
```

### 4. Navigation Conversion

#### MaterialPageRoute → AutoRoute
```dart
// BEFORE
Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => HomePage()),
);

// AFTER
context.router.push(HomeRoute());
```

```dart
// BEFORE
Navigator.push(
  context,
  MaterialPageRoute(builder: (_) => LoginPage()),
);

// AFTER
context.router.push(LoginRoute());
```

```dart
// BEFORE
Navigator.pop(context);

// AFTER
context.router.pop();
```

### 5. Required Imports

For every page file, ensure these imports:
```dart
import 'package:auto_route/auto_route.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
```

### 6. Common Hooks Patterns

#### useState (replaces setState)
```dart
final counter = useState(0);
counter.value++;  // Update value
print(counter.value);  // Read value
```

#### useEffect (replaces initState/dispose)
```dart
useEffect(() {
  // Runs on mount
  print('Component mounted');
  
  return () {
    // Runs on unmount (cleanup)
    print('Component unmounted');
  };
}, []);  // Empty array = run once
```

#### useTextEditingController
```dart
final controller = useTextEditingController();
```

#### useAnimationController
```dart
final animationController = useAnimationController(
  duration: Duration(seconds: 1),
);
```

## Files to Convert

### Pages (Add @RoutePage() annotation)
All files in `/lib/module/` that represent full screens:
- auth/*.dart (except bottomsheets)
- bills/*_screen.dart
- crypto/*_screen.dart
- dashboard/*_screen.dart
- flight/*_screen.dart
- gift_card/*_screen.dart
- kyc/*_screen.dart
- onboarding/*_screen.dart
- settings/*_screen.dart (except bottomsheets)
- shopping/*_screen.dart
- transaction/*_screen.dart
- virtual_card/*_screen.dart

### NOT Pages (Do NOT add @RoutePage())
- *_bottomsheet.dart
- *_dialog.dart
- Widget files in `/lib/shared/widgets/`
- Model files
- Utility files

## Step-by-Step Process

1. **Backup your project**
   ```bash
   git commit -am "Before conversion"
   ```

2. **For each page file:**
   - Rename file: `*_screen.dart` → `*_page.dart`
   - Rename class: `*Screen` → `*Page`
   - Add `@RoutePage()` annotation
   - Convert to HookWidget or HookConsumerWidget
   - Update imports
   - Convert navigation calls
   - Convert setState to hooks

3. **Update all imports**
   - Find all files importing the old screen names
   - Update to new page names

4. **Generate AutoRoute files**
   ```bash
   flutter pub run build_runner build --delete-conflicting-outputs
   ```

5. **Test navigation**
   - Verify all routes work
   - Check that all pages load correctly

## AutoRoute Setup

### 1. Create app_router.dart
```dart
import 'package:auto_route/auto_route.dart';
import 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: SplashRoute.page, initial: true),
    AutoRoute(page: OnboardRoute.page),
    AutoRoute(page: LoginRoute.page),
    AutoRoute(page: SignupRoute.page),
    AutoRoute(page: HomeRoute.page),
    // Add all your routes here
  ];
}
```

### 2. Update main.dart
```dart
import 'package:flutter/material.dart';
import 'app/router/app_router.dart';

void main() {
  runApp(MyApp());
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

## Common Issues & Solutions

### Issue: "The method 'push' isn't defined for the type 'BuildContext'"
**Solution:** Import AutoRoute and use `context.router.push()`

### Issue: "setState called after dispose"
**Solution:** Use `useEffect` with cleanup function

### Issue: "Route not found"
**Solution:** Run `flutter pub run build_runner build --delete-conflicting-outputs`

### Issue: "HookWidget build method signature"
**Solution:** 
- HookWidget: `Widget build(BuildContext context)`
- HookConsumerWidget: `Widget build(BuildContext context, WidgetRef ref)`

## Testing Checklist

- [ ] All files renamed correctly
- [ ] All classes renamed correctly
- [ ] All imports updated
- [ ] AutoRoute generated successfully
- [ ] All navigation works
- [ ] No setState errors
- [ ] All hooks working correctly
- [ ] App builds without errors
- [ ] All screens accessible

## Notes

- Bottom sheets and dialogs should NOT be converted to pages
- Widgets in `/lib/shared/widgets/` can be converted to HookWidget but don't need @RoutePage()
- Test thoroughly after conversion
- Consider converting in batches (module by module)
