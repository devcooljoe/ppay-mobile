import 'package:flutter/material.dart';
import 'package:flutter/services.dart' hide MessageHandler;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ppay_mobile/core/utils/message_handler.dart';
import 'package:ppay_mobile/module/transaction/domain/entities/wallet_entity.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/touch_opacity.dart';
import 'package:share_plus/share_plus.dart';

class WalletDetailBottomsheet extends StatelessWidget {
  final WalletEntity wallet;

  const WalletDetailBottomsheet({super.key, required this.wallet});

  void _copyAccountNumber(BuildContext context) {
    Clipboard.setData(ClipboardData(text: wallet.accountNumber));
    MessageHandler.showSuccessSnackBar(
      context,
      'Account number copied successfully',
    );
  }

  void _copyAll(BuildContext context) {
    final text =
        'Bank: ${wallet.bankName}\nAccount Name: ${wallet.accountName}\nAccount Number: ${wallet.accountNumber}';
    Clipboard.setData(ClipboardData(text: text));
    MessageHandler.showSuccessSnackBar(
      context,
      'Account details copied successfully',
    );
  }

  void _shareAll(BuildContext context) {
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

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.52,
      child: Column(
        mainAxisSize: MainAxisSize.min,
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
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
              decoration: BoxDecoration(
                color: PPaymobileColors.mainScreenBackground,
                borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Wallet Details',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  24.verticalSpace,
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(16.r),
                    decoration: BoxDecoration(
                      color: PPaymobileColors.deepBackgroundColor,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _DetailRow(label: 'Bank Name', value: wallet.bankName),
                        Divider(
                          height: 24.h,
                          color: PPaymobileColors.textfiedBorder,
                        ),
                        _DetailRow(
                          label: 'Account Name',
                          value: wallet.accountName,
                        ),
                        Divider(
                          height: 24.h,
                          color: PPaymobileColors.textfiedBorder,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Account Number',
                                  style: TextStyle(
                                    fontFamily: 'InstrumentSans',
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400,
                                    color: PPaymobileColors.anotherGreyColor,
                                  ),
                                ),
                                4.verticalSpace,
                                TouchOpacity(
                                  onTap: () => _copyAccountNumber(context),
                                  child: Text(
                                    wallet.accountNumber,
                                    style: TextStyle(
                                      fontFamily: 'InstrumentSans',
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            TouchOpacity(
                              onTap: () => _copyAccountNumber(context),
                              child: Container(
                                height: 36.h,
                                width: 36.h,
                                decoration: BoxDecoration(
                                  color: PPaymobileColors.anotherbuttonbgColor,
                                  borderRadius: BorderRadius.circular(8.r),
                                ),
                                child: Center(
                                  child: SvgPicture.asset(
                                    'assets/icon/copy_black.svg',
                                    height: 18.h,
                                    width: 18.h,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  24.verticalSpace,
                  Row(
                    children: [
                      Expanded(
                        child: TouchOpacity(
                          onTap: () => _copyAll(context),
                          child: Container(
                            height: 50.h,
                            decoration: BoxDecoration(
                              color: PPaymobileColors.deepBackgroundColor,
                              borderRadius: BorderRadius.circular(10.r),
                              border: Border.all(
                                color: PPaymobileColors.textfiedBorder,
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  'assets/icon/copy_black.svg',
                                  height: 18.h,
                                  width: 18.h,
                                  fit: BoxFit.contain,
                                ),
                                8.horizontalSpace,
                                Text(
                                  'Copy Details',
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
                      ),
                      12.horizontalSpace,
                      Expanded(
                        child: TouchOpacity(
                          onTap: () => _shareAll(context),
                          child: Container(
                            height: 50.h,
                            decoration: BoxDecoration(
                              color: PPaymobileColors.backgroundColor,
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  'assets/icon/share_white.svg',
                                  height: 18.h,
                                  width: 18.h,
                                  fit: BoxFit.contain,
                                ),
                                8.horizontalSpace,
                                Text(
                                  'Share Details',
                                  style: TextStyle(
                                    fontFamily: 'InstrumentSans',
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                    color:
                                        PPaymobileColors.mainScreenBackground,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
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

class _DetailRow extends StatelessWidget {
  final String label;
  final String value;

  const _DetailRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontFamily: 'InstrumentSans',
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
            color: PPaymobileColors.anotherGreyColor,
          ),
        ),
        4.verticalSpace,
        Text(
          value,
          style: TextStyle(
            fontFamily: 'InstrumentSans',
            fontSize: 15.sp,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
