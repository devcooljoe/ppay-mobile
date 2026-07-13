import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ppay_mobile/app/router/app_router.gr.dart';
import 'package:ppay_mobile/core/utils/message_handler.dart';
import 'package:ppay_mobile/module/crypto/domain/entities/crypto_entity.dart';
import 'package:ppay_mobile/module/crypto/presentation/providers/crypto_providers.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';

@RoutePage()
class FetchWalletProgressPage extends HookConsumerWidget {
  final String currency;
  final String cryptoName;
  final String logoUrl;
  final bool isForSelling;
  final CryptoRateEntity rate;

  const FetchWalletProgressPage({
    super.key,
    required this.currency,
    required this.cryptoName,
    required this.logoUrl,
    required this.isForSelling,
    required this.rate,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(() {
      Future.microtask(() async {
        try {
          final wallet = await ref.read(walletAddressProvider(currency, null).future);
          if (!context.mounted) return;
          context.router.replace(CryptoTransactionRoute(
            rate: rate,
            wallet: wallet,
            isForSelling: isForSelling,
          ));
        } catch (e) {
          if (!context.mounted) return;
          MessageHandler.showErrorSnackBar(context, e.toString().replaceAll('Exception: ', ''));
          context.router.popForced();
        }
      });
      return null;
    }, []);

    return Scaffold(
      backgroundColor: PPaymobileColors.mainScreenBackground,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 48.w,
              height: 48.w,
              child: CircularProgressIndicator(
                color: PPaymobileColors.buttonColor,
                strokeWidth: 3,
              ),
            ),
            20.verticalSpace,
            Text(
              'Loading $cryptoName wallet...',
              style: TextStyle(
                fontFamily: 'InstrumentSans',
                color: PPaymobileColors.svgIconColor,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
