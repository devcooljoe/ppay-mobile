import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:ppay_mobile/app/router/app_router.gr.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/shared/models/bank_accounts_model.dart';
import 'package:ppay_mobile/module/settings/edit_account.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/touch_opacity.dart';

@RoutePage()
class BankAccountsPage extends HookConsumerWidget {
  const BankAccountsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {  •  ${bank.bankName}',
                        style: TextStyle(
                          fontFamily: 'InstrumentSans',
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: PPaymobileColors.svgIconColor,
                        ),
                      ),

                      // Manage button
                      trailing: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EditAccount(),
                            ),

                        },
                        child: Container(
                          height: 36.h,
                          width: 97.w,
                          padding: EdgeInsets.symmetric(
                            horizontal: 7.w,
                            vertical: 6.h,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6.r),
                            border: Border.all(
                              color: PPaymobileColors.textfiedBorder,
                              width: 1.w,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'Manage',
                              style: TextStyle(
                                fontFamily: 'InstrumentSans',
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),

                  },
                ),
              ),
            ],
          ),
        ),
              ),
      ),
    );  }
