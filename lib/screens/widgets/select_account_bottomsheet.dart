import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectAccountBottomsheet extends StatelessWidget {
  const SelectAccountBottomsheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(24.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 5.h,
            width: 60.w,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          24.verticalSpace,
          Text("Select Bank", style: TextStyle(fontSize: 16.sp)),
          24.verticalSpace,

          ListTile(
            leading: CircleAvatar(child: Icon(Icons.account_balance)),
            title: const Text("Access Bank"),
            onTap: () => Navigator.pop(context),
          ),

          ListTile(
            leading: CircleAvatar(child: Icon(Icons.account_balance)),
            title: const Text("GTBank"),
            onTap: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}
