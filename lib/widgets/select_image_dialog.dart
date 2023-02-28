
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:mainstack/utils/app_colors.dart';

import 'on_tap_fade.dart';
import 'texts.dart';

class SelectImageDialog extends StatelessWidget {
  const SelectImageDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.w),
        height: 150.h,
        //alignment: Alignment.center,
        decoration: BoxDecoration(
          color: kWhite,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 12.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              OnTapFade(
                onTap: () {
                  Navigator.of(context).pop('camera');
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 32.r,
                      backgroundColor: const Color(0xFFEEF1F4),
                      child: Icon(
                        Icons.camera_alt_outlined,
                        size: 30.r,
                        color: const Color(0xFF667080),
                      ),
                    ),
                    Gap(8.h),
                    MyText(
                      'Camera',
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
              ),
              OnTapFade(
                onTap: () {
                  Navigator.of(context).pop('gallery');
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 32.r,
                      backgroundColor: const Color(0xFFEEF1F4),
                      child: Icon(
                        Icons.photo_outlined,
                        size: 30.r,
                        color: const Color(0xFF667080),
                      ),
                    ),
                    Gap(8.h),
                    MyText(
                      'Gallery',
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
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
