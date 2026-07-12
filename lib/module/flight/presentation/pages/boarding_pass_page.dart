import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:auto_route/auto_route.dart';
import 'package:ppay_mobile/module/flight/domain/entities/flight_entity.dart';
import 'package:ppay_mobile/module/flight/presentation/providers/flight_providers.dart';
import 'package:ppay_mobile/module/flight/presentation/providers/selected_flight_provider.dart';
import 'package:ppay_mobile/module/flight/presentation/utils/flight_format_utils.dart';
import 'package:ppay_mobile/shared/widgets/app_image.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/skeleton_loader.dart';
import 'package:ppay_mobile/shared/widgets/touch_opacity.dart';

@RoutePage()
class BoardingPassPage extends HookConsumerWidget {
  const BoardingPassPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scrollController = useScrollController();
    final isOpaque = useState(false);
    final boardingPassAsync = ref.watch(getBoardingPassProvider);
    final bookingResult = ref.watch(flightBookingResultProvider);

    useEffect(() {
      void listener() {
        isOpaque.value = scrollController.offset >= 30;
      }
      scrollController.addListener(listener);
      return () => scrollController.removeListener(listener);
    }, [scrollController]);

    useEffect(() {
      final ref_ = bookingResult?.bookingReference;
      if (ref_ != null && ref_.isNotEmpty) {
        Future.microtask(() => ref.read(getBoardingPassProvider.notifier).call(ref_));
      }
      return null;
    }, [bookingResult?.bookingReference]);

