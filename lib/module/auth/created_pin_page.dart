import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:ppay_mobile/app/router/app_router.gr.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/module/onboarding/set_up_fingerprint.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/touch_opacity.dart';

@RoutePage()
class CreatedPinPage extends HookConsumerWidget {
  const CreatedPinPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
                            ),

                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Go To Dashboard',
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w600,
                                fontSize: 16.sp,
                                color: Colors.white,
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
                  ),
                ],
              ),
            ],
          ),
        ),
              ),
      ),
    );  }
