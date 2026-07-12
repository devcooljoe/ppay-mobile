import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ppay_mobile/module/shopping/domain/entities/shopping_entity.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';

class ProductDetailBottomsheet extends HookConsumerWidget {
  final ProductEntity product;

  const ProductDetailBottomsheet({super.key, required this.product});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FractionallySizedBox(
      heightFactor: 0.850,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Transform.translate(
            offset: const Offset(0, 0),
            child: GestureDetector(
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
          ),
          10.verticalSpace,
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 20.w, top: 29.h, right: 20.w),
              width: double.infinity,
              decoration: BoxDecoration(
                color: PPaymobileColors.mainScreenBackground,
                borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
              ),
              child: ListView(
                children: [
                  Text(
                    'Product Description',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      fontWeight: FontWeight.w500,
                      fontSize: 24.sp,
                      color: Colors.black,
                    ),
                  ),
                  12.verticalSpace,
                  Text(
                    product.description,
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      fontWeight: FontWeight.w500,
                      fontSize: 16.sp,
                      color: Colors.black,
                    ),
                  ),
                  if (product.variants.isNotEmpty) ...[
                    40.verticalSpace,
                    Text(
                      'Specifications',
                      style: TextStyle(
                        fontFamily: 'InstrumentSans',
                        fontWeight: FontWeight.w600,
                        fontSize: 20.sp,
                        color: Colors.black,
                      ),
                    ),
                    12.verticalSpace,
                    ...product.variants.first.attributes.entries.map((entry) => Padding(
                      padding: EdgeInsets.only(bottom: 12.h),
                      child: Row(
                        children: [
                          SizedBox(
                            height: 11.w,
                            width: 11.w,
                            child: Image.asset('assets/images/rectangle.png', fit: BoxFit.contain),
                          ),
                          12.horizontalSpace,
                          Text(
                            '${entry.key}: ${entry.value}',
                            style: TextStyle(
                              fontFamily: 'InstrumentSans',
                              fontWeight: FontWeight.w500,
                              fontSize: 16.sp,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    )),
                  ],
                  40.verticalSpace,
                  Text(
                    'Stock',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      fontWeight: FontWeight.w600,
                      fontSize: 20.sp,
                      color: Colors.black,
                    ),
                  ),
                  12.verticalSpace,
                  Text(
                    product.inStock
                        ? '${product.stockQuantity} units available'
                        : 'Out of stock',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      fontWeight: FontWeight.w500,
                      fontSize: 16.sp,
                      color: product.inStock ? Colors.black : PPaymobileColors.redTextfield,
                    ),
                  ),
                  20.verticalSpace,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
