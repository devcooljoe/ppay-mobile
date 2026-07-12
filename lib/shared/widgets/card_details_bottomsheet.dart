import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ppay_mobile/module/virtual_card/domain/entities/dollar_card_entity.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';

class CardDetailsBottomsheet extends HookConsumerWidget {
  final DollarCardEntity card;

  const CardDetailsBottomsheet({super.key, required this.card});

  void _copy(BuildContext context, String value, String label) {
    Clipboard.setData(ClipboardData(text: value));
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$label copied'), duration: const Duration(seconds: 1)));
  }

  void _copyAll(BuildContext context) {
    final text = 'Name: ${card.name}\nCard Number: ${card.cardNumber}\nExpiry: ${card.expiry}\nCVV: ${card.cvv}\nBilling: ${card.address.street}, ${card.address.city}, ${card.address.state}, ${card.address.country}\nPostal: ${card.address.postalCode}';
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('All details copied'), duration: Duration(seconds: 1)));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Widget detailRow(String label, String value) {
      return Container(
        height: 66.h,
        width: double.infinity,
        padding: EdgeInsets.only(bottom: 16.h),
        decoration: BoxDecoration(border: Border(bottom: BorderSide(color: PPaymobileColors.textfiedBorder, width: 1.w))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(value, style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 16.sp, fontWeight: FontWeight.w500)),
                Text(label, style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 12.sp, fontWeight: FontWeight.w400)),
              ],
            ),
            GestureDetector(
              onTap: () => _copy(context, value, label),
              child: SizedBox(height: 24.w, width: 24.w, child: SvgPicture.asset('assets/icon/paste_black1.svg', fit: BoxFit.contain)),
            ),
          ],
        ),
      );
    }

    return FractionallySizedBox(
      heightFactor: 0.970,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              height: 60.w, width: 60.w,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(30).r, color: PPaymobileColors.mainScreenBackground),
              child: SizedBox(height: 18.h, width: 18.h, child: SvgPicture.asset('assets/icon/cancel.svg', fit: BoxFit.scaleDown)),
            ),
          ),
          8.verticalSpace,
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 20.w, top: 40.h, right: 20.w),
              width: double.infinity,
              decoration: BoxDecoration(color: PPaymobileColors.mainScreenBackground, borderRadius: const BorderRadius.vertical(top: Radius.circular(24))),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Copy Details', style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 20.sp, fontWeight: FontWeight.w600)),
                    37.verticalSpace,
                    Text('Address Information', style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 16.sp, fontWeight: FontWeight.w500)),
                    18.verticalSpace,
                    Text('Billing Address', style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 12.sp, fontWeight: FontWeight.w400)),
                    Row(
                      children: [
                        Expanded(
                          child: Text('${card.address.street}, ${card.address.city}, ${card.address.state}, ${card.address.country}', style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 16.sp, fontWeight: FontWeight.w500)),
                        ),
                        29.horizontalSpace,
                        GestureDetector(
                          onTap: () => _copy(context, '${card.address.street}, ${card.address.city}, ${card.address.state}, ${card.address.country}', 'Billing Address'),
                          child: SizedBox(height: 24.w, width: 24.w, child: SvgPicture.asset('assets/icon/paste_black1.svg', fit: BoxFit.contain)),
                        ),
                      ],
                    ),
                    37.verticalSpace,
                    Text('Postal Code', style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 12.sp, fontWeight: FontWeight.w400)),
                    Row(
                      children: [
                        Expanded(child: Text(card.address.postalCode, style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 16.sp, fontWeight: FontWeight.w500))),
                        29.horizontalSpace,
                        GestureDetector(
                          onTap: () => _copy(context, card.address.postalCode, 'Postal Code'),
                          child: SizedBox(height: 24.w, width: 24.w, child: SvgPicture.asset('assets/icon/paste_black1.svg', fit: BoxFit.contain)),
                        ),
                      ],
                    ),
                    49.verticalSpace,
                    Text('Please copy the information\'s below to use card', style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 16.sp, fontWeight: FontWeight.w500)),
                    36.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Card information', style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 16.sp, fontWeight: FontWeight.w500)),
                        GestureDetector(
                          onTap: () => _copyAll(context),
                          child: Container(
                            height: 30.h, width: 90.w,
                            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.h),
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(5.r), color: PPaymobileColors.deepBackgroundColor),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(height: 17.w, width: 17.w, child: SvgPicture.asset('assets/icon/paste_green.svg', fit: BoxFit.contain)),
                                8.horizontalSpace,
                                Text('Copy all', style: TextStyle(fontFamily: 'InstrumentSans', color: PPaymobileColors.greenTextColor, fontSize: 12.sp, fontWeight: FontWeight.w400)),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    38.verticalSpace,
                    detailRow('Account Holder', card.name),
                    12.verticalSpace,
                    detailRow('Card Number', card.cardNumber),
                    12.verticalSpace,
                    detailRow('Expiry Date', card.expiry),
                    12.verticalSpace,
                    detailRow('CVV', card.cvv),
                    20.verticalSpace,
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
