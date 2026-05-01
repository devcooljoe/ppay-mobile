import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemCarousel extends StatefulWidget {
  final String backgroundImage;

  const ItemCarousel({super.key, required this.backgroundImage});

  @override
  State<ItemCarousel> createState() => _ItemCarouselState();
}

class _ItemCarouselState extends State<ItemCarousel> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 6.0, right: 6.w),
      child: Container(
        height: 86.h,
        width: 69.w,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(widget.backgroundImage)),
        ),
      ),
    );
  }
}
