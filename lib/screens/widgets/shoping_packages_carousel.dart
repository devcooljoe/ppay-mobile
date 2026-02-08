import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShopingPackagesCarousel extends StatefulWidget {
  final String backgroundImage;

  const ShopingPackagesCarousel({super.key, required this.backgroundImage});

  @override
  State<ShopingPackagesCarousel> createState() =>
      _ShopingPackagesCarouselState();
}

class _ShopingPackagesCarouselState extends State<ShopingPackagesCarousel> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 30.w),
      child: Container(
        height: 162.h,
        width: 126.w,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(widget.backgroundImage)),
        ),
      ),
    );
  }
}
