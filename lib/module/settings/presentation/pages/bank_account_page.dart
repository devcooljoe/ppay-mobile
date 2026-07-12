import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/app/router/app_router.gr.dart';
import 'package:ppay_mobile/core/utils/message_handler.dart';
import 'package:ppay_mobile/module/settings/domain/entities/bank_account_entity.dart';
import 'package:ppay_mobile/module/settings/presentation/providers/settings_providers.dart';
import 'package:ppay_mobile/shared/widgets/app_image.dart';
import 'package:ppay_mobile/shared/widgets/app_loader.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/empty_state.dart';
import 'package:ppay_mobile/shared/widgets/pp_app_bar.dart';
import 'package:ppay_mobile/shared/widgets/pp_button.dart';
import 'package:ppay_mobile/shared/widgets/skeleton_loader.dart';

@RoutePage()
class BankAccountPage extends HookConsumerWidget {
  const BankAccountPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final accountsState = ref.watch(getBankAccountsProvider);

    useEffect(() {
      Future.microtask(() => ref.read(getBankAccountsProvider.notifier).call());
      return null;
    }, []);

    ref.listen(deleteBankAccountProvider, (_, next) {
      if (next.isLoading) {
        AppLoader.show(context);
      } else {
        AppLoader.hide(context);
        if (next.hasError) {
          MessageHandler.showErrorSnackBar(context, next.error.toString());
        } else if (!next.isLoading) {
          ref.read(getBankAccountsProvider.notifier).call();
          MessageHandler.showSuccessSnackBar(context, 'Bank account removed');
        }
      }
    });

    return Scaffold(
      backgroundColor: PPaymobileColors.mainScreenBackground,
      appBar: PPAppBar(title: 'Bank'),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              32.verticalSpace,
              Text(
                'Bank Accounts',
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: Colors.black,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              8.verticalSpace,
              Text(
                'You can manage all your bank accounts',
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: PPaymobileColors.svgIconColor,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              51.verticalSpace,
              Expanded(
                child: accountsState.isLoading
                    ? _buildSkeleton()
                    : accountsState.hasError
                        ? Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Failed to load bank accounts',
                                  style: TextStyle(
                                    fontFamily: 'InstrumentSans',
                                    color: PPaymobileColors.svgIconColor,
                                    fontSize: 14.sp,
                                  ),
                                ),
                                16.verticalSpace,
                                TextButton(
                                  onPressed: () => ref.read(getBankAccountsProvider.notifier).call(),
                                  child: const Text('Retry'),
                                ),
                              ],
                            ),
                          )
                        : (accountsState.value?.isEmpty ?? true)
                            ? Column(
                                children: [
                                  EmptyState(
                                    imagePath: 'assets/images/transactionimage.png',
                                    message: 'No bank accounts added yet',
                                  ),
                                  24.verticalSpace,
                                  PPButton(
                                    text: 'Add Bank Account',
                                    onPressed: () => context.router.push(EditAccountRoute()),
                                  ),
                                ],
                              )
                            : Column(
                                children: [
                                  Expanded(
                                    child: ListView.separated(
                                      itemCount: accountsState.value!.length,
                                      separatorBuilder: (_, __) => Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                                        child: Divider(color: PPaymobileColors.textfiedBorder, height: 1),
                                      ),
                                      itemBuilder: (context, index) {
                                        final account = accountsState.value![index];
                                        return _BankAccountTile(
                                          account: account,
                                          onManage: () => context.router.push(
                                            EditAccountRoute(account: account),
                                          ),
                                          onDelete: () => _confirmDelete(context, ref, account),
                                        );
                                      },
                                    ),
                                  ),
                                  16.verticalSpace,
                                  PPButton(
                                    text: 'Add Bank Account',
                                    onPressed: () => context.router.push(EditAccountRoute()),
                                  ),
                                  16.verticalSpace,
                                ],
                              ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSkeleton() {
    return ListView.separated(
      itemCount: 4,
      separatorBuilder: (_, __) => Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Divider(color: PPaymobileColors.textfiedBorder, height: 1),
      ),
      itemBuilder: (_, __) => Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        child: Row(
          children: [
            SkeletonLoader(width: 53.w, height: 40.h, borderRadius: BorderRadius.circular(2.r)),
            16.horizontalSpace,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SkeletonLoader(width: 140.w, height: 14.h),
                  6.verticalSpace,
                  SkeletonLoader(width: 100.w, height: 12.h),
                ],
              ),
            ),
            SkeletonLoader(width: 97.w, height: 36.h, borderRadius: BorderRadius.circular(6.r)),
          ],
        ),
      ),
    );
  }

  void _confirmDelete(BuildContext context, WidgetRef ref, BankAccountEntity account) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => _DeleteConfirmSheet(
        accountName: account.accountName,
        onConfirm: () {
          Navigator.pop(context);
          ref.read(deleteBankAccountProvider.notifier).call(id: account.id);
        },
      ),
    );
  }
}