    return Scaffold(
      backgroundColor: PPaymobileColors.buttonColorandText,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        animateColor: true,
        backgroundColor: isOpaque.value ? PPaymobileColors.buttonColorandText : Colors.transparent,
        centerTitle: true,
        title: Text('Boarding Pass', style: TextStyle(fontFamily: 'InstrumentSans', color: PPaymobileColors.mainScreenBackground, fontSize: 18.sp, fontWeight: FontWeight.w500)),
        leading: Padding(
          padding: EdgeInsets.only(left: 20.w),
          child: TouchOpacity(onTap: () => Navigator.pop(context), child: SizedBox(height: 24.w, width: 24.w, child: SvgPicture.asset('assets/icon/arrow_back_white.svg', fit: BoxFit.scaleDown))),
        ),
      ),
      body: boardingPassAsync.when(
        loading: () => Stack(children: [
          Positioned(bottom: 0, child: Container(width: ScreenUtil().screenWidth, height: ScreenUtil().screenHeight * 0.5, color: Colors.white)),
          Center(child: SkeletonLoader(width: 390.w, height: 751.h, borderRadius: BorderRadius.circular(21.r))),
        ]),
        error: (e, _) => Center(child: Padding(
          padding: EdgeInsets.all(20.w),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(e.toString(), textAlign: TextAlign.center, style: TextStyle(fontFamily: 'InstrumentSans', fontSize: 14.sp, color: PPaymobileColors.svgIconColor)),
            24.verticalSpace,
            TouchOpacity(onTap: () => Navigator.pop(context), child: Container(height: 46.h, width: 200.w, decoration: BoxDecoration(borderRadius: BorderRadius.circular(56).r, color: PPaymobileColors.buttonColorandText), child: Center(child: Text('Go Back', style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.white, fontSize: 14.sp, fontWeight: FontWeight.w600))))),
          ]),
        )),
        data: (boardingPass) {
          if (boardingPass == null) {
            return Stack(children: [
              Positioned(bottom: 0, child: Container(width: ScreenUtil().screenWidth, height: ScreenUtil().screenHeight * 0.5, color: Colors.white)),
              Center(child: Text('No boarding pass available', style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.white, fontSize: 14.sp))),
            ]);
          }
          return Stack(
            children: [
              Positioned(bottom: 0, child: Container(width: ScreenUtil().screenWidth, height: ScreenUtil().screenHeight * 0.5, color: Colors.white)),
              SingleChildScrollView(
                controller: scrollController,
                child: Stack(
                  children: [
                    Column(
                      children: [
                        Container(padding: EdgeInsets.only(top: 50.h), width: double.infinity, height: ScreenUtil().screenHeight * 0.25, color: PPaymobileColors.buttonColorandText, child: Image.asset('assets/images/flight_bg.png', fit: BoxFit.cover)),
                        Container(width: double.infinity, height: ScreenUtil().screenHeight * 0.65, color: Colors.white),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        90.verticalSpace,
                        Center(
                          child: SizedBox(
                            height: 762.h, width: 400.w,
                            child: Stack(
                              children: [
                                Align(
                                  alignment: Alignment.center,
                                  child: Container(
                                    height: 751.h, width: 390.w,
                                    padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
                                    decoration: BoxDecoration(color: PPaymobileColors.mainScreenBackground, borderRadius: BorderRadius.circular(21.r), boxShadow: [BoxShadow(offset: const Offset(0, 0), blurRadius: 3.r, color: const Color(0xffD9D9D9), blurStyle: BlurStyle.outer)]),
                                    child: _BoardingPassContent(boardingPass: boardingPass),
                                  ),
                                ),
                                ..._buildNotches(),
                              ],
                            ),
                          ),
                        ),
                        45.verticalSpace,
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TouchOpacity(
                                onTap: () {},
                                child: Container(
                                  height: 46.h, width: 190.w,
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(65).r, color: PPaymobileColors.buttonColorandText),
                                  child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                                    SizedBox(height: 24.h, width: 24.h, child: SvgPicture.asset('assets/icon/dbt.svg', fit: BoxFit.contain)),
                                    12.horizontalSpace,
                                    Text('Download', style: TextStyle(fontFamily: 'InstrumentSans', color: PPaymobileColors.mainScreenBackground, fontSize: 16.sp, fontWeight: FontWeight.w600)),
                                  ]),
                                ),
                              ),
                              TouchOpacity(
                                onTap: () {},
                                child: Container(
                                  height: 46.h, width: 190.w,
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(65).r, color: PPaymobileColors.mainScreenBackground, border: Border.all(color: PPaymobileColors.textfieldGrey, width: 1.w)),
                                  child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                                    SizedBox(height: 24.h, width: 24.h, child: SvgPicture.asset('assets/icon/share_2.svg', fit: BoxFit.contain)),
                                    12.horizontalSpace,
                                    Text('Share', style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 16.sp, fontWeight: FontWeight.w600)),
                                  ]),
                                ),
                              ),
                            ],
                          ),
                        ),
                        12.verticalSpace,
                      ],
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  List<Widget> _buildNotches() {
    Widget notch(double top, {bool right = false}) => Positioned(
      left: right ? null : -15.w,
      right: right ? -15.w : null,
      top: top,
      child: Container(
        height: 32.w, width: 32.w,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(16.r), color: Colors.white, border: Border.all(width: 1.w, color: PPaymobileColors.deepBackgroundColor), boxShadow: [BoxShadow(offset: const Offset(0, 0), blurRadius: 1.r, color: const Color(0xffD9D9D9), blurStyle: BlurStyle.outer)]),
      ),
    );
    return [notch(187.h), notch(187.h, right: true), notch(538.h), notch(538.h, right: true)];
  }
}

class _BoardingPassContent extends StatelessWidget {
  final BoardingPassEntity boardingPass;
  const _BoardingPassContent({required this.boardingPass});

