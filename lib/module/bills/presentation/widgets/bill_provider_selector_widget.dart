import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ppay_mobile/module/bills/domain/entities/bill_entity.dart';
import 'package:ppay_mobile/shared/widgets/app_image.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/pp_app_bar.dart';
import 'package:ppay_mobile/shared/widgets/skeleton_loader.dart';
import 'package:ppay_mobile/shared/widgets/touch_opacity.dart';

class BillProviderSelectorWidget extends StatelessWidget {
  final List<BillerEntity> billers;
  final BillerEntity? selectedBiller;
  final String fallbackAsset;
  final ValueChanged<BillerEntity> onSelected;

  const BillProviderSelectorWidget({
    super.key,
    required this.billers,
    required this.onSelected,
    required this.fallbackAsset,
    this.selectedBiller,
  });

  static const int _maxVisible = 3;

  Future<void> _openAll(BuildContext context) async {
    final result = await Navigator.push<BillerEntity>(
      context,
      MaterialPageRoute(
        builder: (_) => _AllProvidersPage(
          billers: billers,
          selectedBiller: selectedBiller,
          fallbackAsset: fallbackAsset,
        ),
      ),
    );
    if (result != null) onSelected(result);
  }

  @override
  Widget build(BuildContext context) {
    // Selected provider always appears first in the horizontal list
    final orderedBillers = List<BillerEntity>.from(billers);
    if (selectedBiller != null) {
      final idx = orderedBillers.indexWhere((b) => b.id == selectedBiller!.id);
      if (idx > 0) {
        final item = orderedBillers.removeAt(idx);
        orderedBillers.insert(0, item);
      }
    }

    final visibleBillers = orderedBillers.length > _maxVisible
        ? orderedBillers.sublist(0, _maxVisible)
        : orderedBillers;
    final hasMore = billers.length > _maxVisible;

    return SizedBox(
      height: 106.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: visibleBillers.length + (hasMore ? 1 : 0),
        separatorBuilder: (_, __) => 16.horizontalSpace,
        itemBuilder: (_, i) {
          if (hasMore && i == visibleBillers.length) {
            return TouchOpacity(
              onTap: () => _openAll(context),
              child: Container(
                height: 104.h,
                width: 72.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.r),
                  color: PPaymobileColors.deepBackgroundColor,
                  border: Border.all(
                    color: PPaymobileColors.buttonColor,
                    width: 1.w,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'See',
                      style: TextStyle(
                        fontFamily: 'InstrumentSans',
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w600,
                        color: PPaymobileColors.buttonColor,
                      ),
                    ),
                    2.verticalSpace,
                    Text(
                      'more',
                      style: TextStyle(
                        fontFamily: 'InstrumentSans',
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w600,
                        color: PPaymobileColors.buttonColor,
                      ),
                    ),
                    4.verticalSpace,
                    Text(
                      '+${billers.length - _maxVisible}',
                      style: TextStyle(
                        fontFamily: 'InstrumentSans',
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w700,
                        color: PPaymobileColors.buttonColor,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }

          final biller = visibleBillers[i];
          final isSelected = selectedBiller?.id == biller.id;

          return TouchOpacity(
            onTap: () => onSelected(biller),
            child: _BillerCard(
              biller: biller,
              isSelected: isSelected,
              fallbackAsset: fallbackAsset,
            ),
          );
        },
      ),
    );
  }
}

class BillProviderSelectorSkeleton extends StatelessWidget {
  const BillProviderSelectorSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 106.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        separatorBuilder: (_, __) => 16.horizontalSpace,
        itemBuilder: (_, __) => SkeletonLoader(
          width: 108.w,
          height: 104.h,
          borderRadius: BorderRadius.circular(5.r),
        ),
      ),
    );
  }
}

class _BillerCard extends StatelessWidget {
  final BillerEntity biller;
  final bool isSelected;
  final String fallbackAsset;

  const _BillerCard({
    required this.biller,
    required this.isSelected,
    required this.fallbackAsset,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 104.h,
      width: 108.w,
      padding: EdgeInsets.symmetric(horizontal: 19.w, vertical: 10.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.r),
        color: isSelected
            ? PPaymobileColors.buttonColor.withValues(alpha: 0.12)
            : PPaymobileColors.deepBackgroundColor,
        border: isSelected
            ? Border.all(color: PPaymobileColors.buttonColor, width: 1.5.w)
            : null,
      ),
      child: Column(
        children: [
          Container(
            height: 56.w,
            width: 56.w,
            clipBehavior: Clip.hardEdge,
            decoration: const BoxDecoration(shape: BoxShape.circle),
            child: AppImage(
              imageUrl: biller.billerIconUrl,
              fit: BoxFit.cover,
              fallbackAsset: fallbackAsset,
            ),
          ),
          10.verticalSpace,
          Text(
            biller.name,
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontFamily: 'InstrumentSans',
              color: Colors.black,
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class _AllProvidersPage extends StatefulWidget {
  final List<BillerEntity> billers;
  final BillerEntity? selectedBiller;
  final String fallbackAsset;

  const _AllProvidersPage({
    required this.billers,
    required this.fallbackAsset,
    this.selectedBiller,
  });

  @override
  State<_AllProvidersPage> createState() => _AllProvidersPageState();
}

class _AllProvidersPageState extends State<_AllProvidersPage> {
  late BillerEntity? _selected;

  @override
  void initState() {
    super.initState();
    _selected = widget.selectedBiller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PPaymobileColors.mainScreenBackground,
      appBar: const PPAppBar(title: 'Select Provider'),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.all(20.w),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 12.w,
                  mainAxisSpacing: 12.h,
                  childAspectRatio: 0.9,
                ),
                itemCount: widget.billers.length,
                itemBuilder: (_, i) {
                  final biller = widget.billers[i];
                  final isSelected = _selected?.id == biller.id;
                  return TouchOpacity(
                    onTap: () {
                      setState(() => _selected = biller);
                    },
                    child: _BillerCard(
                      biller: biller,
                      isSelected: isSelected,
                      fallbackAsset: widget.fallbackAsset,
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
              child: SizedBox(
                width: double.infinity,
                height: 50.h,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _selected != null
                        ? PPaymobileColors.buttonColorandText
                        : PPaymobileColors.buttonInactiveColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(42.r),
                    ),
                    elevation: 0,
                  ),
                  onPressed:
                      _selected == null ? null : () => Navigator.pop(context, _selected),
                  child: Text(
                    _selected == null ? 'Select a Provider' : 'Confirm Selection',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      fontWeight: FontWeight.w500,
                      fontSize: 16.sp,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
