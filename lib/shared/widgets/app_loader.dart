import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppLoader extends HookWidget {
  const AppLoader({super.key});

  // Track pending show/hide operations to handle race conditions
  static Completer<void>? _showCompleter;
  static bool _isShowing = false;

  @override
  Widget build(BuildContext context) {
    final controller = useAnimationController(
      duration: const Duration(milliseconds: 500),
    )..repeat(reverse: true);

    return ScaleTransition(
      scale: Tween<double>(
        begin: 0.9,
        end: 1.0,
      ).animate(CurvedAnimation(parent: controller, curve: Curves.easeInOut)),
      child: SizedBox(
        width: 40.w,
        height: 40.w,
        child: CircularProgressIndicator(color: Colors.white, strokeWidth: 3.w),
      ),
    );
  }

  static void show(BuildContext context) {
    if (_isShowing) return;
    _isShowing = true;
    _showCompleter = Completer<void>();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!context.mounted) {
        _isShowing = false;
        _showCompleter?.complete();
        _showCompleter = null;
        return;
      }
      showDialog(
        context: context,
        barrierDismissible: false,
        barrierColor: Colors.black54,
        useRootNavigator: true,
        builder: (ctx) => const Center(child: AppLoader()),
      ).then((_) {
        // Dialog was closed
        _isShowing = false;
      });
      // Complete after dialog is pushed
      _showCompleter?.complete();
      _showCompleter = null;
    });
  }

  static void hide(BuildContext context) {
    if (!_isShowing) return;

    Future<void> doHide() async {
      // Wait for show to complete if it's still pending
      if (_showCompleter != null) {
        await _showCompleter!.future;
      }

      if (!context.mounted) {
        _isShowing = false;
        return;
      }

      final navigator = Navigator.of(context, rootNavigator: true);
      if (navigator.canPop()) {
        navigator.pop();
      }
      _isShowing = false;
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      doHide();
    });
  }
}
