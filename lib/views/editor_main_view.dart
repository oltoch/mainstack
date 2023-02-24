import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:mainstack/utils/app_colors.dart';
import 'package:mainstack/widgets/element_widget.dart';
import 'package:mainstack/widgets/speed_dial_fab.dart';
import 'package:mainstack/widgets/texts.dart';
import 'package:mainstack/widgets/title_widget.dart';

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
                  Gap(70.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                    child: Column(
                      children:[
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
                        Gap(16.h),
                        Wrap(
                          children: [
                            //SvgPicture.asset(''),
                          ],
                        ),
                        Wrap(
                          children: [
                            TitleWidget('Developer'),
                          ],
                        ),
                        Gap(16.h),
                        ElevatedButton(onPressed: (){}, child: MyText('View my mainstack')),
                        Gap(16.h),
                        ElementWidget(title: 'Link', child: MyText('Nothing for now'),),
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                top:130.h,
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
              Positioned(
                top:210.h,
                left: 20.w,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TitleWidget('Edit Header'),
                  ],
                ),
              ),
            ],
          ),
        ),);
  }
}
