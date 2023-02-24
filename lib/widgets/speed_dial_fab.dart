import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:mainstack/utils/app_colors.dart';
import 'package:mainstack/utils/constants.dart';

import 'texts.dart';

class SpeedDialFab extends StatelessWidget {
  const SpeedDialFab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      backgroundColor: kPrimaryBlue,
      activeChild: Icon(
        Icons.close,
        size: 24.sp,
      ),
      overlayColor: Colors.black,
      overlayOpacity: 0.7.r,
      spaceBetweenChildren: 15.r,
      spacing: 20.r,
      buttonSize: Size(80.r, 80.r),
      childrenButtonSize: Size(50.r, 50.r),
      activeBackgroundColor: kPrimaryBlue,
      children: [
        SpeedDialChild(
            child: Icon(
              Icons.add,
              size: 24.sp,
            ),
            label: 'Add element',
            labelStyle:
                kStylePoppins.copyWith(fontSize: 16.sp, height: 21.86 / 16.r),
            labelBackgroundColor: kDisabledGray,
            backgroundColor: kDisabledGray,
            onTap: () {},
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.r),
            )),
        SpeedDialChild(
            child: Icon(
              Icons.dashboard_customize_outlined,
              size: 24.sp,
            ),
            label: 'Customize',
            labelStyle:
                kStylePoppins.copyWith(fontSize: 16.sp, height: 21.86 / 16.r),
            labelBackgroundColor: kDisabledGray,
            backgroundColor: kDisabledGray,
            onTap: () {},
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.r),
            )),
      ],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.abc,
            size: 24.sp,
          ),
          MyText('Post',
              fontWeight: FontWeight.w700,
              fontSize: 11.sp,
              height: 15.03 / 11.r),
        ],
      ),
    );
  }
}
