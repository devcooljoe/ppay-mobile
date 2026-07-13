import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ppay_mobile/shared/widgets/pp_app_bar.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ppay_mobile/app/router/app_router.gr.dart';
import 'package:ppay_mobile/module/bills/domain/entities/bill_entity.dart';
import 'package:ppay_mobile/module/bills/domain/entities/bill_type.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/pp_button.dart';

@RoutePage()
class BillSuccessPage extends HookConsumerWidget {
  final BillType billType;
  final String amount;
  final BillerEntity biller;
  final BillConfirmArgs args;
  final String reference;
  final double fee;
  final DateTime purchasedAt;

  const BillSuccessPage({
    super.key,
    required this.billType,
    required this.amount,
    required this.biller,
    required this.args,
    required this.reference,
    required this.fee,
    required this.purchasedAt,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final animController = useAnimationController(
      duration: const Duration(milliseconds: 600),
    );

    final scaleAnim = useMemoized(
      () => CurvedAnimation(parent: animController, curve: Curves.elasticOut),
      [animController],
    );

    final fadeAnim = useMemoized(
      () => Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(parent: animController, curve: Curves.easeIn),
      ),
      [animController],
    );

    useEffect(() {
      animController.forward();
      return null;
    }, []);

    return Scaffold(
      backgroundColor: PPaymobileColors.mainScreenBackground,
      appBar: const PPAppBar(showLeading: false),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ScaleTransition(
                      scale: scaleAnim,
                      child: FadeTransition(
                        opacity: fadeAnim,
                        child: SizedBox(
                          height: 120.w,
                          width: 120.w,
                          child: Image.asset(
                            'assets/images/big_check.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                    24.verticalSpace,
                    FadeTransition(
                      opacity: fadeAnim,
                      child: Column(
                        children: [
                          Text(
                            'Payment Successful',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'InstrumentSans',
                              fontSize: 22.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                          12.verticalSpace,
                          Text(
                            '${billType.label} payment of ₦$amount to ${biller.name} was successful',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'InstrumentSans',
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w400,
                              color: PPaymobileColors.svgIconColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              FadeTransition(
                opacity: fadeAnim,
                child: Column(
                  children: [
                    Text(
                      '₦$amount has been deducted from your wallet',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'InstrumentSans',
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400,
                        color: PPaymobileColors.anotherGreyColor,
                      ),
                    ),
                    16.verticalSpace,
                    PPButton(
                      text: 'View Receipt',
                      backgroundColor: PPaymobileColors.buttonColorandText,
                      onPressed: () => context.router.push(BillReceiptRoute(
                        args: args,
                        reference: reference,
                        fee: fee,
                        purchasedAt: purchasedAt,
                      )),
                    ),
                    12.verticalSpace,
                    PPButton(
                      text: 'Back to Home',
                      backgroundColor: PPaymobileColors.mainScreenBackground,
                      onPressed: () {
                        context.router.replaceAll([HomeRoute()]);
                      },
                    ),
                    20.verticalSpace,
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
