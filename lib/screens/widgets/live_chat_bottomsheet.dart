import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/screens/widgets/chat_bible.dart';
import 'package:ppay_mobile/screens/widgets/colors.dart';

void showLiveChatSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (_) => const LiveChatSheet(),
  );
}

class LiveChatSheet extends StatefulWidget {
  const LiveChatSheet({super.key});

  @override
  State<LiveChatSheet> createState() => _LiveChatSheetState();
}

class _LiveChatSheetState extends State<LiveChatSheet> {
  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.840,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Transform.translate(
            offset: const Offset(0, 0),
            child: GestureDetector(
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
                  child: SvgPicture.asset(
                    'assets/icon/cancel.svg',
                    fit: BoxFit.scaleDown,
                  ),
                ),
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
                borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Live Chat',
                        style: TextStyle(
                          fontFamily: 'InstrumentSans',
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        height: 24.w,
                        width: 24.w,
                        child: SvgPicture.asset(
                          'assets/icon/chat_black.svg',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ],
                  ),
                  36.verticalSpace,
                  Expanded(
                    child: ListView(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Divider(
                                color: PPaymobileColors.textfiedBorder,
                                height: 1.h,
                              ),
                            ),
                            25.horizontalSpace,
                            Text(
                              'Today 30 Jul, 2025',
                              style: TextStyle(
                                fontFamily: 'InstrumentSans',
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                            25.horizontalSpace,
                            Expanded(
                              child: Divider(
                                color: PPaymobileColors.textfiedBorder,
                                height: 1.h,
                              ),
                            ),
                          ],
                        ),
                        40.verticalSpace,
                        const ChatBubble(
                          text: 'Good day, Samuel. How can we help you today?',
                          isSender: false,
                        ),
                        const ChatBubble(
                          text: 'Good day. Yes, I need help funding my wallet.',
                          isSender: true,
                        ),
                        const ChatBubble(
                          text: 'Send your details and your wallet ID',
                          isSender: false,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 52.h,
                    width: double.infinity,
                    child: TextFormField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(16).r,
                        filled: true,
                        fillColor: PPaymobileColors.deepBackgroundColor,
                        prefixIcon: SizedBox(
                          height: 24.w,
                          width: 24.w,
                          child: SvgPicture.asset(
                            'assets/icon/link_black.svg',
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                        hintText: 'Send message',
                        hintStyle: TextStyle(
                          fontFamily: 'Gilroy',
                          fontWeight: FontWeight.w400,
                          fontSize: 16.sp,
                          color: PPaymobileColors.svgIconColor,
                        ),
                        suffixIcon: SizedBox(
                          height: 26.w,
                          width: 26.w,
                          child: SvgPicture.asset(
                            'assets/icon/sent.svg',
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6.r),
                          borderSide: BorderSide(
                            color: PPaymobileColors.textfiedBorder,
                            width: 1.w,
                          ),
                        ),
                      ),
                    ),
                  ),
                  24.verticalSpace,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
