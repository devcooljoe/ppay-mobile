import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ppay_mobile/module/transaction/domain/entities/transaction_entity.dart';
import 'package:ppay_mobile/module/transaction/presentation/widgets/transaction_filter.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/custom_date_picker.dart';

class FilterTransactionsBottomsheet extends HookConsumerWidget {
  final TransactionFilter initialFilter;

  const FilterTransactionsBottomsheet({
    super.key,
    this.initialFilter = const TransactionFilter(),
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedStatus = useState<TransactionStatus?>(initialFilter.status);
    final selectedType = useState<TransactionType?>(initialFilter.type);
    final dateFrom = useState<DateTime?>(initialFilter.dateFrom);
    final dateTo = useState<DateTime?>(initialFilter.dateTo);

    String formatDate(DateTime d) =>
        '${d.day.toString().padLeft(2, '0')}/${d.month.toString().padLeft(2, '0')}/${d.year}';

    Future<void> pickDate(ValueNotifier<DateTime?> target) async {
      final picked = await showModalBottomSheet<DateTime>(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (_) => const CustomDatePickerDialog(),
      );
      if (picked != null) target.value = picked;
    }

    return FractionallySizedBox(
      heightFactor: 0.92,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              height: 60.w,
              width: 60.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30).r,
                color: PPaymobileColors.mainScreenBackground,
              ),
              child: SvgPicture.asset(
                'assets/icon/cancel.svg',
                fit: BoxFit.scaleDown,
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
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(24)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Filter By',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  24.verticalSpace,

                  // ── Transaction Type ──────────────────────────────────
                  Text(
                    'Transaction Type',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: Colors.black,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  12.verticalSpace,
                  Wrap(
                    spacing: 8.w,
                    runSpacing: 8.h,
                    children: _typeOptions.map((entry) {
                      final isSelected = selectedType.value == entry.value;
                      return GestureDetector(
                        onTap: () => selectedType.value =
                            isSelected ? null : entry.value,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 14.w,
                            vertical: 8.h,
                          ),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? PPaymobileColors.buttonColor
                                : PPaymobileColors.deepBackgroundColor,
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                          child: Text(
                            entry.label,
                            style: TextStyle(
                              fontFamily: 'InstrumentSans',
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w500,
                              color: isSelected
                                  ? Colors.white
                                  : PPaymobileColors.svgIconColor,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  24.verticalSpace,

                  // ── Date Range ────────────────────────────────────────
                  Text(
                    'Transaction Date',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: Colors.black,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  12.verticalSpace,
                  Row(
                    children: [
                      Expanded(
                        child: _DateField(
                          label: 'From',
                          value:
                              dateFrom.value != null
                                  ? formatDate(dateFrom.value!)
                                  : null,
                          onTap: () => pickDate(dateFrom),
                        ),
                      ),
                      16.horizontalSpace,
                      Expanded(
                        child: _DateField(
                          label: 'To',
                          value:
                              dateTo.value != null
                                  ? formatDate(dateTo.value!)
                                  : null,
                          onTap: () => pickDate(dateTo),
                        ),
                      ),
                    ],
                  ),
                  24.verticalSpace,

                  // ── Transaction Status ────────────────────────────────
                  Text(
                    'Transaction Status',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: Colors.black,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  16.verticalSpace,
                  Wrap(
                    spacing: 28.w,
                    runSpacing: 16.h,
                    children: [
                      _StatusOption(
                        label: 'All',
                        selected: selectedStatus.value == null,
                        onTap: () => selectedStatus.value = null,
                      ),
                      _StatusOption(
                        label: 'Successful',
                        selected:
                            selectedStatus.value ==
                            TransactionStatus.successful,
                        onTap: () =>
                            selectedStatus.value = TransactionStatus.successful,
                      ),
                      _StatusOption(
                        label: 'Failed',
                        selected:
                            selectedStatus.value == TransactionStatus.failed,
                        onTap: () =>
                            selectedStatus.value = TransactionStatus.failed,
                      ),
                      _StatusOption(
                        label: 'Pending',
                        selected:
                            selectedStatus.value == TransactionStatus.pending,
                        onTap: () =>
                            selectedStatus.value = TransactionStatus.pending,
                      ),
                    ],
                  ),

                  const Spacer(),

                  // ── Buttons ───────────────────────────────────────────
                  Row(
                    children: [
                      Expanded(
                        child: _FilterButton(
                          label: 'Apply',
                          primary: true,
                          onPressed: () => Navigator.pop(
                            context,
                            TransactionFilter(
                              status: selectedStatus.value,
                              type: selectedType.value,
                              dateFrom: dateFrom.value,
                              dateTo: dateTo.value,
                            ),
                          ),
                        ),
                      ),
                      16.horizontalSpace,
                      Expanded(
                        child: _FilterButton(
                          label: 'Reset',
                          primary: false,
                          onPressed: () {
                            selectedStatus.value = null;
                            selectedType.value = null;
                            dateFrom.value = null;
                            dateTo.value = null;
                            Navigator.pop(
                              context,
                              const TransactionFilter(),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).padding.bottom + 20.h,
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

// ── Type option entries ────────────────────────────────────────────────────────

class _TypeEntry {
  final String label;
  final TransactionType value;
  const _TypeEntry(this.label, this.value);
}

const _typeOptions = [
  _TypeEntry('Wallet Funding', TransactionType.walletFunding),
  _TypeEntry('Withdrawal', TransactionType.walletWithdrawal),
  _TypeEntry('Bill Payment', TransactionType.billPayment),
  _TypeEntry('Crypto', TransactionType.cryptoPurchase),
  _TypeEntry('Gift Card', TransactionType.giftcardPurchase),
  _TypeEntry('Shopping', TransactionType.shopping),
  _TypeEntry('Flight', TransactionType.flightBooking),
];

// ── Reusable widgets ───────────────────────────────────────────────────────────

class _DateField extends StatelessWidget {
  final String label;
  final String? value;
  final VoidCallback onTap;

  const _DateField({
    required this.label,
    required this.value,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontFamily: 'InstrumentSans',
            color: PPaymobileColors.svgIconColor,
            fontSize: 13.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        6.verticalSpace,
        GestureDetector(
          onTap: onTap,
          child: Container(
            height: 48.h,
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            decoration: BoxDecoration(
              border: Border.all(
                color: PPaymobileColors.textfiedBorder,
                width: 1.w,
              ),
              borderRadius: BorderRadius.circular(6.r),
            ),
            child: Row(
              children: [
                SvgPicture.asset(
                  'assets/icon/calendar2.svg',
                  width: 18.w,
                  height: 18.w,
                  fit: BoxFit.contain,
                ),
                8.horizontalSpace,
                Expanded(
                  child: Text(
                    value ?? 'DD/MM/YYYY',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w400,
                      color: value != null
                          ? Colors.black
                          : PPaymobileColors.svgIconColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _StatusOption extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _StatusOption({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            selected ? 'assets/icon/picker.svg' : 'assets/icon/non_picker.svg',
            height: 24.w,
            width: 24.w,
            fit: BoxFit.contain,
          ),
          10.horizontalSpace,
          Text(
            label,
            style: TextStyle(
              fontFamily: 'InstrumentSans',
              color: selected ? PPaymobileColors.buttonColor : Colors.black,
              fontSize: 15.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class _FilterButton extends StatelessWidget {
  final String label;
  final bool primary;
  final VoidCallback onPressed;

  const _FilterButton({
    required this.label,
    required this.primary,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: primary
              ? PPaymobileColors.buttonColorandText
              : PPaymobileColors.deepBackgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(42),
          ),
          elevation: 0,
        ),
        onPressed: onPressed,
        child: Text(
          label,
          style: TextStyle(
            fontFamily: 'InstrumentSans',
            fontWeight: FontWeight.w600,
            fontSize: 16.sp,
            color: primary ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}
