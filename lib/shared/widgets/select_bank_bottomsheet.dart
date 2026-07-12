import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ppay_mobile/module/settings/presentation/providers/settings_providers.dart';
import 'package:ppay_mobile/shared/widgets/app_image.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/skeleton_loader.dart';
import 'package:ppay_mobile/shared/widgets/touch_opacity.dart';

class SelectBankBottomsheet extends HookConsumerWidget {
  const SelectBankBottomsheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final banksAsync = ref.watch(getBanksProvider);
    final searchController = useTextEditingController();
    final searchQuery = useState('');

    useEffect(() {
      Future.microtask(() {
        ref.read(getBanksProvider.notifier).call();
      });
      return null;
    }, []);

    final allBanks = banksAsync.value ?? [];
    final filteredBanks = searchQuery.value.isEmpty
        ? allBanks
        : allBanks
            .where((b) => b.bankName
                .toLowerCase()
                .contains(searchQuery.value.toLowerCase()))
            .toList();

    return FractionallySizedBox(
      heightFactor: 0.80,
      child: Column(
        mainAxisSize: MainAxisSize.max,
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
                    'Select Bank',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  30.verticalSpace,
                  Container(
                    height: 54.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                    child: TextFormField(
                      controller: searchController,
                      onChanged: (v) => searchQuery.value = v,
                      decoration: InputDecoration(
                        prefixIcon: SizedBox(
                          height: 24.w,
                          width: 24.w,
                          child: SvgPicture.asset(
                            'assets/icon/bank_search.svg',
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                        hintText: 'Search',
                        hintStyle: TextStyle(
                          fontFamily: 'InstrumentSans',
                          color: PPaymobileColors.textfiedBorder,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),
                        filled: true,
                        fillColor: PPaymobileColors.deepBackgroundColor,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 12.w,
                          vertical: 14.h,
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(4.r),
                        ),
                      ),
                    ),
                  ),
                  10.verticalSpace,
                  Expanded(
                    child: banksAsync.isLoading
                        ? _BankListSkeleton()
                        : banksAsync.hasError
                            ? Center(
                                child: Text(
                                  'Failed to load banks. Please try again.',
                                  style: TextStyle(
                                    fontFamily: 'InstrumentSans',
                                    fontSize: 14.sp,
                                    color: PPaymobileColors.svgIconColor,
                                  ),
                                ),
                              )
                            : filteredBanks.isEmpty
                                ? Center(
                                    child: Text(
                                      'No banks found',
                                      style: TextStyle(
                                        fontFamily: 'InstrumentSans',
                                        fontSize: 14.sp,
                                        color: PPaymobileColors.svgIconColor,
                                      ),
                                    ),
                                  )
                                : ListView.separated(
                                    itemCount: filteredBanks.length,
                                    separatorBuilder: (_, __) =>
                                        24.verticalSpace,
                                    itemBuilder: (context, index) {
                                      final bank = filteredBanks[index];
                                      return TouchOpacity(
                                        onTap: () =>
                                            Navigator.pop(context, bank),
                                        child: Row(
                                          children: [
                                            Container(
                                              height: 36.w,
                                              width: 36.w,
                                              padding: EdgeInsets.all(6.r),
                                              decoration: BoxDecoration(
                                                color: PPaymobileColors
                                                    .anotherbuttonbgColor,
                                                borderRadius:
                                                    BorderRadius.circular(4.r),
                                              ),
                                              child: bank.bankLogo.isNotEmpty
                                                  ? AppImage(
                                                      imageUrl: bank.bankLogo,
                                                      width: 24.w,
                                                      height: 24.w,
                                                      fit: BoxFit.contain,
                                                    )
                                                  : SvgPicture.asset(
                                                      'assets/icon/bank_black.svg',
                                                      fit: BoxFit.contain,
                                                    ),
                                            ),
                                            16.horizontalSpace,
                                            Text(
                                              bank.bankName,
                                              style: TextStyle(
                                                fontFamily: 'InstrumentSans',
                                                fontSize: 16.sp,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
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

class _BankListSkeleton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 8,
      separatorBuilder: (_, __) => 24.verticalSpace,
      itemBuilder: (_, __) => Row(
        children: [
          SkeletonLoader(
            width: 36.w,
            height: 36.w,
            borderRadius: BorderRadius.circular(4.r),
          ),
          16.horizontalSpace,
          SkeletonLoader(
            width: 160.w,
            height: 16.h,
            borderRadius: BorderRadius.circular(4.r),
          ),
        ],
      ),
    );
  }
}
