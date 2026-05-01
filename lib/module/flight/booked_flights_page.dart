import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:ppay_mobile/app/router/app_router.gr.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/module/flight/active_flight_page.dart';
import 'package:ppay_mobile/module/flight/past_flight_screens.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/touch_opacity.dart';

@RoutePage()
class BookedFlightsPage extends HookConsumerWidget {
  const BookedFlightsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {  }
}
