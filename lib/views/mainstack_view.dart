import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mainstack/controllers/editor_controller.dart';
import 'package:mainstack/enums/social_media_enum.dart';
import 'package:mainstack/model/image_model.dart';
import 'package:mainstack/utils/app_colors.dart';
import 'package:mainstack/widgets/buttons.dart';
import 'package:mainstack/widgets/speed_dial_fab.dart';
import 'package:mainstack/widgets/texts.dart';
import 'package:mainstack/widgets/title_widget.dart';

import '../controllers/theme_controller.dart';
import 'add_element.dart';
import 'edit_theme.dart';

class MainStackView extends StatelessWidget {
  MainStackView({super.key});

  final editor = Get.find<EditorController>();
  final theme = Get.find<ThemeController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        backgroundColor: theme.isDarkMode ? kBlack.withOpacity(0.9) : kWhite,
        floatingActionButton: SpeedDialFab(
          customize: () {
            showModalBottomSheet(
                backgroundColor: Colors.transparent,
                isScrollControlled: true,
                context: context,
                builder: (context) {
                  return Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: const EditTheme(),
                  );
                }).then((value) {
              theme.headingExpanded = false;
              theme.bodyExpanded = false;
              theme.buttonExpanded = false;
            });
          },
          addElement: () {
            Get.to(()=>const AddElement());
          },
        ),
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
                          color: theme.isDarkMode
                              ? kDisabledGray
                              : kInputFillColor,
                          image: editor.headerImage != null
                              ? DecorationImage(
                                  image: FileImage(editor.headerImage!),
                                  fit: BoxFit.cover)
                              : null),
                    ),
                    Gap(50.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: MyText(
                              editor.name,
                              fontSize: 32.sp,
                              fontWeight: FontWeight.w700,
                              color: theme.textColor,
                              fontStyle: theme.headingStyle,
                            ),
                          ),
                          Gap(10.h),
                          Center(
                            child: MyText(
                              editor.bio,
                              textAlign: TextAlign.center,
                              color: theme.isDarkMode
                                  ? kWhite
                                  : kBlack.withOpacity(0.7),
                              fontStyle: theme.textStyle,
                            ),
                          ),
                          Gap(10.h),
                          Center(
                            child: Wrap(
                                children: List.generate(editor.socialMedia.length,
                                    (index) {
                              SocialMedia social = SocialMediaMap.fromString(
                                  editor.socialMedia.keys.toList()[index])!;
                              return socialIcon(social.icon!);
                            })),
                          ),
                          Gap(12.h),
                          Center(
                            child: Wrap(
                              children: List.generate(
                                editor.titles.length,
                                (index) => TitleWidget(
                                  editor.titles[index],
                                  textColor: theme.textColor,
                                  fontStyle: theme.textStyle,
                                ),
                              ),
                            ),
                          ),
                          Gap(20.h),
                          //Elements
                          if (editor.editorModel != null)
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                //Links
                                if (editor.editorModel!.links != null)
                                  for (int i = 0;
                                      i < editor.editorModel!.links!.length;
                                      i++)
                                    CardButton(
                                      label:
                                          editor.editorModel!.links![i].title,
                                      buttonType: theme.buttonType,
                                      fontStyle: theme.textStyle,
                                      color: theme.buttonColor,
                                      textColor: kWhite,
                                      fontSize: 14.sp,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10.w, vertical: 16.h),
                                    ),
                                //Text
                                if (editor.editorModel!.text != null)
                                  MyText(
                                    editor.editorModel!.text!.header,
                                    fontStyle: theme.headingStyle,
                                    color: theme.textColor,
                                    fontSize: 32.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                if (editor.editorModel!.text != null)
                                  MyText(
                                    editor.editorModel!.text!.body,
                                    fontStyle: theme.textStyle,
                                    color: theme.textColor,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                if (editor.editorModel!.imageModel != null)
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      editor.editorModel!.imageModel!.title !=
                                              null
                                          ? MyText(
                                              editor.editorModel!.imageModel!
                                                      .title ??
                                                  '',
                                              fontStyle: theme.headingStyle,
                                              color: theme.textColor,
                                              fontSize: 20.sp,
                                              fontWeight: FontWeight.w600,
                                            )
                                          : const SizedBox(),
                                      editor.editorModel!.imageModel!
                                                  .description !=
                                              null
                                          ? MyText(
                                              editor.editorModel!.imageModel!
                                                      .description ??
                                                  '',
                                              fontStyle: theme.textStyle,
                                              color: theme.textColor,
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w500,
                                            )
                                          : const SizedBox(),
                                      editor.editorModel!.imageModel!
                                                  .layoutStyle ==
                                              LayoutStyle.single
                                          ? SizedBox(
                                              height: 200.h,
                                              width: double.maxFinite,
                                              child: Image.file(
                                                File(editor
                                                    .editorModel!
                                                    .imageModel!
                                                    .images[0]
                                                    .image),
                                                fit: BoxFit.cover,
                                              ),
                                            )
                                          : GridView.builder(
                                              itemCount: editor.editorModel!
                                                  .imageModel!.images.length,
                                              gridDelegate:
                                                  SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 2,
                                                mainAxisSpacing: 10.r,
                                                crossAxisSpacing: 10.r,
                                              ),
                                              itemBuilder: (context, index) {
                                                return SizedBox(
                                                  height: 140.h,
                                                  child: Image.file(
                                                    File(editor
                                                        .editorModel!
                                                        .imageModel!
                                                        .images[index]
                                                        .image),
                                                    fit: BoxFit.cover,
                                                  ),
                                                );
                                              }),
                                    ],
                                  ),

                              ],
                            )
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
                    backgroundImage: editor.image == null
                        ? null
                        : FileImage(
                            editor.image!,
                          ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget socialIcon(String path) {
    return Padding(
      padding: EdgeInsets.only(right: 8.0.w),
      child: SvgPicture.asset(path, width: 32.w, height: 32.h),
    );
  }
}
