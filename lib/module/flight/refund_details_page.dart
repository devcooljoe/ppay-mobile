import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:ppay_mobile/app/router/app_router.gr.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/module/flight/cancel_flight_successful_page.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/refund_policy_bottomsheet.dart';
import 'package:ppay_mobile/shared/widgets/touch_opacity.dart';

@RoutePage()
class RefundDetailsPage extends HookConsumerWidget {
  const RefundDetailsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

              },
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'You confirm that you agree to our',
                  style: TextStyle(
                    fontFamily: 'InstrumentSans',
                    color: Colors.black,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0,
                  ),
                  children: [
                    TextSpan(
                      text: ' flight cancellation policy',
                      style: TextStyle(
                        fontFamily: 'InstrumentSans',
                        color: Color(0xFF73A88C),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0,
                        decoration: TextDecoration.underline,
                        decorationColor: Color(0xFF73A88C),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            19.verticalSpace,
            TouchOpacity(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CancelFlightSuccessfulPage(),
                  ),

              },
              child: Container(
                height: 54.h,
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(56).r,
                  color: PPaymobileColors.buttonColorandText,
                ),
                child: Center(
                  child: Text(
                    'Cancel Flight',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
            34.verticalSpace,
          ],
        ),
              ),
      ),
    );  }
