import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/model/all_token_screen_model.dart';
import 'package:ppay_mobile/model/select_crypto_model.dart';
import 'package:ppay_mobile/screens/views/features_subscreen/token_detail_screen.dart';
import 'package:ppay_mobile/screens/widgets/touch_opacity.dart';

class AllTokensScreen extends StatefulWidget {
  const AllTokensScreen({super.key});

  @override
  State<AllTokensScreen> createState() => _AllTokensScreenState();
}

class _AllTokensScreenState extends State<AllTokensScreen> {
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
            itemCount: selectCrypto.length,
            itemBuilder: (context, cryptoIndex) {
              final crypto = selectCrypto[cryptoIndex];

              return TouchOpacity(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => TokenDetailScreen(token: bitcoinDetail),
                    ),
                  );
                },

                child: SizedBox(
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
                                crypto.cryptosubTitle,
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
                              color: Colors.black,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SizedBox(
                                height: 13.h,
                                width: 13.w,
                                child: SvgPicture.asset(
                                  crypto.cryptoStatusIcon,
                                  fit: BoxFit.contain,
                                ),
                              ),
                              3.horizontalSpace,
                              Text(
                                crypto.cryptoStatus,
                                style: TextStyle(
                                  fontFamily: 'InstrumentSans',
                                  color: crypto.cryptoStatusColor,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
