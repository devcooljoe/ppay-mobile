import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/screens/widgets/colors.dart';

class ChatBubble extends StatelessWidget {
  final String text;
  final bool isSender;

  const ChatBubble({super.key, required this.text, required this.isSender});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
      child: isSender
          ? SizedBox(
              width: 268.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 268.w,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 268.w,
                          decoration: BoxDecoration(
                            color: isSender
                                ? PPaymobileColors.buttonColor
                                : PPaymobileColors.deepBackgroundColor,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(23).r,
                              topRight: Radius.circular(24).r,
                              bottomLeft: Radius.circular(23).r,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 15.w,
                              vertical: 11.h,
                            ),
                            child: Text(
                              text,
                              style: TextStyle(
                                color: isSender ? Colors.white : Colors.black,
                              ),
                            ),
                          ),
                        ),
                        4.verticalSpace,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 19.w,
                              width: 19.w,
                              child: SvgPicture.asset(
                                'assets/icon/double_tick.svg',
                                fit: BoxFit.contain,
                              ),
                            ),
                            4.horizontalSpace,
                            Text(
                              'Sent 03:01pm',
                              style: TextStyle(
                                fontFamily: 'InstrumentSans',
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  48.verticalSpace,
                ],
              ),
            )
          : SizedBox(
              width: 310.w,
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        height: 36.w,
                        width: 36.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18).r,
                          color: PPaymobileColors.doneColor,
                        ),
                        child: Center(
                          child: SizedBox(
                            height: 20.w,
                            width: 20.w,
                            child: SvgPicture.asset(
                              'assets/icon/support_white.svg',
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                      6.horizontalSpace,
                      SizedBox(
                        width: 268.w,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: 268.w,
                              decoration: BoxDecoration(
                                color: isSender
                                    ? PPaymobileColors.buttonColor
                                    : PPaymobileColors.deepBackgroundColor,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(23).r,
                                  topRight: Radius.circular(24).r,
                                  bottomLeft: Radius.circular(23).r,
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 15.w,
                                  vertical: 11.h,
                                ),
                                child: Text(
                                  text,
                                  style: TextStyle(
                                    color: isSender
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  4.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        height: 19.w,
                        width: 19.w,
                        child: SvgPicture.asset(
                          'assets/icon/double_tick.svg',
                          fit: BoxFit.contain,
                        ),
                      ),
                      4.horizontalSpace,
                      Text(
                        'Received 03:01pm',
                        style: TextStyle(
                          fontFamily: 'InstrumentSans',
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  48.verticalSpace,
                ],
              ),
            ),
    );
  }
}
