import 'package:flutter/material.dart';
import 'package:flutter/services.dart' hide MessageHandler;
import 'package:auto_route/auto_route.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/core/utils/message_handler.dart';
import 'package:ppay_mobile/module/dashboard/providers/wallet_provider.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/pp_app_bar.dart';
import 'package:ppay_mobile/shared/widgets/pp_button.dart';
import 'package:ppay_mobile/shared/widgets/skeleton_loader.dart';
import 'package:share_plus/share_plus.dart';

@RoutePage()
class FundWalletPage extends ConsumerWidget {
  const FundWalletPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final walletAsync = ref.watch(walletProvider);
    final wallet = walletAsync.value;
    final isLoading = walletAsync.isLoading;

    void copyAccountNumber() {
      if (wallet == null) return;
      Clipboard.setData(ClipboardData(text: wallet.accountNumber));
      MessageHandler.showSuccessSnackBar(
        context,
        'Account number copied successfully',
      );
    }

    void copyAll() {
      if (wallet == null) return;
      final text =
          'Bank: ${wallet.bankName}\nAccount Name: ${wallet.accountName}\nAccount Number: ${wallet.accountNumber}';
      Clipboard.setData(ClipboardData(text: text));
      MessageHandler.showSuccessSnackBar(
        context,
        'Account details copied successfully',
      );
    }

    void shareAll() {
      if (wallet == null) return;
      final box = context.findRenderObject() as RenderBox?;
      final text =
          'Bank: ${wallet.bankName}\nAccount Name: ${wallet.accountName}\nAccount Number: ${wallet.accountNumber}';
      Share.share(
        text,
        sharePositionOrigin: box != null
            ? box.localToGlobal(Offset.zero) & box.size
            : Rect.zero,
      );
    }

    return Scaffold(
      backgroundColor: PPaymobileColors.mainScreenBackground,
      appBar: PPAppBar(
        title: 'Fund Wallet',
        onBackPressed: () => Navigator.pop(context),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  36.verticalSpace,
                  Text(
                    'Bank Transfer',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: Colors.black,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  6.verticalSpace,
                  Text(
                    'To fund your wallet make a deposit into the account details below',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: Colors.black,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              40.verticalSpace,
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Use details to fund your wallet',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: PPaymobileColors.svgIconColor,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  12.verticalSpace,
                  // Account Number Card
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.w,
                      vertical: 16.h,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6).r,
                      border: Border.all(
                        width: 1.0.w,
                        color: PPaymobileColors.textfiedBorder,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 16.w,
                          width: 16.w,
                          child: SvgPicture.asset(
                            'assets/icon/bank_black.svg',
                            fit: BoxFit.contain,
                          ),
                        ),
                        4.verticalSpace,
                        Text(
                          'Account Number',
                          style: TextStyle(
                            fontFamily: 'InstrumentSans',
                            color: PPaymobileColors.lightGrey,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        8.verticalSpace,
                        isLoading
                            ? SkeletonLoader(
                                width: 200.w,
                                height: 40.h,
                                borderRadius: BorderRadius.circular(4.r),
                              )
                            : Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    wallet?.accountNumber ?? '—',
                                    style: TextStyle(
                                      fontFamily: 'InstrumentSans',
                                      color: Colors.black,
                                      fontSize: 32.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  30.horizontalSpace,
                                  GestureDetector(
                                    onTap: copyAccountNumber,
                                    child: SizedBox(
                                      height: 23.w,
                                      width: 23.w,
                                      child: SvgPicture.asset(
                                        'assets/icon/paste.svg',
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                      ],
                    ),
                  ),
                  11.verticalSpace,
                  // Account Holder
                  _InfoTile(
                    iconPath: 'assets/icon/account_holder.svg',
                    label: 'Account Holder',
                    value: isLoading ? null : (wallet?.accountName ?? '—'),
                  ),
                  7.verticalSpace,
                  // Bank
                  _InfoTile(
                    iconPath: 'assets/icon/bank_green.svg',
                    label: 'Bank',
                    value: isLoading ? null : (wallet?.bankName ?? '—'),
                  ),
                  92.verticalSpace,
                  PPButton(
                    text: 'Click to Copy',
                    onPressed: wallet != null ? copyAll : null,
                    icon: SvgPicture.asset(
                      'assets/icon/paste_white.svg',
                      height: 20.w,
                      width: 20.w,
                      fit: BoxFit.contain,
                    ),
                  ),
                  16.verticalSpace,
                  PPButton(
                    text: 'Share',
                    onPressed: wallet != null ? shareAll : null,
                    backgroundColor: PPaymobileColors.anotherbuttonbgColor,
                    icon: SvgPicture.asset(
                      'assets/icon/share.svg',
                      height: 20.w,
                      width: 20.w,
                      fit: BoxFit.contain,
                    ),
                  ),
                  20.verticalSpace,
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _InfoTile extends StatelessWidget {
  final String iconPath;
  final String label;
  final String? value;

  const _InfoTile({
    required this.iconPath,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(10).w,
      decoration: BoxDecoration(
        color: PPaymobileColors.mainScreenBackground,
        border: Border.all(
          width: 1.w,
          color: PPaymobileColors.textfiedBorder,
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: 7.r,
            spreadRadius: 0,
            offset: const Offset(0, 0),
            color: PPaymobileColors.textfiedBorder,
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 40.h,
            width: 44.h,
            child: SvgPicture.asset(
              iconPath,
              fit: BoxFit.contain,
            ),
          ),
          10.horizontalSpace,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: PPaymobileColors.lightGrey,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              4.verticalSpace,
              value == null
                  ? SkeletonLoader(
                      width: 120.w,
                      height: 16.h,
                      borderRadius: BorderRadius.circular(4.r),
                    )
                  : Text(
                      value!,
                      style: TextStyle(
                        fontFamily: 'InstrumentSans',
                        color: Colors.black,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
            ],
          ),
        ],
      ),
    );
  }
}
