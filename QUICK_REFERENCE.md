# Quick Reference Card - Screen to Page Conversion

## File Renaming Pattern
```
*_screen.dart  →  *_page.dart
*.dart         →  *_page.dart (if not already ending in _page)
```

## Class Renaming Pattern
```
*Screen  →  *Page
*        →  *Page (if not already ending in Page)
```

## Widget Conversion

### StatelessWidget → HookWidget
```dart
// BEFORE
class MyScreen extends StatelessWidget {
  const MyScreen({super.key});
  @override
  Widget build(BuildContext context) { ... }
}

// AFTER
@RoutePage()
class MyPage extends HookWidget {
  const MyPage({super.key});
  @override
  Widget build(BuildContext context) { ... }
}
```

### StatefulWidget → HookWidget (no state management)
```dart
// BEFORE
class MyScreen extends StatefulWidget {
  const MyScreen({super.key});
  @override
  State<MyScreen> createState() => _MyScreenState();
}
class _MyScreenState extends State<MyScreen> {
  @override
  Widget build(BuildContext context) { ... }
}

// AFTER
@RoutePage()
class MyPage extends HookWidget {
  const MyPage({super.key});
  @override
  Widget build(BuildContext context) { ... }
}
```

### StatefulWidget → HookConsumerWidget (with state)
```dart
// BEFORE
class MyScreen extends StatefulWidget {
  const MyScreen({super.key});
  @override
  State<MyScreen> createState() => _MyScreenState();
}
class _MyScreenState extends State<MyScreen> {
  int counter = 0;
  @override
  Widget build(BuildContext context) { ... }
}

// AFTER
@RoutePage()
class MyPage extends HookConsumerWidget {
  const MyPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = useState(0);
    ...
  }
}
```

## Required Imports
```dart
import 'package:auto_route/auto_route.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
```

## Navigation Conversion
```dart
// BEFORE
Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
Navigator.push(context, MaterialPageRoute(builder: (_) => HomePage()));

// AFTER
context.router.push(HomeRoute());

// BEFORE
Navigator.pop(context);

// AFTER
context.router.pop();
```

## State Management Hooks

### useState (replaces setState)
```dart
// BEFORE
int counter = 0;
setState(() { counter++; });

// AFTER
final counter = useState(0);
counter.value++;
```

### useEffect (replaces initState/dispose)
```dart
// BEFORE
@override
void initState() {
  super.initState();
  print('Mounted');
}
@override
void dispose() {
  print('Unmounted');
  super.dispose();
}

// AFTER
useEffect(() {
  print('Mounted');
  return () => print('Unmounted');
}, []);
```

### useTextEditingController
```dart
// BEFORE
final controller = TextEditingController();
@override
void dispose() {
  controller.dispose();
  super.dispose();
}

// AFTER
final controller = useTextEditingController();
```

### usePageController
```dart
// BEFORE
final pageController = PageController();
@override
void dispose() {
  pageController.dispose();
  super.dispose();
}

// AFTER
final pageController = usePageController();
```

### useMemoized (cache expensive computations)
```dart
final expensiveList = useMemoized(() => [
  Item1(),
  Item2(),
]);
```

## Common Patterns

### Pattern 1: Simple Page (No State)
```dart
@RoutePage()
class MyPage extends HookWidget {
  const MyPage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My Page')),
      body: Center(child: Text('Hello')),
    );
  }
}
```

### Pattern 2: Page with Local State
```dart
@RoutePage()
class MyPage extends HookWidget {
  const MyPage({super.key});
  
  @override
  Widget build(BuildContext context) {
    final counter = useState(0);
    
    return Scaffold(
      body: Column(
        children: [
          Text('${counter.value}'),
          ElevatedButton(
            onPressed: () => counter.value++,
            child: Text('Increment'),
          ),
        ],
      ),
    );
  }
}
```

### Pattern 3: Page with Riverpod State
```dart
@RoutePage()
class MyPage extends HookConsumerWidget {
  const MyPage({super.key});
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);
    
    return Scaffold(
      body: Text('Hello ${user.name}'),
    );
  }
}
```

### Pattern 4: Page with Controllers
```dart
@RoutePage()
class MyPage extends HookWidget {
  const MyPage({super.key});
  
  @override
  Widget build(BuildContext context) {
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    
    return Scaffold(
      body: Column(
        children: [
          TextField(controller: emailController),
          TextField(controller: passwordController),
        ],
      ),
    );
  }
}
```

### Pattern 5: Page with PageView
```dart
@RoutePage()
class MyPage extends HookWidget {
  const MyPage({super.key});
  
  @override
  Widget build(BuildContext context) {
    final pageController = usePageController();
    final currentPage = useState(0);
    
    return Scaffold(
      body: PageView(
        controller: pageController,
        onPageChanged: (index) => currentPage.value = index,
        children: [...],
      ),
    );
  }
}
```

## Files to SKIP (Not Pages)
- `*_bottomsheet.dart`
- `*_dialog.dart`
- `tv_cable_pin_bottomsheet.dart`
- `flight_two_pin_bottomsheet.dart`
- `update_flight_search_card.dart`
- Any widget in `/lib/shared/widgets/`

## Build Method Signatures

### HookWidget
```dart
Widget build(BuildContext context)
```

### HookConsumerWidget
```dart
Widget build(BuildContext context, WidgetRef ref)
```

## After Conversion Checklist
- [ ] File renamed
- [ ] Class renamed
- [ ] Imports added
- [ ] @RoutePage() added
- [ ] Widget type converted
- [ ] setState converted to hooks
- [ ] Navigation converted
- [ ] All imports in other files updated
- [ ] File compiles without errors
- [ ] Page tested and works

## Generate AutoRoute Files
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

## Common Errors & Fixes

### Error: "The method 'push' isn't defined"
**Fix:** Import AutoRoute and use `context.router.push()`

### Error: "setState called after dispose"
**Fix:** Use `useEffect` with cleanup

### Error: "Route not found"
**Fix:** Run build_runner to generate routes

### Error: "Wrong number of parameters"
**Fix:** Check build method signature:
- HookWidget: `(BuildContext context)`
- HookConsumerWidget: `(BuildContext context, WidgetRef ref)`

## Example Files Created
1. `/lib/module/onboarding/splash_page.dart`
2. `/lib/module/onboarding/onboard_page.dart`
3. `/lib/module/auth/login_page.dart`
4. `/lib/module/auth/signup_page.dart`
5. `/lib/module/dashboard/home_page.dart`

Refer to these files for complete examples!
