import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/screens/widgets/colors.dart';

class SupportExpandable extends StatefulWidget {
  final String svgImage;
  final String title;
  final Widget child;

  const SupportExpandable({
    super.key,
    required this.svgImage,
    required this.title,
    required this.child,
  });

  @override
  State<SupportExpandable> createState() => _SupportExpandableState();
}

class _SupportExpandableState extends State<SupportExpandable> {
  bool _isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 24.h),
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 14.h),
      decoration: BoxDecoration(
        border: Border.all(color: PPaymobileColors.textfiedBorder),
        borderRadius: BorderRadius.circular(5.r),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          tilePadding: EdgeInsets.zero,
          childrenPadding: EdgeInsets.zero,
          visualDensity: VisualDensity.compact,
          dense: true,
          onExpansionChanged: (expanded) {
            setState(() {
              _isExpanded = expanded;
            });
          },
          title: Row(
            children: [
              SizedBox(
                height: 20.h,
                width: 20.w,
                child: SvgPicture.asset(widget.svgImage),
              ),
              10.horizontalSpace,
              Text(
                widget.title,
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          trailing: SizedBox(
            height: 20.h,
            width: 20.w,
            child: SvgPicture.asset(
              _isExpanded
                  ? 'assets/icon/arrow_down.svg'
                  : 'assets/icon/arrow_forward.svg',
              fit: BoxFit.contain,
            ),
          ),
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Divider(
                  height: 1.h,
                  color: PPaymobileColors.deepBackgroundColor,
                ),
                21.verticalSpace,
              ],
            ),
            widget.child,
          ],
        ),
      ),
    );
  }
}
