import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ppay_mobile/module/bills/domain/entities/bill_entity.dart';
import 'package:ppay_mobile/module/bills/domain/entities/bill_item_grouper.dart';
import 'package:ppay_mobile/module/bills/domain/entities/bill_type.dart';
import 'package:ppay_mobile/shared/utils/amount_formatter.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/pp_app_bar.dart';
import 'package:ppay_mobile/shared/widgets/touch_opacity.dart';

class BillPackagesAllPage extends HookWidget {
  final List<BillItemEntity> items;
  final BillItemEntity? selectedItem;
  final String billerName;
  final BillType billType;

  const BillPackagesAllPage({
    super.key,
    required this.items,
    required this.billerName,
    required this.billType,
    this.selectedItem,
  });

  @override
  Widget build(BuildContext context) {
    final groups = useMemoized(
      () => BillItemGrouper.group(items, billType),
      [items, billType],
    );

    final selectedGroupIndex = useState(0);
    final selected = useState<BillItemEntity?>(selectedItem);

    // Default to the group that contains the already-selected item
    useEffect(() {
      if (selectedItem == null || groups.isEmpty) return null;
      for (var i = 0; i < groups.length; i++) {
        if (groups[i].items.any((item) => item.id == selectedItem!.id)) {
          selectedGroupIndex.value = i;
          break;
        }
      }
      return null;
    }, []);

    final currentItems = groups.isEmpty
        ? <BillItemEntity>[]
        : groups[selectedGroupIndex.value].items;

    return Scaffold(
      backgroundColor: PPaymobileColors.mainScreenBackground,
      appBar: PPAppBar(title: '$billerName Packages'),
      body: SafeArea(
        child: Column(
          children: [
            // Group filter chips — only shown when there are multiple groups
            if (groups.length > 1) ...[
              16.verticalSpace,
              SizedBox(
                height: 38.h,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  itemCount: groups.length,
                  separatorBuilder: (_, __) => 10.horizontalSpace,
                  itemBuilder: (_, i) {
                    final isActive = selectedGroupIndex.value == i;
                    return TouchOpacity(
                      onTap: () => selectedGroupIndex.value = i,
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 180),
                        padding: EdgeInsets.symmetric(
                            horizontal: 18.w, vertical: 8.h),
                        decoration: BoxDecoration(
                          color: isActive
                              ? PPaymobileColors.buttonColorandText
                              : PPaymobileColors.deepBackgroundColor,
                          borderRadius: BorderRadius.circular(24.r),
                          border: isActive
                              ? null
                              : Border.all(
                                  color: PPaymobileColors.textfiedBorder,
                                  width: 1.w),
                        ),
                        child: Text(
                          groups[i].label,
                          style: TextStyle(
                            fontFamily: 'InstrumentSans',
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w600,
                            color: isActive
                                ? Colors.white
                                : PPaymobileColors.darkGrey,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              12.verticalSpace,
            ] else
              16.verticalSpace,

            // Packages grid — content-sized rows
            Expanded(
              child: ListView.builder(
                padding:
                    EdgeInsets.symmetric(horizontal: 20.w, vertical: 4.h),
                itemCount: (currentItems.length / 2).ceil(),
                itemBuilder: (_, rowIndex) {
                  final leftIndex = rowIndex * 2;
                  final rightIndex = leftIndex + 1;
                  final leftItem = currentItems[leftIndex];
                  final rightItem = rightIndex < currentItems.length
                      ? currentItems[rightIndex]
                      : null;
                  return Padding(
                    padding: EdgeInsets.only(bottom: 12.h),
                    child: IntrinsicHeight(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            child: TouchOpacity(
                              onTap: () => selected.value = leftItem,
                              child: _PackageCard(
                                item: leftItem,
                                isSelected:
                                    selected.value?.id == leftItem.id,
                              ),
                            ),
                          ),
                          12.horizontalSpace,
                          Expanded(
                            child: rightItem != null
                                ? TouchOpacity(
                                    onTap: () => selected.value = rightItem,
                                    child: _PackageCard(
                                      item: rightItem,
                                      isSelected:
                                          selected.value?.id == rightItem.id,
                                    ),
                                  )
                                : const SizedBox.shrink(),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            // Confirm button
            Container(
              padding:
                  EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
              decoration: BoxDecoration(
                color: PPaymobileColors.mainScreenBackground,
                border: Border(
                  top: BorderSide(
                      color: PPaymobileColors.textfiedBorder, width: 1.w),
                ),
              ),
              child: SizedBox(
                width: double.infinity,
                height: 50.h,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: selected.value != null
                        ? PPaymobileColors.buttonColorandText
                        : PPaymobileColors.buttonInactiveColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(42.r),
                    ),
                    elevation: 0,
                  ),
                  onPressed: selected.value == null
                      ? null
                      : () => Navigator.pop(context, selected.value),
                  child: Text(
                    selected.value == null
                        ? 'Select a Package'
                        : 'Confirm — ₦${AmountFormatter.formatBalance(selected.value!.amount.toString())}',
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

class _PackageCard extends StatelessWidget {
  final BillItemEntity item;
  final bool isSelected;

  const _PackageCard({required this.item, required this.isSelected});

  String? _extractDuration(String name) {
    final patterns = [
      RegExp(r'(\d+)\s*(day|days|hour|hours)', caseSensitive: false),
      RegExp(r'(\d+)\s*(week|weeks)', caseSensitive: false),
      RegExp(r'(\d+)\s*(month|months)', caseSensitive: false),
    ];
    for (final p in patterns) {
      final match = p.firstMatch(name);
      if (match != null) return match.group(0);
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final duration = _extractDuration(item.name);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: isSelected
            ? PPaymobileColors.buttonColor.withValues(alpha: 0.08)
            : PPaymobileColors.deepBackgroundColor,
        border: isSelected
            ? Border.all(color: PPaymobileColors.buttonColor, width: 1.5.w)
            : Border.all(color: PPaymobileColors.textfiedBorder, width: 1.w),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
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
              padding:
                  EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
              decoration: BoxDecoration(
                color: isSelected
                    ? PPaymobileColors.buttonColor.withValues(alpha: 0.12)
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
    );
  }
}
