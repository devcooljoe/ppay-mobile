import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ppay_mobile/module/flight/presentation/providers/flight_search_state.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/touch_opacity.dart';

const _airports = [
  {'code': 'LOS', 'label': 'Lagos (LOS)', 'country': 'Nigeria'},
  {'code': 'ABV', 'label': 'Abuja (ABV)', 'country': 'Nigeria'},
  {'code': 'PHC', 'label': 'Port Harcourt (PHC)', 'country': 'Nigeria'},
  {'code': 'KAN', 'label': 'Kano (KAN)', 'country': 'Nigeria'},
  {'code': 'ENU', 'label': 'Enugu (ENU)', 'country': 'Nigeria'},
  {'code': 'IBA', 'label': 'Ibadan (IBA)', 'country': 'Nigeria'},
  {'code': 'BEN', 'label': 'Benin (BEN)', 'country': 'Nigeria'},
  {'code': 'ABJ', 'label': 'Abidjan (ABJ)', 'country': 'Côte d\'Ivoire'},
  {'code': 'ACC', 'label': 'Accra (ACC)', 'country': 'Ghana'},
  {'code': 'DKR', 'label': 'Dakar (DKR)', 'country': 'Senegal'},
  {'code': 'NBO', 'label': 'Nairobi (NBO)', 'country': 'Kenya'},
  {'code': 'JNB', 'label': 'Johannesburg (JNB)', 'country': 'South Africa'},
  {'code': 'LHR', 'label': 'London Heathrow (LHR)', 'country': 'United Kingdom'},
  {'code': 'CDG', 'label': 'Paris Charles de Gaulle (CDG)', 'country': 'France'},
  {'code': 'DXB', 'label': 'Dubai (DXB)', 'country': 'UAE'},
  {'code': 'JFK', 'label': 'New York JFK (JFK)', 'country': 'USA'},
];

class DepatureLocationBottomsheet extends HookConsumerWidget {
  const DepatureLocationBottomsheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final query = useState('');
    final controller = useTextEditingController();

    final filtered = _airports.where((a) {
      final q = query.value.toLowerCase();
      return q.isEmpty ||
          a['code']!.toLowerCase().contains(q) ||
          a['label']!.toLowerCase().contains(q) ||
          a['country']!.toLowerCase().contains(q);
    }).toList();

    return FractionallySizedBox(
      heightFactor: 0.550,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              height: 60.w,
              width: 60.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30).r,
                color: PPaymobileColors.mainScreenBackground,
              ),
              child: SizedBox(
                height: 18.h,
                width: 18.h,
                child: SvgPicture.asset('assets/icon/cancel.svg', fit: BoxFit.scaleDown),
              ),
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Enter departure location',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      fontWeight: FontWeight.w500,
                      fontSize: 20.sp,
                      color: Colors.black,
                    ),
                  ),
                  38.verticalSpace,
                  SizedBox(
                    height: 44.h,
                    child: TextFormField(
                      controller: controller,
                      onChanged: (v) => query.value = v,
                      decoration: InputDecoration(
                        hintText: 'Search airport or city',
                        hintStyle: TextStyle(
                          fontFamily: 'InstrumentSans',
                          color: PPaymobileColors.filterBorderColor,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                        suffixIcon: query.value.isNotEmpty
                            ? GestureDetector(
                                onTap: () {
                                  controller.clear();
                                  query.value = '';
                                },
                                child: SizedBox(
                                  height: 24.h,
                                  width: 24.h,
                                  child: SvgPicture.asset('assets/icon/cancel_1.svg', fit: BoxFit.scaleDown),
                                ),
                              )
                            : null,
                        contentPadding: EdgeInsets.all(10).r,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6.r),
                          borderSide: BorderSide(color: PPaymobileColors.textfiedBorder, width: 1.w),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6.r),
                          borderSide: BorderSide(color: PPaymobileColors.buttonColor, width: 1.w),
                        ),
                      ),
                    ),
                  ),
                  28.verticalSpace,
                  Text(
                    query.value.isEmpty ? 'Suggestions' : 'Results',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      fontWeight: FontWeight.w500,
                      fontSize: 16.sp,
                      color: Colors.black,
                    ),
                  ),
                  20.verticalSpace,
                  Expanded(
                    child: ListView.separated(
                      itemCount: filtered.length,
                      separatorBuilder: (_, __) => 16.verticalSpace,
                      itemBuilder: (_, i) {
                        final airport = filtered[i];
                        return TouchOpacity(
                          onTap: () {
                            ref.read(flightSearchStateProvider.notifier)
                                .setFrom(airport['code']!, airport['label']!);
                            Navigator.pop(context);
                          },
                          child: SizedBox(
                            height: 49.h,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 33.h,
                                  width: 33.h,
                                  child: SvgPicture.asset('assets/icon/takeoff_1.svg', fit: BoxFit.contain),
                                ),
                                10.horizontalSpace,
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      airport['label']!,
                                      style: TextStyle(
                                        fontFamily: 'InstrumentSans',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14.sp,
                                        color: Colors.black,
                                      ),
                                    ),
                                    4.verticalSpace,
                                    Text(
                                      airport['country']!,
                                      style: TextStyle(
                                        fontFamily: 'InstrumentSans',
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12.sp,
                                        color: PPaymobileColors.anotherGreyColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
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
