import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:ppay_mobile/app/router/app_router.gr.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/module/virtual_card/fund_card_receipt_page.dart';
import 'package:ppay_mobile/module/virtual_card/virtual_card_page.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/touch_opacity.dart';

@RoutePage()
class FundCardSuccessfulPage extends HookConsumerWidget {
  const FundCardSuccessfulPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
                          ),

                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'View Card',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w600,
                              fontSize: 16.sp,
                              color: PPaymobileColors.mainScreenBackground,
                            ),
                          ),
                          7.horizontalSpace,
                          SizedBox(
                            height: 24.w,
                            width: 24.w,
                            child: SvgPicture.asset(
                              'assets/icon/arrow_forwardw.svg',
                              fit: BoxFit.contain,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  18.verticalSpace,
                  TouchOpacity(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const FundCardReceiptPage();
                          },
                        ),

                    },
                    child: Container(
                      width: double.infinity,
                      height: 50.h,
                      padding: EdgeInsets.symmetric(
                        horizontal: 21.w,
                        vertical: 12.h,
                      ),
                      decoration: BoxDecoration(
                        color: PPaymobileColors.mainScreenBackground,
                        borderRadius: BorderRadius.circular(42.r),
                      ),
                      child: Center(
                        child: Text(
                          'View Receipt',
                          style: TextStyle(
                            fontFamily: 'InstrumentSans',
                            fontWeight: FontWeight.w600,
                            fontSize: 16.sp,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
              ),
      ),
    );  }
