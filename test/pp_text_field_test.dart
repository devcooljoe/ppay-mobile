import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ppay_mobile/shared/widgets/pp_text_field.dart';

/// Pumps [child] inside the minimal scaffolding PPTextField needs:
/// a MaterialApp for Directionality/Theme and ScreenUtilInit for the
/// `.sp` / `.w` / `.h` sizing extensions used by the widget.
Future<void> _pumpField(WidgetTester tester, Widget child) async {
  await tester.pumpWidget(
    ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (context, _) => MaterialApp(
        home: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: child,
          ),
        ),
      ),
    ),
  );
  await tester.pumpAndSettle();
}

/// Reads the effective `obscureText` of the single EditableText in the tree.
bool _isObscured(WidgetTester tester) {
  final editable = tester.widget<EditableText>(find.byType(EditableText));
  return editable.obscureText;
}

void main() {
  group('PPTextField password toggle', () {
    testWidgets('starts obscured when isPassword is true', (tester) async {
      await _pumpField(
        tester,
        const PPTextField(isPassword: true, hintText: 'Enter your password'),
      );

      expect(_isObscured(tester), isTrue);
    });

    testWidgets('renders an eye suffix icon when isPassword is true',
        (tester) async {
      await _pumpField(
        tester,
        const PPTextField(isPassword: true, hintText: 'Enter your password'),
      );

      // The suffix eye toggle should render an SvgPicture.
      expect(find.byType(SvgPicture), findsWidgets);
    });

    testWidgets('tapping the suffix toggles obscuring', (tester) async {
      await _pumpField(
        tester,
        const PPTextField(isPassword: true, hintText: 'Enter your password'),
      );

      expect(_isObscured(tester), isTrue);

      // Tap the suffix eye icon.
      await tester.tap(find.byType(SvgPicture).last);
      await tester.pumpAndSettle();

      expect(_isObscured(tester), isFalse);

      // Tap again to hide.
      await tester.tap(find.byType(SvgPicture).last);
      await tester.pumpAndSettle();

      expect(_isObscured(tester), isTrue);
    });

    testWidgets('the suffix eye icon uses a visible (non-transparent) color',
        (tester) async {
      await _pumpField(
        tester,
        const PPTextField(isPassword: true, hintText: 'Enter your password'),
      );

      final svgs = tester.widgetList<SvgPicture>(find.byType(SvgPicture));
      // At least one rendered SvgPicture should apply a colorFilter so the
      // white-fill eye-slash asset becomes visible on the white field.
      final hasColorFilter = svgs.any((s) => s.colorFilter != null);
      expect(hasColorFilter, isTrue);
    });

    testWidgets('non-password field is not obscured by default', (tester) async {
      await _pumpField(
        tester,
        const PPTextField(hintText: 'Email'),
      );

      expect(_isObscured(tester), isFalse);
    });
  });
}
