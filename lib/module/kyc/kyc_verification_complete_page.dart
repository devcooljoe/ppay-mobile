import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:ppay_mobile/app/router/app_router.gr.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ppay_mobile/module/dashboard/route_page.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/create_pin_bottomsheet.dart';
import 'package:ppay_mobile/shared/widgets/touch_opacity.dart';

@RoutePage()
class KycVerificationCompletePage extends HookConsumerWidget {
  const KycVerificationCompletePage({super.key;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
                          ;

                      },

                      child: Text(
                        'Set Up Biometric',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w600,
                          fontSize: 16.sp,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                20.verticalSpace,
                TouchOpacity(
                  child: SizedBox(
                    width: double.infinity,
                    height: 50.h,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: PPaymobileColors.mainScreenBackground,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(42),
                          side: BorderSide(
                            width: 1.w,
                            color: PPaymobileColors.textfiedBorder,
                          ),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RoutePage(),
                          ),
                          (route) => false,

                      },
                      child: Text(
                        'Go To Dashboard',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
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
          ),
        ],
              ),
      ),
    );  }
}
