import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppLoader extends HookWidget {
  const AppLoader({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = useAnimationController(duration: const Duration(milliseconds: 500))..repeat(reverse: true);

    return ScaleTransition(
      scale: Tween<double>(begin: 0.9, end: 1.0).animate(CurvedAnimation(parent: controller, curve: Curves.easeInOut)),
      child: CircularProgressIndicator(
        color: Colors.white,
        strokeWidth: 3.w,
      ),
    );
  }

  static void show(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showDialog(context: context, barrierDismissible: false, barrierColor: Colors.black54, useRootNavigator: false, builder: (ctx) => const Center(child: AppLoader()));
    });
  }

  static void hide(BuildContext context) {
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
    }
  }
}
