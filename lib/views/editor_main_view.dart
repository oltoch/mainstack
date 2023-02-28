import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mainstack/controllers/editor_controller.dart';
import 'package:mainstack/controllers/theme_controller.dart';
import 'package:mainstack/enums/social_media_enum.dart';
import 'package:mainstack/utils/app_colors.dart';
import 'package:mainstack/views/edit_header.dart';
import 'package:mainstack/widgets/buttons.dart';
import 'package:mainstack/widgets/element_widget.dart';
import 'package:mainstack/widgets/texts.dart';
import 'package:mainstack/widgets/title_widget.dart';

import 'mainstack_view.dart';

class EditorMainView extends StatelessWidget {
  const EditorMainView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<EditorController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: kWhite,
          floatingActionButton: fab(),
          body: SafeArea(
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        height: 180.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: kInputFillColor,
                            image: controller.headerImage != null
                                ? DecorationImage(
                                    image: FileImage(controller.headerImage!),
                                    fit: BoxFit.cover)
                                : null),
                      ),
                      Gap(50.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                        child: Column(
                          children: [
                            MyText(
                              controller.name,
                              fontSize: 32.sp,
                              fontWeight: FontWeight.w700,
                            ),
                            Gap(10.h),
                            MyText(
                              controller.bio,
                              textAlign: TextAlign.center,
                              color: kBlack.withOpacity(0.7),
                            ),
                            Gap(10.h),
                            Wrap(
                                children: List.generate(
                                    controller.socialMedia.length, (index) {
                              SocialMedia social = SocialMediaMap.fromString(
                                  controller.socialMedia.keys.toList()[index])!;
                              return socialIcon(social.icon!);
                            })),
                            Gap(12.h),
                            Wrap(
                              children: List.generate(
                                  controller.titles.length,
                                  (index) =>
                                      TitleWidget(controller.titles[index])),
                            ),
                            Gap(20.h),
                            CardButton(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (_) => const EditHeader()));
                              },
                              label: 'Edit Header',
                              buttonType: ButtonType.lightRounded,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10.w, vertical: 16.h),
                            ),
                            Gap(16.h),
                            if (controller.editorModel!.links != null)
                              for (int i = 0;
                                  i < controller.editorModel!.links!.length;
                                  i++)
                                ElementWidget(
                                  title: 'Link',
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: CardButton(
                                          onTap: () {},
                                          label: controller
                                              .editorModel!.links![i].title,
                                          buttonType: ButtonType.solidRounded,
                                          fontSize: 16.sp,
                                          color: kBlack,
                                          textColor: kWhite,
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10.w, vertical: 16.h),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                            if (controller.editorModel!.text != null)
                              ElementWidget(
                                title: 'Text',
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    MyText(
                                      controller.editorModel!.text!.header,
                                      fontSize: 32.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    MyText(
                                      controller.editorModel!.text!.body,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ],
                                ),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
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
                      backgroundColor: kInputFillColor,
                      backgroundImage: controller.image == null
                          ? null
                          : FileImage(
                              controller.image!,
                            ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget fab() {
    return SizedBox(
      width: 200.w,
      child: FloatingActionButton(
        onPressed: () {
          Get.to(() => MainStackView());
        },
        elevation: 3,
        backgroundColor: kBlack,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.r),
        ),
        child: MyText(
          'View my Mainstack',
          color: kWhite,
          textAlign: TextAlign.center,
          fontSize: 14.sp,
          fontWeight: FontWeight.w700,
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
