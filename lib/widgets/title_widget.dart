import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'texts.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget(this.title, {super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10.w),
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.3),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: MyText(
        title,
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
