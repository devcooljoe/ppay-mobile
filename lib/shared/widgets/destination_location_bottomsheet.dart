import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ppay_mobile/module/flight/presentation/providers/flight_search_state.dart';
import 'package:ppay_mobile/shared/data/airports_data.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/touch_opacity.dart';

class DestinationLocationBottomsheet extends HookConsumerWidget {
  const DestinationLocationBottomsheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final query = useState('');
    final controller = useTextEditingController();

    final filtered = useMemoized(() {
      final q = query.value.toLowerCase().trim();
      if (q.isEmpty) return kAirports;
      return kAirports.where((a) =>
        a.code.toLowerCase().contains(q) ||
        a.city.toLowerCase().contains(q) ||
        a.name.toLowerCase().contains(q) ||
        a.country.toLowerCase().contains(q),
      ).toList();
    }, [query.value]);

    return FractionallySizedBox(
      heightFactor: 0.85,
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
                    'Destination',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      fontWeight: FontWeight.w500,
                      fontSize: 20.sp,
                      color: Colors.black,
                    ),
                  ),
                  24.verticalSpace,
                  SizedBox(
                    height: 44.h,
                    child: TextFormField(
                      controller: controller,
                      autofocus: true,
                      onChanged: (v) => query.value = v,
                      decoration: InputDecoration(
                        hintText: 'Search city, airport or country',
                        hintStyle: TextStyle(
                          fontFamily: 'InstrumentSans',
                          color: PPaymobileColors.filterBorderColor,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
                        prefixIcon: Padding(
                          padding: EdgeInsets.all(10.r),
                          child: SvgPicture.asset('assets/icon/flight_down.svg', fit: BoxFit.contain),
                        ),
                        suffixIcon: query.value.isNotEmpty
                            ? GestureDetector(
                                onTap: () {
                                  controller.clear();
                                  query.value = '';
                                },
                                child: Padding(
                                  padding: EdgeInsets.all(10.r),
                                  child: SvgPicture.asset('assets/icon/cancel_1.svg', fit: BoxFit.scaleDown),
                                ),
                              )
                            : null,
                        contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6.r),
                          borderSide: BorderSide(color: PPaymobileColors.textfiedBorder, width: 1.w),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6.r),
                          borderSide: BorderSide(color: PPaymobileColors.buttonColor, width: 1.5.w),
                        ),
                      ),
                    ),
                  ),
                  20.verticalSpace,
                  Text(
                    query.value.isEmpty ? 'All Airports' : 'Results (${filtered.length})',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      fontWeight: FontWeight.w500,
                      fontSize: 14.sp,
                      color: Colors.black,
                    ),
                  ),
                  16.verticalSpace,
                  Expanded(
                    child: filtered.isEmpty
                        ? Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SvgPicture.asset('assets/icon/flight_down.svg', height: 48.h, width: 48.h),
                                16.verticalSpace,
                                Text(
                                  'No airports found',
                                  style: TextStyle(
                                    fontFamily: 'InstrumentSans',
                                    fontSize: 14.sp,
                                    color: PPaymobileColors.svgIconColor,
                                  ),
                                ),
                              ],
                            ),
                          )
                        : ListView.separated(
                            itemCount: filtered.length,
                            separatorBuilder: (_, __) => Divider(
                              height: 1.h,
                              color: PPaymobileColors.deepBackgroundColor,
                            ),
                            itemBuilder: (_, i) {
                              final airport = filtered[i];
                              return TouchOpacity(
                                onTap: () {
                                  ref.read(flightSearchStateProvider.notifier)
                                      .setTo(airport.code, airport.label);
                                  Navigator.pop(context);
                                },
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 12.h),
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 40.w,
                                        width: 40.w,
                                        decoration: BoxDecoration(
                                          color: PPaymobileColors.deepBackgroundColor,
                                          borderRadius: BorderRadius.circular(8.r),
                                        ),
                                        child: Center(
                                          child: SvgPicture.asset(
                                            'assets/icon/flight_down.svg',
                                            height: 20.w,
                                            width: 20.w,
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ),
                                      12.horizontalSpace,
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    airport.city,
                                                    style: TextStyle(
                                                      fontFamily: 'InstrumentSans',
                                                      fontWeight: FontWeight.w600,
                                                      fontSize: 14.sp,
                                                      color: Colors.black,
                                                    ),
                                                    overflow: TextOverflow.ellipsis,
                                                  ),
                                                ),
                                                8.horizontalSpace,
                                                Container(
                                                  padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
                                                  decoration: BoxDecoration(
                                                    color: PPaymobileColors.buttonColor.withValues(alpha: 0.1),
                                                    borderRadius: BorderRadius.circular(4.r),
                                                  ),
                                                  child: Text(
                                                    airport.code,
                                                    style: TextStyle(
                                                      fontFamily: 'InstrumentSans',
                                                      fontWeight: FontWeight.w600,
                                                      fontSize: 12.sp,
                                                      color: PPaymobileColors.buttonColor,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            4.verticalSpace,
                                            Text(
                                              '${airport.name} · ${airport.country}',
                                              style: TextStyle(
                                                fontFamily: 'InstrumentSans',
                                                fontWeight: FontWeight.w400,
                                                fontSize: 11.sp,
                                                color: PPaymobileColors.anotherGreyColor,
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ],
                                        ),
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
