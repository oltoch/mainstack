import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mainstack/controllers/theme_controller.dart';
import 'package:mainstack/utils/app_colors.dart';
import 'package:mainstack/widgets/element_widget.dart';
import 'package:mainstack/widgets/speed_dial_fab.dart';
import 'package:mainstack/widgets/texts.dart';
import 'package:mainstack/widgets/title_widget.dart';

import 'edit_theme.dart';

class EditorMainView extends StatelessWidget {
  const EditorMainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondaryBlue,
      floatingActionButton: SpeedDialFab(),
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: 180.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: kPrimaryBlue,
                    // image: DecorationImage(
                    //   image: AssetImage('assets/images/cover.png'),
                    //   fit: BoxFit.cover,
                    // ),
                  ),
                ),
                Gap(50.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                  child: Column(
                    children: [
                      MyText(
                        'Tolulope Olaniyan',
                        fontSize: 32.sp,
                        fontWeight: FontWeight.w700,
                      ),
                      Gap(10.h),
                      MyText(
                        'Your bio goes here. CLick the \'edit profile\' above to '
                        'tell your audience about yourself.',
                        textAlign: TextAlign.center,
                        color: kBlack.withOpacity(0.7),
                      ),
                      Gap(10.h),
                      Wrap(
                        children: [
                          socialIcon('assets/icons/facebook_icon.svg'),
                          socialIcon('assets/icons/instagram_icon.svg'),
                          socialIcon('assets/icons/twitter_icon.svg'),
                          socialIcon('assets/icons/linkedin_icon.svg'),
                        ],
                      ),
                      Gap(12.h),
                      Wrap(
                        children: [
                          TitleWidget('Developer'),
                        ],
                      ),
                      Gap(20.h),
                      ElevatedButton(
                          onPressed: () {
                            showModalBottomSheet(
                                backgroundColor: Colors.transparent,
                                isScrollControlled: true,
                                context: context,
                                builder: (context) {
                                  return Padding(
                                    padding: EdgeInsets.only(
                                        bottom: MediaQuery.of(context).viewInsets.bottom),
                                    child: EditTheme(),
                                  );
                                }).then((value) {
                                  final theme = Get.find<ThemeController>();
                                  theme.headingExpanded = false;
                                  theme.bodyExpanded = false;
                                  theme.buttonExpanded = false;
                            });
                          }, child: MyText('Edit Header')),
                      Gap(16.h),
                      ElementWidget(
                        title: 'Link',
                        child: MyText('Nothing for now'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              top: 130.h,
              left: 20.w,
              right: 20.w,
              child: CircleAvatar(
                radius: 50.r,
                backgroundColor: kWhite,
                child: CircleAvatar(
                  radius: 48.r,
                  backgroundColor: kPrimaryBlue,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget socialIcon(String path) {
    return Padding(
      padding: EdgeInsets.only(right: 8.0.w),
      child: SvgPicture.asset(path, width: 32.w, height: 32.h),
    );
  }
}
