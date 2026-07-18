import 'package:ppay_mobile/core/utils/message_handler.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ppay_mobile/app/router/app_router.gr.dart';
import 'package:ppay_mobile/module/dashboard/providers/wallet_provider.dart';
import 'package:ppay_mobile/module/virtual_card/presentation/providers/virtual_card_providers.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/touch_opacity.dart';

class PurchaseDollarcardBottomsheet extends HookConsumerWidget {
  const PurchaseDollarcardBottomsheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final walletState = ref.watch(walletProvider);
    final createState = ref.watch(createDollarCardProvider);
    final wallet = walletState.value;
    final walletBalance = double.tryParse(wallet?.balance ?? '0') ?? 0.0;

    ref.listen(createDollarCardProvider, (_, next) {
      if (next is AsyncData && next.value == null) {
        Navigator.pop(context);
        context.router.push(VirtualCardSuccessRoute());
      } else if (next is AsyncError) {
        MessageHandler.showErrorSnackBar(context, MessageHandler.getErrorMessage(next.error));
      }
    });

    String formatNaira(double value) {
      final parts = value.toStringAsFixed(2).split('.');
      final intPart = parts[0].replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (m) => '${m[1]},');
      return '₦$intPart.${parts[1]}';
    }

    return FractionallySizedBox(
      heightFactor: 0.454,
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
          10.verticalSpace,
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 20.w, top: 29.h, right: 20.w),
              width: double.infinity,
              decoration: BoxDecoration(color: PPaymobileColors.mainScreenBackground, borderRadius: const BorderRadius.vertical(top: Radius.circular(24))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Purchase Dollar Card', style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 20.sp, fontWeight: FontWeight.w500)),
                  2.verticalSpace,
                  Text('Click below to pay with available wallet balance', style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 14.sp, fontWeight: FontWeight.w500)),
                  37.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 59.w, width: 59.w,
                            decoration: BoxDecoration(shape: BoxShape.circle, image: const DecorationImage(image: AssetImage('assets/images/nigeria.png'), fit: BoxFit.contain)),
                          ),
                          16.horizontalSpace,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Wallet balance', style: TextStyle(fontFamily: 'InstrumentSans', fontWeight: FontWeight.w500, fontSize: 12.sp, color: Colors.black)),
                              Text(wallet != null ? formatNaira(walletBalance) : '...', style: TextStyle(fontFamily: 'InstrumentSans', fontWeight: FontWeight.w500, fontSize: 16.sp, color: Colors.black)),
                            ],
                          ),
                        ],
                      ),
                      TouchOpacity(
                        onTap: createState is AsyncLoading
                            ? null
                            : () {
                                // Card creation was already triggered from CreateVirtualCardPage
                                // This button just confirms and navigates
                                Navigator.pop(context);
                                context.router.push(VirtualCardSuccessRoute());
                              },
                        child: Container(
                          height: 44.h, width: 86.w,
                          decoration: BoxDecoration(
                            color: createState is AsyncLoading ? PPaymobileColors.deepBackgroundColor : PPaymobileColors.backgroundColor,
                            borderRadius: BorderRadius.circular(6).r,
                          ),
                          child: Center(
                            child: createState is AsyncLoading
                                ? const SizedBox(height: 20, width: 20, child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white))
                                : Text('Pay', style: TextStyle(fontFamily: 'InstrumentSans', fontWeight: FontWeight.w500, fontSize: 14.sp, color: PPaymobileColors.mainScreenBackground)),
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
