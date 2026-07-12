import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ppay_mobile/module/flight/presentation/providers/flight_search_state.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/option_picker.dart';
import 'package:ppay_mobile/shared/widgets/touch_opacity.dart';

class ClassBottomsheet extends HookConsumerWidget {
  const ClassBottomsheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const cabins = ['economy', 'premium_economy', 'business', 'first'];
    const labels = ['Economy', 'Premium Economy', 'Business Class', 'First Class'];
    final current = ref.watch(flightSearchStateProvider).cabin;
    final selectedIndex = useState(cabins.indexOf(current).clamp(0, 3));

    return FractionallySizedBox(
      heightFactor: 0.500,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              height: 60.w,
              width: 60.w,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(30).r, color: PPaymobileColors.mainScreenBackground),
              child: SizedBox(height: 18.h, width: 18.h, child: SvgPicture.asset('assets/icon/cancel.svg', fit: BoxFit.scaleDown)),
            ),
          ),
          10.verticalSpace,
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 20.w, top: 29.h, right: 20.w),
              width: double.infinity,
              decoration: BoxDecoration(
                color: PPaymobileColors.mainScreenBackground,
                borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
              ),
              child: ListView(
                children: [
                  Text('Class', style: TextStyle(fontFamily: 'InstrumentSans', fontWeight: FontWeight.w500, fontSize: 20.sp, color: Colors.black)),
                  20.verticalSpace,
                  ...List.generate(labels.length, (i) => Column(
                    children: [
                      SizedBox(
                        height: 26.h,
                        width: double.infinity,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(labels[i], style: TextStyle(fontFamily: 'InstrumentSans', fontWeight: FontWeight.w500, fontSize: 16.sp, color: Colors.black)),
                            OptionPicker(selected: selectedIndex.value == i, onSelected: () => selectedIndex.value = i),
                          ],
                        ),
                      ),
                      30.verticalSpace,
                    ],
                  )),
                  9.verticalSpace,
                  TouchOpacity(
                    onTap: () {
                      ref.read(flightSearchStateProvider.notifier).setCabin(cabins[selectedIndex.value]);
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 52.h,
                      width: double.infinity,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(65).r, color: PPaymobileColors.navContainerbgColor),
                      child: Center(
                        child: Text('Apply', style: TextStyle(fontFamily: 'InstrumentSans', fontSize: 14.sp, fontWeight: FontWeight.w500, color: PPaymobileColors.mainScreenBackground)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
