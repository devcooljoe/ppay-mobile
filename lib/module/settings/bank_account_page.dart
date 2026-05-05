import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:ppay_mobile/app/router/app_router.gr.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/shared/models/bank_accounts_model.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/touch_opacity.dart';

@RoutePage()
class BankAccountPage extends HookConsumerWidget {
  const BankAccountPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: PPaymobileColors.mainScreenBackground,
      appBar: AppBar(
        backgroundColor: PPaymobileColors.mainScreenBackground,
        toolbarHeight: 56,
        leadingWidth: 56.w,
        centerTitle: true,
        title: Text(
          'Bank',
          style: TextStyle(
            fontFamily: 'InstrumentSans',
            color: Colors.black,
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        leading: Padding(
          padding: EdgeInsets.only(left: 20.w),
          child: TouchOpacity(
            onTap: () => Navigator.pop(context),
            child: SizedBox(
              height: 24.w,
              width: 24.w,
              child: SvgPicture.asset(
                'assets/icon/arrow_back.svg',
                fit: BoxFit.scaleDown,
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              32.verticalSpace,
              Text(
                'Bank Accounts',
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: Colors.black,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              8.verticalSpace,
              Text(
                'You can manage all your bank account ',
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: PPaymobileColors.svgIconColor,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              51.verticalSpace,
              Expanded(
                child: ListView.separated(
                  itemCount: banksaccountModel.length,
                  separatorBuilder: (context, index) => Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Divider(
                      color: PPaymobileColors.textfiedBorder,
                      height: 1,
                    ),
                  ),
                  itemBuilder: (context, index) {
                    final bank = banksaccountModel[index];

                    return ListTile(
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 6.h,
                      ),

                      // Bank logo
                      leading: Container(
                        height: 40.h,
                        width: 53.w,
                        padding: EdgeInsets.all(10.r),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF4F6F8),
                          borderRadius: BorderRadius.circular(2.r),
                        ),
                        child: SizedBox(
                          height: 28.w,
                          width: 28.w,
                          child: Image.asset(
                            bank.bankImage,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),

                      // Account name
                      title: Text(
                        bank.accountName,
                        style: TextStyle(
                          fontFamily: 'InstrumentSans',
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),

                      // Account number • Bank name
                      subtitle: Text(
                        '${bank.accountNumber}  •  ${bank.bankName}',
                        style: TextStyle(
                          fontFamily: 'InstrumentSans',
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: PPaymobileColors.svgIconColor,
                        ),
                      ),

                      // Manage button
                      trailing: GestureDetector(
                        onTap: () {
                          context.router.push(EditAccountRoute());
                        },
                        child: Container(
                          height: 36.h,
                          width: 97.w,
                          padding: EdgeInsets.symmetric(
                            horizontal: 7.w,
                            vertical: 6.h,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6.r),
                            border: Border.all(
                              color: PPaymobileColors.textfiedBorder,
                              width: 1.w,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'Manage',
                              style: TextStyle(
                                fontFamily: 'InstrumentSans',
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
