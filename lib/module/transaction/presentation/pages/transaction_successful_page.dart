import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ppay_mobile/app/router/app_router.gr.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/module/dashboard/providers/wallet_provider.dart';
import 'package:ppay_mobile/module/settings/domain/entities/bank_account_entity.dart';
import 'package:ppay_mobile/module/transaction/presentation/providers/transaction_providers.dart';
import 'package:ppay_mobile/shared/widgets/app_loader.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/core/utils/message_handler.dart';
import 'package:ppay_mobile/shared/widgets/pp_button.dart';

@RoutePage()
class TransactionSuccessfulPage extends ConsumerWidget {
  final BankAccountEntity account;
  final double amount;

  const TransactionSuccessfulPage({
    super.key,
    required this.account,
    required this.amount,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final withdrawAsync = ref.watch(withdrawProvider);

    ref.listen(withdrawProvider, (_, next) {
      if (next.isLoading) {
        AppLoader.show(context);
      } else {
        AppLoader.hide(context);
        if (next.hasError) {
          MessageHandler.showErrorSnackBar(
            context,
            next.error?.toString() ?? 'Transfer failed. Please try again.',
          );
        } else if (next.hasValue) {
          ref.read(walletProvider.notifier).fetch();
        }
      }
    });

    final isFailed = withdrawAsync.hasError;

    Widget statusSection() {
      if (isFailed) {
        return Column(
          children: [
            SizedBox(
              height: 120.w,
              width: 120.w,
              child: Image.asset(
                'assets/images/big_fail.png',
                fit: BoxFit.contain,
              ),
            ),
            25.verticalSpace,
            Text(
              'Transfer Failed',
              style: TextStyle(
                fontFamily: 'InstrumentSans',
                color: Colors.black,
                fontSize: 24.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            4.verticalSpace,
            Text(
              'Your transaction was not successful. Please try again.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'InstrumentSans',
                color: PPaymobileColors.svgIconColor,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        );
      }

      return Column(
        children: [
          SizedBox(
            height: 120.w,
            width: 120.w,
            child: Image.asset(
              'assets/images/big_check.png',
              fit: BoxFit.contain,
            ),
          ),
          25.verticalSpace,
          Text(
            'Transaction Successful',
            style: TextStyle(
              fontFamily: 'InstrumentSans',
              color: Colors.black,
              fontSize: 24.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          4.verticalSpace,
          Text(
            '₦${amount.toStringAsFixed(2)} has been deducted from your wallet.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'InstrumentSans',
              color: PPaymobileColors.svgIconColor,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      );
    }

    Widget actionsSection() {
      if (isFailed) {
        return Column(
          children: [
            PPButton(
              text: 'Try Again',
              onPressed: () => context.router.popUntilRouteWithName(
                ConfirmTransactionRoute.name,
              ),
            ),
            22.verticalSpace,
            PPButton(
              text: 'Go Home',
              onPressed: () => context.router.pushAndPopUntil(
                const HomeRoute(),
                predicate: (route) => false,
              ),
              backgroundColor: PPaymobileColors.mainScreenBackground,
              icon: SvgPicture.asset(
                'assets/icon/arrow_forward.svg',
                height: 24.w,
                width: 24.w,
                fit: BoxFit.contain,
              ),
            ),
          ],
        );
      }

      return Column(
        children: [
          PPButton(
            text: 'Make Another Transfer',
            onPressed: () => context.router.pushAndPopUntil(
              const HomeRoute(),
              predicate: (route) => false,
            ),
          ),
          22.verticalSpace,
          PPButton(
            text: 'Go Home',
            onPressed: () => context.router.pushAndPopUntil(
              const HomeRoute(),
              predicate: (route) => false,
            ),
            backgroundColor: PPaymobileColors.mainScreenBackground,
            icon: SvgPicture.asset(
              'assets/icon/arrow_forward.svg',
              height: 24.w,
              width: 24.w,
              fit: BoxFit.contain,
            ),
          ),
        ],
      );
    }

    return Scaffold(
      backgroundColor: PPaymobileColors.mainScreenBackground,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0).w,
          child: ListView(
            children: [
              100.verticalSpace,
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  statusSection(),
                  161.verticalSpace,
                  actionsSection(),
                  10.verticalSpace,
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
