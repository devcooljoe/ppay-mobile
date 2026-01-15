import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ppay_mobile/screens/widgets/colors.dart';

class FaqTile extends StatefulWidget {
  final String question;
  final String answer;

  const FaqTile({super.key, required this.question, required this.answer});

  @override
  State<FaqTile> createState() => _FaqTileState();
}

class _FaqTileState extends State<FaqTile> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 18.h),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1.w,
          color: PPaymobileColors.deepBackgroundColor,
        ),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          tilePadding: EdgeInsets.symmetric(horizontal: 16.w),
          childrenPadding: EdgeInsets.all(16).r,
          onExpansionChanged: (expanded) {
            setState(() {
              _isExpanded = expanded;
            });
          },
          trailing: SizedBox(
            height: 20.h,
            width: 20.w,
            child: SvgPicture.asset(
              _isExpanded ? 'assets/icon/minus.svg' : 'assets/icon/add.svg',
              fit: BoxFit.contain,
            ),
          ),
          title: Text(
            widget.question,
            textAlign: TextAlign.start,
            style: TextStyle(
              fontFamily: 'InstrumentSans',
              fontWeight: FontWeight.w500,
              fontSize: 14.sp,
            ),
          ),
          children: [
            Text(
              widget.answer,
              textAlign: TextAlign.start,
              style: TextStyle(
                fontFamily: 'InstrumentSans',
                fontSize: 14.sp,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
