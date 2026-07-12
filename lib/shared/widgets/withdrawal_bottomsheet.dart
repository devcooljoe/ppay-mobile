import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ppay_mobile/app/router/app_router.gr.dart';
import 'package:ppay_mobile/module/settings/domain/entities/bank_account_entity.dart';
import 'package:ppay_mobile/module/settings/presentation/providers/settings_providers.dart';
import 'package:ppay_mobile/shared/widgets/app_image.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/skeleton_loader.dart';
import 'package:ppay_mobile/shared/widgets/touch_opacity.dart';

class WithdrawalBottomsheet extends HookConsumerWidget {
  const WithdrawalBottomsheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final accountsAsync = ref.watch(getBankAccountsProvider);

    useEffect(() {
      Future.microtask(() {
        ref.read(getBankAccountsProvider.notifier).call();
      });
      return null;
    }, []);

    final accounts = accountsAsync.value ?? [];
    final hasAccounts = accounts.isNotEmpty;
    final isLoading = accountsAsync.isLoading;

    void navigateToAddBankDetails() {
      Navigator.pop(context);
      context.router.push(TransferFundsRoute());
    }

    return FractionallySizedBox(
      heightFactor: hasAccounts ? (0.18 + (accounts.length * 0.13)).clamp(0.45, 0.85) : 0.45,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          TouchOpacity(
            onTap: () => Navigator.pop(context),
            child: Container(
              height: 60.w,
              width: 60.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.r),
                color: PPaymobileColors.mainScreenBackground,
              ),
              child: Center(
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
                borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (!hasAccounts && !isLoading)
                    Text(
                      'Add Account',
                      style: TextStyle(
                        fontFamily: 'InstrumentSans',
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  if (hasAccounts || isLoading)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Select Account',
                          style: TextStyle(
                            fontFamily: 'InstrumentSans',
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                        TouchOpacity(
                          onTap: navigateToAddBankDetails,
                          child: Container(
                            height: 39.w,
                            width: 39.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.r),
                              color: PPaymobileColors.deepBackgroundColor,
                            ),
                            child: Center(
                              child: SizedBox(
                                height: 14.w,
                                width: 14.w,
                                child: SvgPicture.asset(
                                  'assets/icon/add.svg',
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  21.verticalSpace,

                  // Loading skeletons
                  if (isLoading)
                    Column(
                      children: List.generate(
                        2,
                        (_) => Padding(
                          padding: EdgeInsets.only(bottom: 16.h),
                          child: Row(
                            children: [
                              SkeletonLoader(
                                width: 53.w,
                                height: 40.h,
                                borderRadius: BorderRadius.circular(2.r),
                              ),
                              12.horizontalSpace,
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SkeletonLoader(
                                      width: 140.w,
                                      height: 14.h,
                                      borderRadius: BorderRadius.circular(4.r),
                                    ),
                                    6.verticalSpace,
                                    SkeletonLoader(
                                      width: 100.w,
                                      height: 12.h,
                                      borderRadius: BorderRadius.circular(4.r),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                  // Empty state — Add New Bank Details button
                  if (!isLoading && !hasAccounts)
                    TouchOpacity(
                      onTap: navigateToAddBankDetails,
                      child: Container(
                        height: 72.h,
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                          horizontal: 20.w,
                          vertical: 16.h,
                        ),
                        decoration: BoxDecoration(
                          color: PPaymobileColors.deepBackgroundColor,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 40.h,
                              width: 53.w,
                              padding: EdgeInsets.all(10.r),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(2.r),
                                color: PPaymobileColors.anotherbuttonbgColor,
                              ),
                              child: Center(
                                child: SizedBox(
                                  height: 27.w,
                                  width: 27.w,
                                  child: SvgPicture.asset(
                                    'assets/icon/bank_black.svg',
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ),
                            12.horizontalSpace,
                            Text(
                              'Add New Bank Details',
                              style: TextStyle(
                                fontFamily: 'InstrumentSans',
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                  // Accounts list
                  if (!isLoading && hasAccounts)
                    Expanded(
                      child: ListView.separated(
                        itemCount: accounts.length,
                        separatorBuilder: (_, __) => Divider(
                          height: 1,
                          color: PPaymobileColors.textfiedBorder,
                        ),
                        itemBuilder: (context, index) {
                          final account = accounts[index];
                          return _BankAccountItem(
                            account: account,
                            onTransfer: () {
                              Navigator.pop(context);
                              context.router.push(
                                AmountAndInfoRoute(account: account),
                              );
                            },
                          );
                        },
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _BankAccountItem extends StatelessWidget {
  final BankAccountEntity account;
  final VoidCallback onTransfer;

  const _BankAccountItem({
    required this.account,
    required this.onTransfer,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 40.h,
            width: 53.w,
            padding: EdgeInsets.all(8.r),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2.r),
              color: PPaymobileColors.anotherbuttonbgColor,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(2.r),
              child: account.bankLogo.isNotEmpty
                  ? AppImage(
                      imageUrl: account.bankLogo,
                      width: 30.w,
                      height: 28.h,
                      fit: BoxFit.contain,
                    )
                  : SvgPicture.asset(
                      'assets/icon/bank_black.svg',
                      fit: BoxFit.contain,
                    ),
            ),
          ),
          14.horizontalSpace,
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      account.accountName,
                      style: TextStyle(
                        fontFamily: 'InstrumentSans',
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                        color: Colors.black,
                      ),
                    ),
                    4.verticalSpace,
                    Row(
                      children: [
                        Text(
                          account.accountNumber,
                          style: TextStyle(
                            fontFamily: 'InstrumentSans',
                            fontWeight: FontWeight.w500,
                            fontSize: 12.sp,
                            color: PPaymobileColors.svgIconColor,
                          ),
                        ),
                        8.horizontalSpace,
                        SizedBox(
                          height: 7.w,
                          width: 7.w,
                          child: SvgPicture.asset(
                            'assets/icon/spacer.svg',
                            fit: BoxFit.contain,
                          ),
                        ),
                        8.horizontalSpace,
                        Text(
                          account.bankName,
                          style: TextStyle(
                            fontFamily: 'InstrumentSans',
                            fontWeight: FontWeight.w500,
                            fontSize: 12.sp,
                            color: PPaymobileColors.svgIconColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                TouchOpacity(
                  onTap: onTransfer,
                  child: Container(
                    height: 36.h,
                    width: 97.w,
                    padding: EdgeInsets.symmetric(
                      horizontal: 7.w,
                      vertical: 6.h,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.r),
                      color: PPaymobileColors.backgroundColor,
                    ),
                    child: Center(
                      child: Text(
                        'Transfer',
                        style: TextStyle(
                          color: PPaymobileColors.mainScreenBackground,
                          fontSize: 14.sp,
                          fontFamily: 'InstrumentSans',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
