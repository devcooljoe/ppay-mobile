import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:ppay_mobile/app/router/app_router.gr.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ppay_mobile/module/virtual_card/presentation/providers/virtual_card_providers.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/pp_button.dart';
import 'package:ppay_mobile/shared/widgets/pp_app_bar.dart';

@RoutePage()
class VirtualCardSuccessPage extends HookConsumerWidget {
  const VirtualCardSuccessPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: PPaymobileColors.mainScreenBackground,
      appBar: PPAppBar(title: 'Virtual Card'),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: ListView(
            children: [
              92.verticalSpace,
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 198.w, width: 198.w, child: Image.asset('assets/images/sucess.png', fit: BoxFit.contain)),
                  24.verticalSpace,
                  Text('Congrats!!', style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 20.sp, fontWeight: FontWeight.w500)),
                  2.verticalSpace,
                  Text(
                    'Your USD Card creation is in progress. It will be ready shortly.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 14.sp, fontWeight: FontWeight.w500),
                  ),
                  142.verticalSpace,
                  Text(
                    'Click the button below to check your card status',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 14.sp, fontWeight: FontWeight.w500),
                  ),
                  24.verticalSpace,
                  PPButton(
                    text: 'Go to My Cards',
                    onPressed: () {
                      ref.read(getDollarCardsProvider.notifier).call();
                      context.router.replace(MyCardsRoute());
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
