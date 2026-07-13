import 'package:flutter/material.dart';
import 'package:ppay_mobile/shared/widgets/pp_app_bar.dart';
import 'package:auto_route/auto_route.dart';
import 'package:ppay_mobile/app/router/app_router.gr.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/pp_button.dart';

@RoutePage()
class FundCardSuccessfulPage extends HookConsumerWidget {
  final double amountUsd;
  final double nairaAmount;
  final double rate;

  const FundCardSuccessfulPage({
    super.key,
    this.amountUsd = 0,
    this.nairaAmount = 0,
    this.rate = 0,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fundedAt = DateTime.now();

    return Scaffold(
      backgroundColor: PPaymobileColors.mainScreenBackground,
      appBar: const PPAppBar(showLeading: false),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              const Spacer(),
              SizedBox(height: 120.w, width: 120.w, child: Image.asset('assets/images/success1.png', fit: BoxFit.contain)),
              25.verticalSpace,
              Text('Transaction Successful', style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 20.sp, fontWeight: FontWeight.w600)),
              4.verticalSpace,
              Text(
                'Your USD card has been funded with \$${amountUsd.toStringAsFixed(2)}',
                textAlign: TextAlign.center,
                style: TextStyle(fontFamily: 'InstrumentSans', color: PPaymobileColors.svgIconColor, fontSize: 16.sp, fontWeight: FontWeight.w500),
              ),
              const Spacer(),
              PPButton(
                text: 'View Receipt',
                onPressed: () => context.router.push(
                  FundCardReceiptRoute(
                    amountUsd: amountUsd,
                    nairaAmount: nairaAmount,
                    rate: rate,
                    fundedAt: fundedAt,
                  ),
                ),
              ),
              14.verticalSpace,
              PPButton(
                text: 'View Card',
                onPressed: () => context.router.replace(CardRoute()),
                icon: SvgPicture.asset('assets/icon/arrow_forwardw.svg', height: 24.w, width: 24.w, fit: BoxFit.contain),
              ),
              20.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}