class _BankAccountTile extends StatelessWidget {
  final BankAccountEntity account;
  final VoidCallback onManage;
  final VoidCallback onDelete;

  const _BankAccountTile({
    required this.account,
    required this.onManage,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
      leading: Container(
        height: 40.h,
        width: 53.w,
        padding: EdgeInsets.all(10.r),
        decoration: BoxDecoration(
          color: const Color(0xFFF4F6F8),
          borderRadius: BorderRadius.circular(2.r),
        ),
        child: account.bankLogo.isNotEmpty
            ? AppImage(imageUrl: account.bankLogo, width: 28.w, height: 28.w, fit: BoxFit.contain)
            : SvgPicture.asset('assets/icon/bank_black.svg', fit: BoxFit.contain),
      ),
      title: Text(
        account.accountName,
        style: TextStyle(
          fontFamily: 'InstrumentSans',
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
      ),
      subtitle: Text(
        '${account.accountNumber}  •  ${account.bankName}',
        style: TextStyle(
          fontFamily: 'InstrumentSans',
          fontSize: 12.sp,
          fontWeight: FontWeight.w500,
          color: PPaymobileColors.svgIconColor,
        ),
      ),
      trailing: GestureDetector(
        onTap: onManage,
        child: Container(
          height: 36.h,
          width: 97.w,
          padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 6.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6.r),
            border: Border.all(color: PPaymobileColors.textfiedBorder, width: 1.w),
          ),
          child: Center(
            child: Text(
              'Manage',
              style: TextStyle(
                fontFamily: 'InstrumentSans',
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _DeleteConfirmSheet extends StatelessWidget {
  final String accountName;
  final VoidCallback onConfirm;

  const _DeleteConfirmSheet({required this.accountName, required this.onConfirm});

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.45,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              height: 60.w,
              width: 60.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.r),
                color: PPaymobileColors.mainScreenBackground,
              ),
              child: Center(
                child: SvgPicture.asset('assets/icon/cancel.svg', fit: BoxFit.scaleDown),
              ),
            ),
          ),
          10.verticalSpace,
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 20.w, top: 29.h, right: 20.w),
              width: double.infinity,
              decoration: BoxDecoration(
                color: PPaymobileColors.mainScreenBackground,
                borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Remove Bank Account?',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      fontWeight: FontWeight.w500,
                      fontSize: 20.sp,
                      color: Colors.black,
                    ),
                  ),
                  16.verticalSpace,
                  Text(
                    'Are you sure you want to remove $accountName? This action cannot be undone.',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      fontWeight: FontWeight.w500,
                      fontSize: 14.sp,
                      color: PPaymobileColors.svgIconColor,
                    ),
                  ),
                  40.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: Container(
                            height: 54.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(74.r),
                              color: PPaymobileColors.deepBackgroundColor,
                            ),
                            child: Center(
                              child: Text(
                                'Cancel',
                                style: TextStyle(
                                  fontFamily: 'InstrumentSans',
                                  color: Colors.black,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      12.horizontalSpace,
                      Expanded(
                        child: GestureDetector(
                          onTap: onConfirm,
                          child: Container(
                            height: 54.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(74.r),
                              color: PPaymobileColors.buttonColorandText,
                            ),
                            child: Center(
                              child: Text(
                                'Remove',
                                style: TextStyle(
                                  fontFamily: 'InstrumentSans',
                                  color: PPaymobileColors.mainScreenBackground,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
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
