import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';

class FaqTile extends HookConsumerWidget {
  final String question;
  final String answer;

  const FaqTile({super.key, required this.question, required this.answer});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isExpanded = useState(false);
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
          onExpansionChanged: (expanded) => isExpanded.value = expanded,
          trailing: SizedBox(
            height: 20.w,
            width: 20.w,
            child: SvgPicture.asset(
              isExpanded.value ? 'assets/icon/minus.svg' : 'assets/icon/add.svg',
              fit: BoxFit.contain,
            ),
          ),
          title: Text(
            question,
            textAlign: TextAlign.start,
            style: TextStyle(
              fontFamily: 'InstrumentSans',
              fontWeight: FontWeight.w500,
              fontSize: 14.sp,
            ),
          ),
          children: [
            Text(
              answer,
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
