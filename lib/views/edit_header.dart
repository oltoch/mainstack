import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mainstack/controllers/editor_controller.dart';
import 'package:mainstack/utils/app_colors.dart';
import 'package:mainstack/widgets/element_widget.dart';
import 'package:mainstack/widgets/inputs.dart';
import 'package:mainstack/widgets/on_tap_fade.dart';

import '../controllers/theme_controller.dart';
import '../widgets/buttons.dart';
import '../widgets/texts.dart';

class EditHeader extends StatelessWidget {
  const EditHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<EditorController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: Padding(
              padding: EdgeInsets.only(left: 25.0.w),
              child: IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: kBlack,
                ),
                onPressed: () => Navigator.pop(context),
              ),
            ),
            title: MyText(
              'Edit Header',
              fontSize: 18.sp,
              overflow: TextOverflow.fade,
              fontWeight: FontWeight.w600,
            ),
          ),
          body: Padding(
            padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 16.h),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 200.h,
                      decoration: BoxDecoration(
                          color: kInputFillColor,
                          image: controller.headerImage != null
                              ? DecorationImage(
                                  image: FileImage(controller.headerImage!),
                                  fit: BoxFit.cover)
                              : null),
                      child: controller.headerImage != null
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                OnTapFade(
                                  onTap: () => controller.pickHeaderImage(),
                                  child: CircleAvatar(
                                    backgroundColor: Colors.grey,
                                    radius: 20.r,
                                    child: Icon(
                                      Icons.camera_alt_outlined,
                                      color: Colors.white,
                                      size: 20.sp,
                                    ),
                                  ),
                                ),
                                Gap(12.w),
                                OnTapFade(
                                  onTap: () {
                                    controller.headerImage = null;
                                  },
                                  child: CircleAvatar(
                                    backgroundColor: Colors.grey,
                                    radius: 20.r,
                                    child: Icon(
                                      Icons.delete_outline_outlined,
                                      color: Colors.white,
                                      size: 20.sp,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          : OnTapFade(
                              onTap: () => controller.pickHeaderImage(),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CircleAvatar(
                                    backgroundColor: kBlack,
                                    radius: 15.r,
                                    child: Icon(
                                      Icons.camera_alt_outlined,
                                      color: Colors.white,
                                      size: 15.sp,
                                    ),
                                  ),
                                  Gap(10.h),
                                  MyText(
                                    'Upload a photo',
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  MyText('(Image size should not exceed 5MB)',
                                      fontSize: 12.sp, color: kTextGray),
                                ],
                              ),
                            ),
                    ),
                    Gap(60.h),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InputWidget(
                              initialValue: controller.name,
                              onChanged: (value) => controller.name = value,
                              label: 'Display Name',
                              hintText: 'Enter your name',
                              validator: (value) =>
                                  value == null || value.isEmpty
                                      ? 'Please enter your name'
                                      : null,
                            ),
                            Gap(12.h),
                            MyText('Bio',
                                fontSize: 14.sp,
                                letterSpacing: -0.02.sp,
                                color: kTextGray,
                                height: (22 / 14).sp),
                            Gap(4.h),
                            SizedBox(
                              height: 120.h,
                              child: MultiLineInputWidget(
                                keyBoardType: TextInputType.multiline,
                                initialValue: controller.bio,
                                onChanged: (value) => controller.bio = value,
                                hintText: 'Enter your bio',
                                validator: (value) =>
                                    value == null || value.isEmpty
                                        ? 'Please enter your Bio'
                                        : null,
                              ),
                            ),
                            Gap(12.h),
                            MyText('Applicable Titles',
                                fontSize: 14.sp,
                                letterSpacing: -0.02.sp,
                                color: kTextGray,
                                height: (22 / 14).sp),
                            Gap(4.h),
                            GestureDetector(
                              onTap: () {
                                _addTitle(context);
                              },
                              child: Card(
                                color: kInputFillColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                                elevation: 2,
                                child: Container(
                                  constraints: BoxConstraints(minHeight: 50.h),
                                  width: double.maxFinite,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 16.w, vertical: 8.h),
                                  child: Wrap(
                                    runSpacing: 6.h,
                                    children: [
                                      for (var i = 0;
                                          i < controller.titles.length;
                                          i++)
                                        OnTapFade(
                                            onTap: () =>
                                                controller.titles.removeAt(i),
                                            child: _titleWidget(
                                                controller.titles[i])),
                                      OnTapFade(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Icon(
                                            Icons.add,
                                            size: 20.sp,
                                          ),
                                        ),
                                        onTap: () => _addTitle(context),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Gap(12.h),
                            MyText('Social Media',
                                fontSize: 14.sp,
                                letterSpacing: -0.02.sp,
                                color: kTextGray,
                                height: (22 / 14).sp),
                            Gap(4.h),
                            for (int i = 0;
                                i < controller.socialMedia.length;
                                i++)
                              SocialMediaWidget(
                                  title:
                                      controller.socialMedia.keys.toList()[i],
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      MyText(
                                          mediaText(controller.socialMedia.keys
                                              .toList()[i]),
                                          fontSize: 14.sp,
                                          letterSpacing: -0.02.sp,
                                          color: kTextGray,
                                          height: (22 / 14).sp),
                                      InputWidget(
                                        prefixIcon: mediaText(controller
                                                    .socialMedia.keys
                                                    .toList()[i]) ==
                                                'Username'
                                            ? const Icon(Icons.alternate_email)
                                            : const Icon(Icons.phone_android),
                                        onChanged: (value) =>
                                            controller.socialMedia[controller
                                                .socialMedia.keys
                                                .toList()[i]] = value,
                                      ),
                                    ],
                                  ),
                                  onDelete: () {
                                    controller.socialMedia.remove(controller
                                        .socialMedia.keys
                                        .toList()[i]);
                                  }),
                            Gap(10.h),
                            Row(
                              children: [
                                Expanded(
                                  child: CardButton(
                                    onTap: () => _setMedia(context),
                                    label: '+ Add links',
                                    buttonType: ButtonType.lightRounded,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Gap(16.h),
                    Row(
                      children: [
                        Expanded(
                          child: CardButton(
                            onTap: () => Get.back(),
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.w, vertical: 16.h),
                            label: 'Save',
                            color: kBlack,
                            textColor: kWhite,
                            buttonType: ButtonType.solidRounded,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Positioned(
                  top: 150.h,
                  left: 16.w,
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
                      child: controller.image != null
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                OnTapFade(
                                  onTap: () => controller.pickProfileImage(),
                                  child: CircleAvatar(
                                    backgroundColor: Colors.grey,
                                    radius: 15.r,
                                    child: Icon(
                                      Icons.camera_alt_outlined,
                                      color: Colors.white,
                                      size: 15.sp,
                                    ),
                                  ),
                                ),
                                Gap(6.w),
                                OnTapFade(
                                  onTap: () {
                                    controller.image = null;
                                  },
                                  child: CircleAvatar(
                                    backgroundColor: Colors.grey,
                                    radius: 15.r,
                                    child: Icon(
                                      Icons.delete_outline_outlined,
                                      color: Colors.white,
                                      size: 15.sp,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          : GestureDetector(
                              onTap: () => controller.pickProfileImage(),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CircleAvatar(
                                    backgroundColor: kBlack,
                                    radius: 12.r,
                                    child: Icon(
                                      Icons.camera_alt_outlined,
                                      color: Colors.white,
                                      size: 12.sp,
                                    ),
                                  ),
                                  Gap(10.h),
                                  MyText(
                                    'Upload a photo',
                                    fontSize: 11.sp,
                                    textAlign: TextAlign.center,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ],
                              ),
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

  Widget _list() {
    final controller = Get.find<EditorController>();
    return Container(
      height: 400.h,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
      decoration: BoxDecoration(
          color: kWhite, borderRadius: BorderRadius.circular(12.r)),
      child: Column(
        children: [
          // InputWidget(
          //   hintText: 'Search',
          //   hasLabel: false,
          // ),
          // Gap(20.h),
          Expanded(
            child: ListView.separated(
              itemCount: controller.applicableTitles.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    controller.titles.add(controller.applicableTitles[index]);
                    Navigator.of(context).pop();
                  },
                  child: Padding(
                    padding: EdgeInsets.all(10.0.h),
                    child: MyText(
                      controller.applicableTitles[index],
                      fontSize: 14.sp,
                    ),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                  child: const Divider(
                    height: 1,
                    thickness: 1,
                    color: Colors.grey,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _socialMedia() {
    final controller = Get.find<EditorController>();
    return Container(
      height: 400.h,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
      decoration: BoxDecoration(
          color: kWhite, borderRadius: BorderRadius.circular(12.r)),
      child: Column(
        children: [
          MyText(
            'Select Social Media',
            fontSize: 16.sp,
          ),
          Gap(20.h),
          Expanded(
            child: ListView.builder(
              itemCount: controller.media.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    controller.addMedia(controller.media[index]);
                  },
                  child: Obx(() {
                    return Padding(
                      padding: EdgeInsets.all(10.0.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MyText(
                            controller.media[index],
                            fontSize: 14.sp,
                          ),
                          CircleAvatar(
                            radius: 15.sp,
                            backgroundColor: controller.socialMedia
                                    .containsKey(controller.media[index])
                                ? Colors.deepOrange
                                : kInputFillColor.withOpacity(0.4),
                            child: controller.socialMedia
                                    .containsKey(controller.media[index])
                                ? Icon(
                                    Icons.check,
                                    color: kWhite,
                                    size: 15.sp,
                                  )
                                : null,
                          ),
                        ],
                      ),
                    );
                  }),
                );
              },
            ),
          ),
          Gap(16.h),
          Row(
            children: [
              Expanded(
                child: CardButton(
                  onTap: () {
                    Navigator.of(Get.context!).pop();
                  },
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 16.h),
                  label: 'Confirm',
                  color: kBlack,
                  textColor: kWhite,
                  buttonType: ButtonType.solidRounded,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _titleWidget(String title) {
    return Container(
      margin: EdgeInsets.only(right: 5.w),
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.3),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          MyText(
            title,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
          Gap(5.w),
          Icon(
            Icons.close,
            size: 14.sp,
          ),
        ],
      ),
    );
  }

  void _addTitle(BuildContext context) {
    FocusManager.instance.primaryFocus?.unfocus();
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            backgroundColor: Colors.transparent,
            child: _list(),
          );
        });
  }

  void _setMedia(BuildContext context) {
    FocusManager.instance.primaryFocus?.unfocus();
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            backgroundColor: Colors.transparent,
            child: _socialMedia(),
          );
        });
  }

  String mediaText(String media) {
    if (media == 'WhatsApp' || media == 'Telegram') {
      return 'Phone Number';
    } else {
      return 'Username';
    }
  }
}
