import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ppay_mobile/model/your_asset_model.dart';
import 'package:ppay_mobile/screens/widgets/colors.dart';

class YourAssetsScreen extends StatefulWidget {
  const YourAssetsScreen({super.key});

  @override
  State<YourAssetsScreen> createState() => _YourAssetsScreenState();
}

class _YourAssetsScreenState extends State<YourAssetsScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        48.verticalSpace,
        Expanded(
          child: ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            separatorBuilder: (_, _) => 24.verticalSpace,
            itemCount: yourAsset.length,
            itemBuilder: (context, cryptoIndex) {
              final crypto = yourAsset[cryptoIndex];

              return SizedBox(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 45.h,
                          width: 45.w,
                          decoration: BoxDecoration(shape: BoxShape.circle),
                          child: Image.asset(
                            crypto.containerImage,
                            fit: BoxFit.contain,
                          ),
                        ),
                        5.horizontalSpace,
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              crypto.cryptoTitle,
                              style: TextStyle(
                                fontFamily: 'InstrumentSans',
                                color: Colors.black,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              crypto.cryptoTitleshort,
                              style: TextStyle(
                                fontFamily: 'InstrumentSans',
                                color: Colors.black,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          crypto.cryptoPrice,
                          style: TextStyle(
                            fontFamily: 'InstrumentSans',
                            color: PPaymobileColors.svgIconColor,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          crypto.cryptosubTitle,
                          style: TextStyle(
                            fontFamily: 'InstrumentSans',
                            color: Colors.black,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
