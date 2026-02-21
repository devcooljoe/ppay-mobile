import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CarouselItem extends StatefulWidget {
  final String backgroundImage;
  final String title;
  final String description;
  final Color textColor;
  final Color containerColor;
  final Color containerTextColor;
  final String containerSvg;

  const CarouselItem({
    super.key,
    required this.backgroundImage,
    required this.title,
    required this.description,
    required this.textColor,
    required this.containerColor,
    required this.containerTextColor,
    required this.containerSvg,
  });

  @override
  State<CarouselItem> createState() => _CarouselItemState();
}

class _CarouselItemState extends State<CarouselItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 6.0, right: 6.w),
      child: Container(
        height: 184.h,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(widget.backgroundImage)),
        ),
        child: Padding(
          padding: EdgeInsets.only(
            left: 25.0.w,
            top: 32.h,
            bottom: 32.h,
            right: 155.w,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: widget.textColor,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    widget.description,
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: widget.textColor,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              Container(
                height: 34.h,
                width: 121.w,
                padding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 5.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(55).r,
                  color: widget.containerColor,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Shop Now',
                      style: TextStyle(
                        fontFamily: 'InstrumentSans',
                        color: widget.containerTextColor,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    7.horizontalSpace,
                    SizedBox(
                      height: 19.w,
                      width: 19.w,
                      child: SvgPicture.asset(widget.containerSvg),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
