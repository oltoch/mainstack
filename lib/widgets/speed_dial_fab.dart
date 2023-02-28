import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';
import 'package:mainstack/controllers/theme_controller.dart';
import 'package:mainstack/utils/app_colors.dart';
import 'package:mainstack/utils/constants.dart';

import 'texts.dart';

class SpeedDialFab extends StatelessWidget {
  SpeedDialFab({super.key, required this.addElement, required this.customize});

  final VoidCallback customize;
  final VoidCallback addElement;
  final theme = Get.find<ThemeController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return SpeedDial(
        backgroundColor: theme.isDarkMode ? kWhite : kBlack,
        activeChild: Icon(
          Icons.close,
          size: 24.sp,
          color: theme.isDarkMode ? kBlack : kWhite,
        ),
        overlayColor: kTextGray,
        overlayOpacity: 0.7.r,
        spaceBetweenChildren: 15.r,
        spacing: 20.r,
        buttonSize: Size(80.r, 80.r),
        childrenButtonSize: Size(50.r, 50.r),
        activeBackgroundColor: theme.isDarkMode
            ? kWhite.withOpacity(0.9)
            : kBlack.withOpacity(0.9),
        children: [
          SpeedDialChild(
              child: Icon(
                Icons.add,
                size: 24.sp,
                color: theme.isDarkMode ? kBlack : kWhite,
              ),
              label: 'Add element',
              labelStyle: kStylePoppins.copyWith(
                fontSize: 16.sp,
                height: 21.86 / 16.r,
                color: theme.isDarkMode ? kBlack : kWhite,
              ),
              labelBackgroundColor: theme.isDarkMode
                  ? kWhite.withOpacity(0.5)
                  : kBlack.withOpacity(0.5),
              backgroundColor: theme.isDarkMode
                  ? kWhite.withOpacity(0.5)
                  : kBlack.withOpacity(0.5),
              onTap: addElement,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.r),
              )),
          SpeedDialChild(
              child: Icon(
                Icons.dashboard_customize_outlined,
                size: 24.sp,
                color: theme.isDarkMode ? kBlack : kWhite,
              ),
              label: 'Customize',
              labelStyle: kStylePoppins.copyWith(
                fontSize: 16.sp,
                height: 21.86 / 16.r,
                color: theme.isDarkMode ? kBlack : kWhite,
              ),
              labelBackgroundColor: theme.isDarkMode
                  ? kWhite.withOpacity(0.5)
                  : kBlack.withOpacity(0.5),
              backgroundColor: theme.isDarkMode
                  ? kWhite.withOpacity(0.5)
                  : kBlack.withOpacity(0.5),
              onTap: customize,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.r),
              )),
        ],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.edit_outlined,
              size: 24.sp,
              color: theme.isDarkMode ? kBlack : kWhite,
            ),
            MyText('Edit',
                fontWeight: FontWeight.w700,
                fontSize: 11.sp,
                color: theme.isDarkMode ? kBlack : kWhite,
                height: 15.03 / 11.r),
          ],
        ),
      );
    });
  }
}
