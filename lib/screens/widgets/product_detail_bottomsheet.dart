import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/screens/widgets/colors.dart';

class ProductDetailBottomsheet extends StatefulWidget {
  const ProductDetailBottomsheet({super.key});

  @override
  State<ProductDetailBottomsheet> createState() =>
      _ProductDetailBottomsheetState();
}

class _ProductDetailBottomsheetState extends State<ProductDetailBottomsheet> {
  @override
  Widget build(BuildContext context) {
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Product description',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      fontWeight: FontWeight.w500,
                      fontSize: 24.sp,
                      color: Colors.black,
                    ),
                  ),
                  12.verticalSpace,
                  Text(
                    'A must-have wardrobe essential, this Black Plain T-Shirt offers a perfect blend of comfort, durability, and style. Made from soft, breathable cotton, it’s ideal for everyday wear, layering, or casual outings. Designed for a relaxed yet modern fit, it pairs effortlessly with jeans, joggers, or shorts.',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      fontWeight: FontWeight.w500,
                      fontSize: 16.sp,
                      color: Colors.black,
                    ),
                  ),
                  40.verticalSpace,
                  Text(
                    'Warranty',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      fontWeight: FontWeight.w600,
                      fontSize: 20.sp,
                      color: Colors.black,
                    ),
                  ),
                  16.verticalSpace,
                  Text(
                    'Up to 2 years product warranty coverage',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      fontWeight: FontWeight.w500,
                      fontSize: 16.sp,
                      color: Colors.black,
                    ),
                  ),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 11.w,
                        width: 11.w,
                        child: Image.asset(
                          'assets/images/rectangle.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                      12.horizontalSpace,
                      Text(
                        'Material: 100% Cotton (soft & breathable)',
                        style: TextStyle(
                          fontFamily: 'InstrumentSans',
                          fontWeight: FontWeight.w500,
                          fontSize: 16.sp,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  16.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 11.w,
                        width: 11.w,
                        child: Image.asset(
                          'assets/images/rectangle.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                      12.horizontalSpace,
                      Text(
                        'Color: Black',
                        style: TextStyle(
                          fontFamily: 'InstrumentSans',
                          fontWeight: FontWeight.w500,
                          fontSize: 16.sp,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  16.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 11.w,
                        width: 11.w,
                        child: Image.asset(
                          'assets/images/rectangle.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                      12.horizontalSpace,
                      Text(
                        'Fit: Regular / Slim Fit (Select your preference)',
                        style: TextStyle(
                          fontFamily: 'InstrumentSans',
                          fontWeight: FontWeight.w500,
                          fontSize: 16.sp,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  16.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 11.w,
                        width: 11.w,
                        child: Image.asset(
                          'assets/images/rectangle.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                      12.horizontalSpace,
                      Text(
                        'Sleeves: Short Sleeves',
                        style: TextStyle(
                          fontFamily: 'InstrumentSans',
                          fontWeight: FontWeight.w500,
                          fontSize: 16.sp,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  16.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 11.w,
                        width: 11.w,
                        child: Image.asset(
                          'assets/images/rectangle.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                      12.horizontalSpace,
                      Text(
                        'Sizes: S, M, L, XL, XXL',
                        style: TextStyle(
                          fontFamily: 'InstrumentSans',
                          fontWeight: FontWeight.w500,
                          fontSize: 16.sp,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  16.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 11.w,
                        width: 11.w,
                        child: Image.asset(
                          'assets/images/rectangle.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                      12.horizontalSpace,
                      Expanded(
                        child: Text(
                          "Care Instructions: Machine wash cold, tumble dry low",
                          style: TextStyle(
                            fontFamily: 'InstrumentSans',
                            fontWeight: FontWeight.w500,
                            fontSize: 16.sp,
                            color: Colors.black,
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
