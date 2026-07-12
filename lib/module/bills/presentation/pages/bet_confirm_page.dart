import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ppay_mobile/app/router/app_router.gr.dart';

@RoutePage()
class BetConfirmPage extends HookConsumerWidget {
  const BetConfirmPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.router.replaceAll([BetRoute()]);
    });
    return const SizedBox.shrink();
  }
}