  @override
  Widget build(BuildContext context) {
    final firstPassenger = boardingPass.passengers.isNotEmpty ? boardingPass.passengers.first : null;
    final firstTicket = boardingPass.tickets.isNotEmpty ? boardingPass.tickets.first : null;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 91.h, width: 91.h,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.r)),
          child: AppImage(imageUrl: boardingPass.airlineLogo, width: 91.w, height: 91.w, fit: BoxFit.contain),
        ),
        4.verticalSpace,
        Text(boardingPass.airline, style: TextStyle(fontFamily: 'InstrumentSans', color: PPaymobileColors.svgIconColor, fontSize: 14.sp, fontWeight: FontWeight.w500)),
        2.verticalSpace,
        Text(boardingPass.flightNumber, style: TextStyle(fontFamily: 'InstrumentSans', color: PPaymobileColors.svgIconColor, fontSize: 10.sp, fontWeight: FontWeight.w500)),
        40.verticalSpace,
        SizedBox(height: 3.h, width: 355.w, child: SvgPicture.asset('assets/icon/dashed_3.svg', fit: BoxFit.contain)),
        36.verticalSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(boardingPass.origin, style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 24.sp, fontWeight: FontWeight.w600)),
              4.verticalSpace,
              Text('DEPARTURE', style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 14.sp, fontWeight: FontWeight.w500)),
            ]),
            SizedBox(
              width: 119.w, height: 73.h,
              child: Stack(alignment: Alignment.center, clipBehavior: Clip.none, children: [
                SvgPicture.asset('assets/icon/crmeter.svg'),
                Positioned(bottom: 16, child: SvgPicture.asset('assets/icon/airplane_g.svg', width: 24.w, height: 24.w)),
                Positioned(bottom: 0.h, child: Text(FlightFormatUtils.formatDuration(boardingPass.duration), style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 14.sp, fontWeight: FontWeight.w500))),
              ]),
            ),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(boardingPass.destination, style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 24.sp, fontWeight: FontWeight.w600)),
              4.verticalSpace,
              Text('ARRIVAL', style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 14.sp, fontWeight: FontWeight.w500)),
            ]),
          ],
        ),
        32.verticalSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _InfoBox(icon: 'assets/icon/time_b.svg', label: 'Time', value: '${FlightFormatUtils.formatTime(boardingPass.departureTime)} - ${FlightFormatUtils.formatTime(boardingPass.arrivalTime)}'),
            _InfoBox(icon: 'assets/icon/calendar.svg', label: 'Date', value: FlightFormatUtils.formatDate(boardingPass.departureTime)),
          ],
        ),
        35.verticalSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _DetailItem(label: 'Flight', value: boardingPass.flightNumber),
            _DetailItem(label: 'Class', value: boardingPass.cabinClass),
            _DetailItem(label: 'Booking Ref', value: boardingPass.bookingReference.length > 10 ? boardingPass.bookingReference.substring(0, 10) : boardingPass.bookingReference),
            _DetailItem(label: 'Status', value: boardingPass.status),
          ],
        ),
        41.verticalSpace,
        SizedBox(height: 3.h, width: 355.w, child: SvgPicture.asset('assets/icon/dashed_3.svg', fit: BoxFit.contain)),
        24.verticalSpace,
        if (firstPassenger != null) ...[
          Text('Passenger name', style: TextStyle(fontFamily: 'InstrumentSans', color: PPaymobileColors.buttonColor, fontSize: 10.sp, fontWeight: FontWeight.w500)),
          2.verticalSpace,
          Text(firstPassenger.name, style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 14.sp, fontWeight: FontWeight.w500)),
          10.verticalSpace,
        ],
        if (firstTicket != null) ...[
          SizedBox(height: 65.h, width: 349.w, child: SvgPicture.asset('assets/icon/bar_code.svg', fit: BoxFit.contain)),
          2.verticalSpace,
          Text(firstTicket.ticketNumber, style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 12.sp, fontWeight: FontWeight.w500)),
        ],
      ],
    );
  }
}

class _InfoBox extends StatelessWidget {
  final String icon;
  final String label;
  final String value;
  const _InfoBox({required this.icon, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h, width: 178.w,
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10).r, color: const Color(0xffF9F9F9)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(height: 24.h, width: 24.h, child: SvgPicture.asset(icon, fit: BoxFit.contain)),
        8.verticalSpace,
        Text(label, style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 12.sp, fontWeight: FontWeight.w500)),
        5.verticalSpace,
        Text(value, style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 12.sp, fontWeight: FontWeight.w500)),
      ]),
    );
  }
}

class _DetailItem extends StatelessWidget {
  final String label;
  final String value;
  const _DetailItem({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(label, style: TextStyle(fontFamily: 'InstrumentSans', color: PPaymobileColors.anotherGreyColor, fontSize: 12.sp, fontWeight: FontWeight.w500)),
      2.verticalSpace,
      Text(value, style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 14.sp, fontWeight: FontWeight.w500)),
    ]);
  }
}
