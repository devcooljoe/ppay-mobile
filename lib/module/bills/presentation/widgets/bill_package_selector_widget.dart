import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ppay_mobile/module/bills/domain/entities/bill_entity.dart';
import 'package:ppay_mobile/module/bills/domain/entities/bill_type.dart';
import 'package:ppay_mobile/module/bills/presentation/pages/bill_packages_all_page.dart';
import 'package:ppay_mobile/shared/utils/amount_formatter.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/touch_opacity.dart';

class BillPackageSelectorWidget extends StatelessWidget {
  final List<BillItemEntity> items;
  final BillItemEntity? selectedItem;
  final String billerName;
  final BillType billType;
  final ValueChanged<BillItemEntity> onSelected;

  const BillPackageSelectorWidget({
    super.key,
    required this.items,
    required this.billerName,
    required this.billType,
    required this.onSelected,
    this.selectedItem,
  });

  static const int _previewCount = 4;

  List<BillItemEntity> get _activeItems =>
      items.where((i) => i.isActive).toList();

  // Selected item floats to first so it's always visible in the preview
  List<BillItemEntity> get _displayItems {
    final all = _activeItems;
    if (selectedItem == null) return all;
    final idx = all.indexWhere((i) => i.id == selectedItem!.id);
    if (idx <= 0) return all;
    final reordered = List<BillItemEntity>.from(all);
    final item = reordered.removeAt(idx);
    reordered.insert(0, item);
    return reordered;
  }

  Future<void> _openAll(BuildContext context) async {
    final result = await Navigator.push<BillItemEntity>(
      context,
      MaterialPageRoute(
        builder: (_) => BillPackagesAllPage(
          items: _activeItems,
          billerName: billerName,
          billType: billType,
          selectedItem: selectedItem,
        ),
      ),
    );
    if (result != null) onSelected(result);
  }

  // Extract a duration tag from item name if present
  String? _durationTag(String name) {
    final patterns = [
      RegExp(r'(\d+\s*(day|days|hour|hours))', caseSensitive: false),
      RegExp(r'(\d+\s*(week|weeks))', caseSensitive: false),
      RegExp(r'(\d+\s*(month|months))', caseSensitive: false),
    ];
    for (final p in patterns) {
      final m = p.firstMatch(name);
      if (m != null) return m.group(0);
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final displayItems = _displayItems;
    final hasMore = displayItems.length > _previewCount;
    final previewItems = hasMore
        ? displayItems.sublist(0, _previewCount)
        : displayItems;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LayoutBuilder(
          builder: (context, constraints) {
            final itemWidth = (constraints.maxWidth - 12.w) / 2;
            return Wrap(
              spacing: 12.w,
              runSpacing: 12.h,
              children: previewItems.map((item) {
                final isSelected = selectedItem?.id == item.id;
                final duration = _durationTag(item.name);
                return TouchOpacity(
                  onTap: () => onSelected(item),
                  child: SizedBox(
                    width: itemWidth,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 12.w, vertical: 10.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: isSelected
                            ? PPaymobileColors.buttonColor
                                .withValues(alpha: 0.08)
                            : PPaymobileColors.deepBackgroundColor,
                        border: isSelected
                            ? Border.all(
                                color: PPaymobileColors.buttonColor,
                                width: 1.5.w)
                            : Border.all(
                                color: PPaymobileColors.textfiedBorder,
                                width: 1.w),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            item.name,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontFamily: 'InstrumentSans',
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                          6.verticalSpace,
                          Text(
                            '₦${AmountFormatter.formatBalance(item.amount.toString())}',
                            style: TextStyle(
                              fontFamily: 'InstrumentSans',
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w700,
                              color: isSelected
                                  ? PPaymobileColors.buttonColor
                                  : PPaymobileColors.backgroundColor,
                            ),
                          ),
                          if (duration != null) ...[
                            4.verticalSpace,
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 6.w, vertical: 2.h),
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? PPaymobileColors.buttonColor
                                        .withValues(alpha: 0.12)
                                    : PPaymobileColors.anotherbuttonbgColor,
                                borderRadius: BorderRadius.circular(4.r),
                              ),
                              child: Text(
                                duration,
                                style: TextStyle(
                                  fontFamily: 'InstrumentSans',
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w500,
                                  color: isSelected
                                      ? PPaymobileColors.buttonColor
                                      : PPaymobileColors.darkGrey,
                                ),
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ),
                );
              }).toList(),
            );
          },
        ),
        if (hasMore) ...[
          12.verticalSpace,
          TouchOpacity(
            onTap: () => _openAll(context),
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 14.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(
                    color: PPaymobileColors.buttonColor, width: 1.w),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'See all ${displayItems.length} packages',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: PPaymobileColors.buttonColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ],
    );
  }
}
