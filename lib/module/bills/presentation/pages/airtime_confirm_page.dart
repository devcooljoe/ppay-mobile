import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ppay_mobile/app/router/app_router.gr.dart';

@RoutePage()
class AirtimeConfirmPage extends HookConsumerWidget {
  const AirtimeConfirmPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // This page is superseded by BillConfirmPage which handles all bill types.
    // Redirect to the airtime page so the user can start a real flow.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.router.replaceAll([AirtimeRoute()]);
    });
    return const SizedBox.shrink();
  }
}
