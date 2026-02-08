import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/screens/widgets/colors.dart';

class FlightCardScreen extends StatefulWidget {
  const FlightCardScreen({super.key});

  @override
  State<FlightCardScreen> createState() => _FlightCardScreenState();
}

class _FlightCardScreenState extends State<FlightCardScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: PPaymobileColors.upcomingflightsbgColor,
        borderRadius: BorderRadius.circular(13.r),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 52.h,
            width: 376.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    4.horizontalSpace,
                    Container(
                      height: 47.h,
                      width: 47.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage('assets/images/flight_ticket.png'),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    Text(
                      'Air Peace',
                      style: TextStyle(
                        fontFamily: 'InstrumentSans',
                        color: Colors.black,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 24.h,
                      width: 24.w,
                      child: SvgPicture.asset(
                        'assets/icon/time.svg',
                        fit: BoxFit.contain,
                      ),
                    ),
                    5.horizontalSpace,
                    Text(
                      '1H 50M',
                      style: TextStyle(
                        fontFamily: 'InstrumentSans',
                        color: Colors.black,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          20.verticalSpace,

          // 16.verticalSpace,

          // // Time & route
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     _timeColumn('12:00AM', 'Lagos (Nigeria)'),
          //     Icon(Icons.arrow_forward),
          //     _timeColumn('12:00PM', 'Jos (Nigeria)'),
          //   ],
          // ),

          // 16.verticalSpace,

          // // Bottom row
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     Column(
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: [
          //         Text(
          //           '₦154,670.09',
          //           style: TextStyle(
          //             fontWeight: FontWeight.w600,
          //             color: Color(0xFF0B6B61),
          //           ),
          //         ),
          //         4.verticalSpace,
          //         Text(
          //           '4 Seats Available',
          //           style: TextStyle(fontSize: 12.sp, color: Colors.grey),
          //         ),
          //       ],
          //     ),

          //     SizedBox(
          //       height: 36.h,
          //       child: ElevatedButton(
          //         style: ElevatedButton.styleFrom(
          //           backgroundColor: Color(0xFF0B6B61),
          //           shape: RoundedRectangleBorder(
          //             borderRadius: BorderRadius.circular(20.r),
          //           ),
          //         ),
          //         onPressed: () {},
          //         child: const Text('Pick Flight'),
          //       ),
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }

  // Widget _timeColumn(String time, String location) {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       Text(time, style: TextStyle(fontWeight: FontWeight.w600)),
  //       4.verticalSpace,
  //       Text(
  //         location,
  //         style: TextStyle(fontSize: 12.sp, color: Colors.grey),
  //       ),
  //     ],
  //   );
  // }
}
