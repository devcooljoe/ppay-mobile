import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class TouchOpacity extends HookWidget {
  final Widget child;
  final double opacity;
  final Duration duration;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;

  const TouchOpacity({
    super.key,
    required this.child,
    this.opacity = 0.5,
    this.duration = const Duration(milliseconds: 100),
    this.onTap,
    this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    final opacityValue = useState(1.0);
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onTap,
      onLongPress: onLongPress,
      onTapDown: (_) => opacityValue.value = opacity,
      onTapUp: (_) => opacityValue.value = 1.0,
      onTapCancel: () => opacityValue.value = 1.0,
      child: AnimatedOpacity(
        duration: duration,
        opacity: opacityValue.value,
        child: child,
      ),
    );
  }
}
