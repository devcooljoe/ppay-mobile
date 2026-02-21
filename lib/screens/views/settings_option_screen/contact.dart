import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/screens/widgets/colors.dart';
import 'package:ppay_mobile/screens/widgets/expandable.dart';
import 'package:ppay_mobile/screens/widgets/live_chat_bottomsheet.dart';
import 'package:ppay_mobile/screens/widgets/ticket_bottomsheet.dart';

class ContactTab extends StatefulWidget {
  const ContactTab({super.key});

  @override
  State<ContactTab> createState() => _ContactTabState();
}

class _ContactTabState extends State<ContactTab> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      children: [
        32.verticalSpace,
        SizedBox(
          height: 54.h,
          width: double.infinity,
          child: TextFormField(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                horizontal: 10.h,
                vertical: 14.w,
              ),
              prefixIcon: SizedBox(
                height: 24.w,
                width: 24.w,
                child: SvgPicture.asset(
                  'assets/icon/bank_search.svg',
                  fit: BoxFit.scaleDown,
                ),
              ),
              hintText: 'Search',
              hintStyle: TextStyle(
                fontFamily: 'InstrumentSans',
                color: PPaymobileColors.textfiedBorder,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
              filled: true,
              fillColor: PPaymobileColors.deepBackgroundColor,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4).r,
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
        35.verticalSpace,
        Text(
          'Reach us for any Support',
          style: TextStyle(
            fontFamily: 'InstrumentSans',
            color: Colors.black,
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        32.verticalSpace,
        InkWell(
          onTap: () => showLiveChatSheet(context),
          child: contactTile('assets/icon/chat.svg', 'Live Chat'),
        ),

        SupportExpandable(
          svgImage: 'assets/icon/whatsapp.svg',
          title: 'Whatsapp',
          child: contactAction('(234) 803 4693 028', 'Chat on Whatsapp'),
        ),

        InkWell(
          onTap: () => showSupportTicketSheet(context),
          child: contactTile('assets/icon/message.svg', 'Support Ticket'),
        ),

        SupportExpandable(
          svgImage: 'assets/icon/call.svg',
          title: 'Call Support',
          child: contactAction('(234) 803 4693 028', 'Copy'),
        ),
      ],
    );
  }

  Widget contactTile(String image, String title) {
    return Container(
      margin: EdgeInsets.only(bottom: 24.h),
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 14.h),
      decoration: BoxDecoration(
        border: Border.all(color: PPaymobileColors.textfiedBorder),
        borderRadius: BorderRadius.circular(5.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SizedBox(
                height: 20.w,
                width: 20.w,
                child: SvgPicture.asset(image, fit: BoxFit.contain),
              ),
              10.horizontalSpace,
              Text(
                title,
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: Colors.black,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 24.h,
            width: 12.w,
            child: SvgPicture.asset(
              'assets/icon/arrow_forward.svg',
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }

  Widget contactAction(String text, String button) {
    return Row(
      children: [
        SizedBox(
          height: 16.w,
          width: 16.w,
          child: SvgPicture.asset(
            'assets/icon/indicator.svg',
            fit: BoxFit.contain,
          ),
        ),
        10.horizontalSpace,
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              fontFamily: 'InstrumentSans',
              color: PPaymobileColors.svgIconColor,
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        Container(
          height: 28.h,
          padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 2.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6).r,
            border: Border.all(
              color: PPaymobileColors.textfiedBorder,
              width: 1.w,
            ),
          ),
          child: Center(
            child: Text(
              button,
              style: TextStyle(
                fontFamily: 'InstrumentSans',
                color: Colors.black,
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
