import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mainstack/utils/app_colors.dart';

import 'texts.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget(
    this.title, {
    super.key,
    this.fontStyle = FontStyle.poppins,
    this.textColor = kBlack,
    this.isDarkMode = false,
  });

  final String title;
  final FontStyle fontStyle;
  final Color textColor;
  final bool isDarkMode;

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
        color: textColor,
        fontStyle: fontStyle,
      ),
    );
  }
}
