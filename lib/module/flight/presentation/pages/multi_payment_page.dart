import 'package:flutter/material.dart';
import 'package:ppay_mobile/shared/widgets/touch_opacity.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ppay_mobile/app/router/app_router.gr.dart';
import 'package:ppay_mobile/core/utils/message_handler.dart';
import 'package:ppay_mobile/module/flight/presentation/pages/passenger_details_page.dart';
import 'package:ppay_mobile/module/flight/presentation/providers/flight_providers.dart';
import 'package:ppay_mobile/module/flight/presentation/providers/selected_flight_provider.dart';
import 'package:ppay_mobile/module/flight/presentation/utils/flight_format_utils.dart';
import 'package:ppay_mobile/module/dashboard/providers/wallet_provider.dart';
import 'package:ppay_mobile/shared/utils/amount_formatter.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/option_picker.dart';
import 'package:ppay_mobile/shared/widgets/security_pin_bottomsheet.dart';

@RoutePage()
class MultiPaymentPage extends HookConsumerWidget {
  const MultiPaymentPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = useState(0);
    final confirmation = ref.watch(selectedConfirmationProvider);
    final bookAsync = ref.watch(bookFlightProvider);
    final walletAsync = ref.watch(walletProvider);

    ref.listen(bookFlightProvider, (_, next) {
      if (next.hasError) {
        MessageHandler.showErrorSnackBar(context, next.error.toString());
      } else if (next.hasValue && next.value != null) {
        ref.read(flightBookingResultProvider.notifier).set(next.value!);
        context.router.push(const MultiPaymentSuccessRoute());
      }
    });

    final amount = confirmation?.amount ?? 0.0;
    final walletBalance = walletAsync.value?.balance ?? '0.00';

    final legs = confirmation?.outbound ?? [];

    Future<void> _pay() async {
      final passengers = ref.read(passengerFormDataProvider);
      if (passengers.isEmpty) {
        MessageHandler.showErrorSnackBar(context, 'No passenger data found');
        return;
      }
      if (confirmation == null) {
        MessageHandler.showErrorSnackBar(context, 'No flight confirmation found');
        return;
      }

      final verified = await showSecurityPinBottomsheet(context);
      if (!verified) return;

      await ref.read(bookFlightProvider.notifier).call(
        offerId: confirmation.id,
        passengers: passengers,
      );
    }

