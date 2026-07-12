import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ppay_mobile/app/router/app_router.gr.dart';

@RoutePage()
class ElectricityReceiptPage extends HookConsumerWidget {
  const ElectricityReceiptPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.router.replaceAll([HomeRoute()]);
    });
    return const SizedBox.shrink();
  }
}
