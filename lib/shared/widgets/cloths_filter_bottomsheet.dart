import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/touch_opacity.dart';

class ClothsFilterBottomsheet extends HookConsumerWidget {
  final double? initialMinPrice;
  final double? initialMaxPrice;
  final String? initialVariantFilters;

  const ClothsFilterBottomsheet({
    super.key,
    this.initialMinPrice,
    this.initialMaxPrice,
    this.initialVariantFilters,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final minPriceController = useTextEditingController(
      text: initialMinPrice != null ? initialMinPrice!.toStringAsFixed(0) : '',
    );
    final maxPriceController = useTextEditingController(
      text: initialMaxPrice != null ? initialMaxPrice!.toStringAsFixed(0) : '',
    );
    final variantKeyController = useTextEditingController();
    final variantValueController = useTextEditingController();

    void onApply() {
      final minPrice = double.tryParse(minPriceController.text.trim());
      final maxPrice = double.tryParse(maxPriceController.text.trim());
      final key = variantKeyController.text.trim();
      final value = variantValueController.text.trim();
      String? variantFilters;
      if (key.isNotEmpty && value.isNotEmpty) {
        variantFilters = '$key:$value';
      }
      Navigator.pop(context, {
        'minPrice': minPrice,
        'maxPrice': maxPrice,
        'variantFilters': variantFilters,
      });
    }

    void onReset() {
      minPriceController.clear();
      maxPriceController.clear();
      variantKeyController.clear();
      variantValueController.clear();
      Navigator.pop(context, {
        'minPrice': null,
        'maxPrice': null,
        'variantFilters': null,
      });
    }

    return FractionallySizedBox(
      heightFactor: 0.75,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          TouchOpacity(
            onTap: () => Navigator.pop(context),
            child: Container(
              height: 60.w,
              width: 60.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30).r,
                color: PPaymobileColors.mainScreenBackground,
              ),
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
          10.verticalSpace,
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 20.w, top: 29.h, right: 20.w),
              width: double.infinity,
              decoration: BoxDecoration(
                color: PPaymobileColors.mainScreenBackground,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(24),
                ),
              ),
              child: ListView(
                children: [
                  Text(
                    'Filter',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  34.verticalSpace,
                  Text(
                    'Price Range',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: Colors.black,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  16.verticalSpace,
                  Row(
                    children: [
                      Expanded(
                        child: _FilterField(
                          controller: minPriceController,
                          hint: 'Min price',
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      16.horizontalSpace,
                      Expanded(
                        child: _FilterField(
                          controller: maxPriceController,
                          hint: 'Max price',
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ],
                  ),
                  32.verticalSpace,
                  Text(
                    'Variant Attribute',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: Colors.black,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  8.verticalSpace,
                  Text(
                    'e.g. Key: size, Value: XL',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: PPaymobileColors.svgIconColor,
                      fontSize: 12.sp,
                    ),
                  ),
                  16.verticalSpace,
                  Row(
                    children: [
                      Expanded(
                        child: _FilterField(
                          controller: variantKeyController,
                          hint: 'Attribute (e.g. size)',
                        ),
                      ),
                      16.horizontalSpace,
                      Expanded(
                        child: _FilterField(
                          controller: variantValueController,
                          hint: 'Value (e.g. XL)',
                        ),
                      ),
                    ],
                  ),
                  48.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 185.w,
                        height: 47.h,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: PPaymobileColors.buttonColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7).r,
                            ),
                            elevation: 0,
                          ),
                          onPressed: onApply,
                          child: Text(
                            'Apply',
                            style: TextStyle(
                              fontFamily: 'InstrumentSans',
                              fontWeight: FontWeight.w600,
                              fontSize: 16.sp,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 185.w,
                        height: 47.h,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: PPaymobileColors.textfiedBorder,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7.r),
                            ),
                            elevation: 0,
                          ),
                          onPressed: onReset,
                          child: Text(
                            'Reset',
                            style: TextStyle(
                              fontFamily: 'InstrumentSans',
                              fontWeight: FontWeight.w600,
                              fontSize: 16.sp,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  24.verticalSpace,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _FilterField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final TextInputType? keyboardType;

  const _FilterField({
    required this.controller,
    required this.hint,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(
            fontFamily: 'InstrumentSans',
            color: PPaymobileColors.textfiedBorder,
            fontSize: 14.sp,
          ),
          filled: true,
          fillColor: PPaymobileColors.deepBackgroundColor,
          contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 14.h),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(8).r,
          ),
        ),
      ),
    );
  }
}
