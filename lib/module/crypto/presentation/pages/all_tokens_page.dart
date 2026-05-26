import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ppay_mobile/shared/models/select_crypto_model.dart';
import 'package:ppay_mobile/shared/widgets/crypto_asset_card.dart';

@RoutePage()
class AllTokensPage extends HookConsumerWidget {
  const AllTokensPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        48.verticalSpace,
        Expanded(
          child: ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            separatorBuilder: (_, _) => 24.verticalSpace,
            itemCount: selectCrypto.length,
            itemBuilder: (context, cryptoIndex) {
              final crypto = selectCrypto[cryptoIndex];

              return CryptoAssetCard(
                imagePath: crypto.containerImage,
                symbol: crypto.cryptoTitle,
                name: crypto.cryptosubTitle,
                price: crypto.cryptoPrice,
                amount: crypto.cryptoStatus,
                percentageChange: '0.09%',
                percentageIconPath: crypto.cryptoStatusIcon,
                percentageColor: crypto.cryptoStatusColor,
              );
            },
          ),
        ),
      ],
    );
  }
}
