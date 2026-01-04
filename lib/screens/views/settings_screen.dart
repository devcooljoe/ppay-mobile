import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/model/settings_option_model.dart';
import 'package:ppay_mobile/screens/widgets/colors.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PPaymobileColors.deepBackgroundColor,
      appBar: AppBar(
        backgroundColor: PPaymobileColors.mainScreenBackground,
        toolbarHeight: 56,
        leadingWidth: 56.w,
        title: Text(
          'Settings',
          style: TextStyle(
            fontFamily: 'InstrumentSans',
            color: Colors.black,
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        leading: Padding(
          padding: EdgeInsets.only(left: 10.w),
          child: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: SizedBox(
              height: 24.h,
              width: 24.w,
              child: SvgPicture.asset(
                'assets/icon/arrow_back.svg',
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              height: 127.h,
              width: double.infinity,
              color: PPaymobileColors.mainScreenBackground,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 68.h,
                    width: 68.w,
                    color: Colors.transparent,
                    child: Stack(
                      children: [
                        CircleAvatar(
                          radius: 31.5.r,
                          backgroundColor: PPaymobileColors.backgroundColor,
                          child: Center(
                            child: Text(
                              'AS',
                              style: TextStyle(
                                fontFamily: 'InstrumentSans',
                                color: PPaymobileColors.mainScreenBackground,
                                fontSize: 24.sp,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          right: 5.w,
                          bottom: 5.h,
                          child: CircleAvatar(
                            backgroundColor:
                                PPaymobileColors.deepBackgroundColor,
                            radius: 8.r,
                            child: Center(
                              child: SizedBox(
                                height: 12.h,
                                width: 12.w,
                                child: SvgPicture.asset(
                                  'assets/icon/edit.svg',
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  8.verticalSpace,
                  Text(
                    'Adebami Samuel',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: Colors.black,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  2.verticalSpace,
                  Text(
                    'adebamisamuel45@gmail.com',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: Colors.black,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 50.h,
              width: double.infinity,
              color: PPaymobileColors.mainScreenBackground,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  8.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 19.h,
                        width: 19.w,
                        child: Center(
                          child: Image.asset(
                            'assets/images/award.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      5.horizontalSpace,
                      Container(
                        height: 24.h,
                        width: 124.w,
                        padding: EdgeInsets.symmetric(horizontal: 14.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(45).r,
                          color: PPaymobileColors.doneColor,
                        ),
                        child: Text(
                          'Account Tire 3',
                          style: TextStyle(
                            fontFamily: 'InstrumentSans',
                            color: PPaymobileColors.doneTextColor,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            16.verticalSpace,
            ListView.separated(
              itemCount: settingsGroup.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              separatorBuilder: (_, __) => 16.verticalSpace,
              itemBuilder: (context, groupIndex) {
                final group = settingsGroup[groupIndex];
                return Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 17.h,
                  ),
                  color: PPaymobileColors.mainScreenBackground,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        group.optionGroup,
                        style: TextStyle(
                          fontFamily: 'InstrumentSans',
                          color: PPaymobileColors.svgIconColor,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      12.verticalSpace,
                      ListView.separated(
                        itemCount: group.group.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        separatorBuilder: (_, __) => 20.verticalSpace,
                        itemBuilder: (context, index) {
                          final option = group.group[index];

                          final isLogout =
                              option.optionTitle.toLowerCase() == 'logout';
                          final isBiometric =
                              option.optionTitle.toLowerCase() ==
                              'enable biometric';
                          final isKyc =
                              option.optionTitle == 'Kyc Verification';
                          final isKycTitle =
                              option.optionTitle.toLowerCase() ==
                              'kyc verification';

                          return GestureDetector(
                            onTap: option.optionScreen != null
                                ? () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => option.optionScreen!,
                                      ),
                                    );
                                  }
                                : null,
                            child: Row(
                              children: [
                                Container(
                                  height: 44.h,
                                  width: 44.w,
                                  decoration: BoxDecoration(
                                    color: PPaymobileColors.deepBackgroundColor,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Center(
                                    child: SvgPicture.asset(
                                      option.optionIcon,
                                      height: 20.h,
                                      width: 20.w,
                                      color: isLogout ? Colors.red : null,
                                    ),
                                  ),
                                ),
                                12.horizontalSpace,
                                Expanded(
                                  child: Row(
                                    children: [
                                      Text(
                                        option.optionTitle,
                                        style: TextStyle(
                                          fontFamily: 'InstrumentSans',
                                          color: isLogout
                                              ? Colors.red
                                              : Colors.black,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),

                                      if (isKycTitle) ...[
                                        8.horizontalSpace,
                                        Container(
                                          height: 29.h,
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 6.w,
                                            vertical: 3.h,
                                          ),
                                          decoration: BoxDecoration(
                                            color:
                                                PPaymobileColors.warningColor,
                                            borderRadius: BorderRadius.circular(
                                              4,
                                            ).r,
                                          ),
                                          child: Text(
                                            'Pending',
                                            style: TextStyle(
                                              fontFamily: 'InstrumentSans',
                                              color: PPaymobileColors
                                                  .warningTextColor,
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ],
                                  ),
                                ),

                                if (!isLogout)
                                  isBiometric
                                      ? Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Switch(
                                              value: true,
                                              thumbColor:
                                                  WidgetStateProperty.resolveWith<
                                                    Color
                                                  >((states) {
                                                    return PPaymobileColors
                                                        .buttonColor;
                                                  }),
                                              trackColor:
                                                  WidgetStateProperty.resolveWith<
                                                    Color
                                                  >((states) {
                                                    return PPaymobileColors
                                                        .doneColor;
                                                  }),
                                              trackOutlineColor:
                                                  WidgetStateProperty.resolveWith<
                                                    Color?
                                                  >((states) {
                                                    return Colors.transparent;
                                                  }),
                                              onChanged: (value) {},
                                            ),
                                            6.horizontalSpace,
                                            SizedBox(
                                              height: 24.h,
                                              width: 12.w,
                                              child: SvgPicture.asset(
                                                'assets/icon/arrow_forward.svg',
                                                fit: BoxFit.contain,
                                              ),
                                            ),
                                          ],
                                        )
                                      : isKyc
                                      ? Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Container(
                                              height: 29.h,
                                              // width: 56.w,
                                              padding: EdgeInsets.symmetric(
                                                horizontal: 6.w,
                                                vertical: 3.h,
                                              ),
                                              decoration: BoxDecoration(
                                                color: PPaymobileColors
                                                    .warningColor,
                                                borderRadius:
                                                    BorderRadius.circular(4).r,
                                              ),
                                              child: Text(
                                                'Pending',
                                                style: TextStyle(
                                                  fontFamily: 'InstrumentSans',
                                                  color: PPaymobileColors
                                                      .warningTextColor,
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ),
                                            6.horizontalSpace,
                                            SizedBox(
                                              height: 24.h,
                                              width: 12.w,
                                              child: SvgPicture.asset(
                                                'assets/icon/arrow_forward.svg',
                                                fit: BoxFit.contain,
                                              ),
                                            ),
                                          ],
                                        )
                                      : SizedBox(
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
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
