import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';

class CryptoAssetCard extends StatelessWidget {
  final String imagePath;
  final String symbol;
  final String name;
  final String price;
  final String amount;
  final String percentageChange;
  final String percentageIconPath;
  final Color percentageColor;

  const CryptoAssetCard({
    super.key,
    required this.imagePath,
    required this.symbol,
    required this.name,
    required this.price,
    required this.amount,
    required this.percentageChange,
    required this.percentageIconPath,
    required this.percentageColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 145.h,
      width: 122.6.w,
      padding: EdgeInsets.all(11).r,
      decoration: BoxDecoration(
        color: PPaymobileColors.deepBackgroundColor,
        borderRadius: BorderRadius.circular(7).r,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 34.w,
                width: 34.w,
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.contain,
                ),
              ),
              5.horizontalSpace,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    symbol,
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: Colors.black,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    name,
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: Colors.black,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
          24.verticalSpace,
          Text(
            price,
            style: TextStyle(
              fontFamily: 'InstrumentSans',
              color: Colors.black,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          1.verticalSpace,
          Text(
            amount,
            style: TextStyle(
              fontFamily: 'InstrumentSans',
              color: Colors.black,
              fontSize: 10.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          4.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 13.w,
                width: 13.w,
                child: SvgPicture.asset(
                  percentageIconPath,
                  fit: BoxFit.contain,
                ),
              ),
              3.horizontalSpace,
              Text(
                percentageChange,
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: percentageColor,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