    return Scaffold(
      backgroundColor: PPaymobileColors.mainScreenBackground,
      appBar: AppBar(
        backgroundColor: PPaymobileColors.buttonColorandText,
        centerTitle: true,
        title: Text(
          'Payment',
          style: TextStyle(
            fontFamily: 'InstrumentSans',
            color: PPaymobileColors.mainScreenBackground,
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        leading: Padding(
          padding: EdgeInsets.only(left: 20.w),
          child: TouchOpacity(
            onTap: () => Navigator.pop(context),
            child: SizedBox(
              height: 24.w,
              width: 24.w,
              child: SvgPicture.asset('assets/icon/arrow_back_white.svg', fit: BoxFit.scaleDown),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 16.h),
                  color: PPaymobileColors.buttonColorandText,
                  child: Column(
                    children: [
                      35.verticalSpace,
                      ...legs.map((leg) => Padding(
                        padding: EdgeInsets.only(bottom: 24.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                              Text(leg.airportFrom, style: TextStyle(fontFamily: 'InstrumentSans', color: PPaymobileColors.mainScreenBackground, fontSize: 24.sp, fontWeight: FontWeight.w600)),
                              4.verticalSpace,
                              Text('DEPARTURE', style: TextStyle(fontFamily: 'InstrumentSans', color: PPaymobileColors.mainScreenBackground, fontSize: 14.sp, fontWeight: FontWeight.w500)),
                            ]),
                            SizedBox(
                              width: 119.w,
                              height: 73.h,
                              child: Stack(alignment: Alignment.center, children: [
                                SvgPicture.asset('assets/icon/crmeter.svg'),
                                Positioned(bottom: 16, child: SvgPicture.asset('assets/icon/aeroplane.svg', width: 30.w, height: 30.w, allowDrawingOutsideViewBox: true)),
                                Positioned(bottom: 0.h, child: Text(FlightFormatUtils.formatDuration(leg.duration), style: TextStyle(fontFamily: 'InstrumentSans', color: PPaymobileColors.mainScreenBackground, fontSize: 14.sp, fontWeight: FontWeight.w500))),
                              ]),
                            ),
                            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                              Text(leg.airportTo, style: TextStyle(fontFamily: 'InstrumentSans', color: PPaymobileColors.mainScreenBackground, fontSize: 24.sp, fontWeight: FontWeight.w600)),
                              4.verticalSpace,
                              Text('ARRIVAL', style: TextStyle(fontFamily: 'InstrumentSans', color: PPaymobileColors.mainScreenBackground, fontSize: 14.sp, fontWeight: FontWeight.w500)),
                            ]),
                          ],
                        ),
                      )),
                    ],
                  ),
                ),
                24.verticalSpace,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Text('Payment From', style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 16.sp, fontWeight: FontWeight.w600)),
                ),
                10.verticalSpace,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Container(
                    height: 74.h,
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 9.h),
                    decoration: BoxDecoration(
                      border: Border.all(color: PPaymobileColors.filterBorderColor, width: 1.w),
                      borderRadius: BorderRadius.circular(9).r,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(children: [
                          Container(
                            height: 39.h, width: 37.w,
                            padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 8.h),
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(4).r, color: const Color(0xffEFF5F2)),
                            child: Center(child: SizedBox(height: 23.w, width: 23.w, child: Image.asset('assets/images/flag.png', fit: BoxFit.contain))),
                          ),
                          9.horizontalSpace,
                          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                            Text('Wallet Balance', style: TextStyle(fontFamily: 'InstrumentSans', color: PPaymobileColors.svgIconColor, fontSize: 12.sp, fontWeight: FontWeight.w500)),
                            4.verticalSpace,
                            Text('₦${AmountFormatter.formatBalance(walletBalance)}', style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 20.sp, fontWeight: FontWeight.w500)),
                          ]),
                        ]),
                        OptionPicker(selected: selectedIndex.value == 0, onSelected: () => selectedIndex.value = 0),
                      ],
                    ),
                  ),
                ),
                65.verticalSpace,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Text('Order Summary', style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 18.sp, fontWeight: FontWeight.w600)),
                ),
                18.verticalSpace,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                    Text('Flight Amount:', style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 16.sp, fontWeight: FontWeight.w500)),
                    Text('₦${FlightFormatUtils.formatAmount(amount)}', style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 16.sp, fontWeight: FontWeight.w500)),
                  ]),
                ),
                13.verticalSpace,
                Padding(padding: EdgeInsets.symmetric(horizontal: 20.w), child: Divider(color: PPaymobileColors.anotherGreyColor, height: 1.h)),
                18.verticalSpace,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                    Text('Total:', style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 18.sp, fontWeight: FontWeight.w600)),
                    Text('₦${FlightFormatUtils.formatAmount(amount)}', style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 18.sp, fontWeight: FontWeight.w600)),
                  ]),
                ),
                33.verticalSpace,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                  child: TouchOpacity(
                    onTap: bookAsync.isLoading ? null : _pay,
                    child: Container(
                      height: 46.h,
                      width: double.infinity,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(56).r, color: PPaymobileColors.buttonColorandText),
                      child: Center(
                        child: bookAsync.isLoading
                            ? SizedBox(height: 20.w, width: 20.w, child: const CircularProgressIndicator(strokeWidth: 2, valueColor: AlwaysStoppedAnimation(Colors.white)))
                            : Text('Confirm Payment', style: TextStyle(fontFamily: 'InstrumentSans', color: PPaymobileColors.mainScreenBackground, fontSize: 16.sp, fontWeight: FontWeight.w600)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
