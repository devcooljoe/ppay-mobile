import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/model/bank_model.dart';
import 'package:ppay_mobile/screens/widgets/colors.dart';

class SelectBankBottomsheet extends StatefulWidget {
  const SelectBankBottomsheet({super.key});

  @override
  State<SelectBankBottomsheet> createState() => _SelectBankBottomsheetState();
}

class _SelectBankBottomsheetState extends State<SelectBankBottomsheet> {
  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.600,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Transform.translate(
            offset: const Offset(0, 0),
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                height: 60.h,
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
              padding: EdgeInsets.only(left: 20.w, top: 40.h, right: 20.w),
              width: double.infinity,
              decoration: BoxDecoration(
                color: PPaymobileColors.mainScreenBackground,
                borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Add Account',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  30.verticalSpace,
                  Container(
                    height: 54.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4).r,
                    ),
                    child: TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: SizedBox(
                          height: 24.h,
                          width: 24.w,
                          child: SvgPicture.asset(
                            'assets/icon/bank_search.svg',
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                        hintText: 'Search',
                        hintStyle: TextStyle(
                          fontFamily: 'InstrumentSans',
                          color: PPaymobileColors.textfiedBorder,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),
                        filled: true,
                        fillColor: PPaymobileColors.deepBackgroundColor,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 12.w,
                          vertical: 14.h,
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(4).r,
                        ),
                      ),
                    ),
                  ),
                  30.verticalSpace,
                  SizedBox(
                    height: 235.h,
                    width: double.infinity,
                    child: ListView.separated(
                      itemCount: banksModel.length,
                      separatorBuilder: (context, index) =>
                          Column(children: [24.verticalSpace]),
                      itemBuilder: (context, index) {
                        return ListTile(
                          contentPadding: EdgeInsets.zero,
                          horizontalTitleGap: 12.w,
                          minLeadingWidth: 0,

                          leading: SizedBox(
                            height: 28.h,
                            width: 28.w,
                            child: Image.asset(
                              banksModel[index].bankImage,
                              fit: BoxFit.contain,
                            ),
                          ),

                          title: Text(
                            banksModel[index].bankName,
                            style: TextStyle(
                              fontFamily: 'InstrumentSans',
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),

                          onTap: () {
                            Navigator.pop(context, banksModel[index]);
                          },
                        );
                      },
                    ),
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
