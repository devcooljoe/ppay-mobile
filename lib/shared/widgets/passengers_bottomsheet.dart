import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ppay_mobile/module/flight/presentation/providers/flight_search_state.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/touch_opacity.dart';

class PassengersBottomsheet extends HookConsumerWidget {
  const PassengersBottomsheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchState = ref.watch(flightSearchStateProvider);
    final adults = useState(searchState.adults);
    final children = useState(searchState.children);
    final infants = useState(searchState.infants);

    Widget counter(String label, String subtitle, ValueNotifier<int> count, int min) {
      return SizedBox(
        height: 50.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(label, style: TextStyle(fontFamily: 'InstrumentSans', fontWeight: FontWeight.w500, fontSize: 16.sp, color: Colors.black)),
                4.verticalSpace,
                Text(subtitle, style: TextStyle(fontFamily: 'InstrumentSans', fontWeight: FontWeight.w500, fontSize: 12.sp, color: PPaymobileColors.anotherGreyColor)),
              ],
            ),
            SizedBox(
              height: 26.h,
              width: 102.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TouchOpacity(
                    onTap: () { if (count.value > min) count.value--; },
                    child: Container(
                      height: 18.h,
                      width: 18.h,
                      decoration: BoxDecoration(border: Border.all(color: PPaymobileColors.lightGrey, width: 1.5.w)),
                      child: Center(child: SizedBox(height: 8.h, width: 8.h, child: SvgPicture.asset('assets/icon/minus.svg'))),
                    ),
                  ),
                  Text('${count.value}', style: TextStyle(fontFamily: 'InstrumentSans', fontWeight: FontWeight.w500, fontSize: 16.sp, color: Colors.black)),
                  TouchOpacity(
                    onTap: () { if (count.value < 9) count.value++; },
                    child: Container(
                      height: 18.h,
                      width: 18.h,
                      decoration: BoxDecoration(border: Border.all(color: PPaymobileColors.lightGrey, width: 1.5.w)),
                      child: Center(child: SizedBox(height: 8.h, width: 8.h, child: SvgPicture.asset('assets/icon/add.svg'))),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    return FractionallySizedBox(
      heightFactor: 0.600,
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
                  Text('Select Passengers', style: TextStyle(fontFamily: 'InstrumentSans', fontWeight: FontWeight.w500, fontSize: 20.sp, color: Colors.black)),
                  23.verticalSpace,
                  counter('Adults', 'Age 18+', adults, 1),
                  19.verticalSpace,
                  counter('Children', 'Ages 2-17', children, 0),
                  19.verticalSpace,
                  counter('Infants', 'Under 2', infants, 0),
                  18.verticalSpace,
                  Text(
                    'Please note age of child must be valid for the age booked at the time of travel',
                    style: TextStyle(fontFamily: 'InstrumentSans', fontWeight: FontWeight.w500, fontSize: 14.sp, color: PPaymobileColors.anotherGreyColor),
                  ),
                  39.verticalSpace,
                  TouchOpacity(
                    onTap: () {
                      ref.read(flightSearchStateProvider.notifier).setPassengers(
                        adults: adults.value,
                        children: children.value,
                        infants: infants.value,
                      );
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
