import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:ppay_mobile/app/router/app_router.gr.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ppay_mobile/module/flight/multi_trip_page.dart';
import 'package:ppay_mobile/module/flight/one_way_trip_page.dart';
import 'package:ppay_mobile/module/flight/round_way_trip_page.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';

@RoutePage()
class SearchCardPage extends HookConsumerWidget {
  const SearchCardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {  }
}
