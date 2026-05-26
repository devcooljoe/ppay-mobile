import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ppay_mobile/core/providers/inactivity_provider.dart';

class ActivityTracker extends HookConsumerWidget {
  final Widget child;

  const ActivityTracker({super.key, required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final inactivityNotifier = ref.read(inactivityNotifierProvider.notifier);

    return Listener(
      behavior: HitTestBehavior.translucent,
      onPointerDown: (_) => inactivityNotifier.resetTimer(),
      onPointerMove: (_) => inactivityNotifier.resetTimer(),
      onPointerUp: (_) => inactivityNotifier.resetTimer(),
      onPointerCancel: (_) => inactivityNotifier.resetTimer(),
      onPointerHover: (_) => inactivityNotifier.resetTimer(),
      child: NotificationListener<ScrollNotification>(
        onNotification: (notification) {
          inactivityNotifier.resetTimer();
          return false;
        },
        child: child,
      ),
    );
  }
}
