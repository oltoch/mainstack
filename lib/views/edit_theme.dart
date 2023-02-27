import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mainstack/controllers/theme_controller.dart';
import 'package:mainstack/utils/app_colors.dart';
import 'package:mainstack/widgets/buttons.dart';
import 'package:mainstack/widgets/texts.dart';

class EditTheme extends StatelessWidget {
  const EditTheme({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Get.find<ThemeController>();
    return Container(
      height: MediaQuery.of(context).size.height * 0.75,
      padding: EdgeInsets.only(top: 16.h, left: 16.w, right: 16.w),
      decoration: BoxDecoration(
        color: kWhite,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15.r),
          topRight: Radius.circular(15.r),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            MyText(
              'Edit Theme',
              fontSize: 20.sp,
              fontWeight: FontWeight.w700,
            ),
            Gap(10.h),
            MyText(
              'Customize your font, colors, and more.',
              fontSize: 14.sp,
            ),
            Gap(12.h),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 0.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r),
                color: Colors.white,
                border: Border.all(
                  color: Colors.grey.withOpacity(0.3),
                  width: 1.w,
                ),
              ),
              child: Row(
                children: [
                  MyText(
                    'Dark Mode',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  const Spacer(),
                  Obx(
                    () => Switch(
                      value: theme.isDarkMode,
                      onChanged: (value) {
                        theme.toggleTheme();
                      },
                    ),
                  ),
                ],
              ),
            ),
            Gap(16.h),
            Obx(
              () => GestureDetector(
                onTap: () {
                  theme.headingExpanded = !theme.headingExpanded;
                },
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.grey.withOpacity(0.3),
                      width: 1.w,
                    ),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          MyText(
                            'Heading',
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                          const Spacer(),
                          RotatedBox(
                            quarterTurns: theme.headingExpanded ? 1 : 3,
                            child: Icon(
                              Icons.arrow_back_ios,
                              color: Colors.black,
                              size: 14.sp,
                            ),
                          ),
                        ],
                      ),
                      if (theme.headingExpanded) Gap(10.h),
                      if (theme.headingExpanded)
                        Wrap(
                          spacing: 10.w,
                          runSpacing: 10.h,
                          children: [
                            for (var style in FontStyle.values)
                              GestureDetector(
                                  onTap: () {
                                    theme.headingStyle = style;
                                  },
                                  child: fontWidget(
                                      style, theme.headingStyle == style)),
                          ],
                        ),
                    ],
                  ),
                ),
              ),
            ),
            Gap(16.h),
            Obx(
              () => GestureDetector(
                onTap: () {
                  theme.bodyExpanded = !theme.bodyExpanded;
                },
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.grey.withOpacity(0.3),
                      width: 1.w,
                    ),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          MyText(
                            'BodyText',
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                          const Spacer(),
                          RotatedBox(
                            quarterTurns: theme.bodyExpanded ? 1 : 3,
                            child: Icon(
                              Icons.arrow_back_ios,
                              color: Colors.black,
                              size: 14.sp,
                            ),
                          ),
                        ],
                      ),
                      if (theme.bodyExpanded) Gap(10.h),
                      if (theme.bodyExpanded)
                        Wrap(
                          spacing: 10.w,
                          runSpacing: 10.h,
                          children: [
                            for (var style in FontStyle.values)
                              GestureDetector(
                                  onTap: () {
                                    theme.textStyle = style;
                                  },
                                  child: fontWidget(
                                      style, theme.textStyle == style)),
                          ],
                        ),
                    ],
                  ),
                ),
              ),
            ),
            Gap(16.h),
            Obx(
              () => GestureDetector(
                onTap: () {
                  theme.buttonExpanded = !theme.buttonExpanded;
                },
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.grey.withOpacity(0.3),
                      width: 1.w,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          MyText(
                            'Button',
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                          const Spacer(),
                          RotatedBox(
                            quarterTurns: theme.buttonExpanded ? 1 : 3,
                            child: Icon(
                              Icons.arrow_back_ios,
                              color: Colors.black,
                              size: 14.sp,
                            ),
                          ),
                        ],
                      ),
                      if (theme.buttonExpanded) Gap(10.h),
                      if (theme.buttonExpanded)
                        Wrap(
                          spacing: 10.w,
                          runSpacing: 10.h,
                          children: [
                            for (var type in ButtonType.values)
                              GestureDetector(
                                  onTap: () {
                                    theme.buttonType = type;
                                  },
                                  child: buttonWidget(
                                      type, theme.buttonType == type)),
                          ],
                        ),
                      if (theme.buttonExpanded) Gap(16.h),
                      if (theme.buttonExpanded)
                      MyText(
                        'Solid Colors',
                        fontSize: 12.sp,
                      ),
                      if (theme.buttonExpanded) Gap(10.h),
                      if (theme.buttonExpanded)
                      Wrap(
                        spacing: 10.w,
                        runSpacing: 10.h,
                        children: [
                          for (var color in Colors.primaries)
                            GestureDetector(
                                onTap: () {
                                  theme.buttonColor = color;
                                },
                                child: buttonColorWidget(
                                    color, theme.buttonColor == color)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Gap(16.h),
          ],
        ),
      ),
    );
  }

  Widget fontWidget(FontStyle style, bool selected) => Card(
        elevation: 1,
        color: kWhite,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Container(
          alignment: Alignment.center,
          height: 65.h,
          width: 60.w,
          decoration: BoxDecoration(
            color: selected ? Colors.deepOrange.withOpacity(0.1) : null,
            borderRadius: BorderRadius.circular(10.r),
            border: selected
                ? Border.all(
                    color: Colors.deepOrange.withOpacity(0.7),
                    width: 1.w,
                  )
                : null,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyText(
                'Aa',
                fontSize: 22.sp,
                fontWeight: FontWeight.w800,
                fontStyle: style,
                color: selected ? Colors.deepOrange : null,
              ),
              MyText(
                format(style.name),
                fontSize: 10.sp,
                fontWeight: FontWeight.w500,
                fontStyle: style,
                color: selected ? Colors.deepOrange : null,
              ),
            ],
          ),
        ),
      );

  Widget buttonWidget(ButtonType type, bool selected) => Card(
        elevation: 1,
        color: kWhite,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Container(
          alignment: Alignment.center,
          height: 90.h,
          width: 84.w,
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          decoration: BoxDecoration(
            color: selected ? Colors.deepOrange.withOpacity(0.1) : null,
            borderRadius: BorderRadius.circular(10.r),
            border: selected
                ? Border.all(
                    color: Colors.deepOrange.withOpacity(0.7),
                    width: 1.w,
                  )
                : null,
          ),
          child: SizedBox(
            height: 40.h,
            child: CardButton(
              onTap: () {
                Get.find<ThemeController>().buttonType = type;
              },
              label: 'Button',
              color: selected ? Colors.deepOrange : kBlack,
              textColor: kWhite,
              fontSize: 11.sp,
              fontStyle: Get.find<ThemeController>().textStyle,
              buttonType: type,
            ),
          ),
        ),
      );

  Widget buttonColorWidget(Color color, bool selected) => CircleAvatar(
      backgroundColor: color,
      radius: 20.r,
      child: selected
          ? Icon(
              Icons.check,
              color: kWhite,
              size: 20.sp,
            )
          : null);

  String format(String text) => text[0].toUpperCase() + text.substring(1);
}
