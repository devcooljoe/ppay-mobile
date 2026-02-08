import 'package:flutter/material.dart';

class TouchOpacity extends StatefulWidget {
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
  State<TouchOpacity> createState() => _TouchOpacityState();
}

class _TouchOpacityState extends State<TouchOpacity> {
  double opacityValue = 1.0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: widget.onTap,
      onLongPress: widget.onLongPress,
      onTapDown: (_) => setState(() {
        opacityValue = widget.opacity;
      }),
      onTapUp: (_) => setState(() {
        opacityValue = 1.0;
      }),
      onTapCancel: () => setState(() {
        opacityValue = 1.0;
      }),
      child: AnimatedOpacity(
        duration: widget.duration,
        opacity: opacityValue,
        child: widget.child,
      ),
    );
  }
}
