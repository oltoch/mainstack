import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mainstack/controllers/editor_controller.dart';
import 'package:mainstack/controllers/theme_controller.dart';
import 'package:mainstack/model/image_model.dart';
import 'package:mainstack/model/link_model.dart';
import 'package:mainstack/model/text_model.dart';
import 'package:mainstack/utils/app_colors.dart';
import 'package:mainstack/widgets/buttons.dart';
import 'package:mainstack/widgets/element_widget.dart';
import 'package:mainstack/widgets/inputs.dart';
import 'package:mainstack/widgets/on_tap_fade.dart';
import 'package:mainstack/widgets/texts.dart';

class AddElement extends StatelessWidget {
  const AddElement({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          'Add element',
          fontSize: 18.sp,
          overflow: TextOverflow.fade,
          fontWeight: FontWeight.w600,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Column(
            children: [
              _element(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return Dialog(
                            insetPadding:
                                EdgeInsets.symmetric(horizontal: 16.w),
                            backgroundColor: Colors.transparent,
                            child: _linkDialog(),
                          );
                        });
                  },
                  iconData: Icons.link_outlined,
                  label: 'Links',
                  subText: 'Add multiple button links'),
              _element(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return Dialog(
                            insetPadding:
                                EdgeInsets.symmetric(horizontal: 16.w),
                            backgroundColor: Colors.transparent,
                            child: _textDialog(),
                          );
                        });
                  },
                  iconData: Icons.text_fields_outlined,
                  label: 'Text',
                  subText: 'Add contents, title and paragraph texts'),
              _element(
                  onTap: () {},
                  iconData: Icons.contact_mail_outlined,
                  label: 'Mailing list',
                  subText: 'Set up your mailing list'),
              _element(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return Dialog(
                            insetPadding:
                                EdgeInsets.symmetric(horizontal: 16.w),
                            backgroundColor: Colors.transparent,
                            child: _imageDialog(),
                          );
                        });
                  },
                  iconData: Icons.image_outlined,
                  label: 'Image',
                  subText: 'Add single or multiple images in grid or carousel'),
              _element(
                  onTap: () {},
                  iconData: Icons.video_library_outlined,
                  label: 'Video',
                  subText: 'Add your Youtube, Vimeo video links'),
              _element(
                  onTap: () {},
                  iconData: Icons.audiotrack_outlined,
                  label: 'Audio',
                  subText:
                      'Get more listeners, add your podcasts or favorite music'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _element({
    required IconData iconData,
    required String label,
    required String subText,
    required VoidCallback onTap,
  }) {
    return OnTapFade(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
        margin: EdgeInsets.symmetric(vertical: 10.h),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            border:
                Border.all(color: Colors.grey.withOpacity(0.3), width: 0.6)),
        child: Row(
          children: [
            Gap(16.w),
            Icon(
              iconData,
              size: 18.sp,
            ),
            Gap(32.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyText(
                    label,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                  Gap(4.h),
                  MyText(
                    subText,
                    fontSize: 11.sp,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _linkDialog() {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final total = 1.obs;
    List<LinkModel> links = [LinkModel(title: '', link: '')];
    final controller = Get.find<EditorController>();
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: kWhite,
        borderRadius: BorderRadius.circular(16.r),
      ),
      height: 500.h,
      child: Obx(() {
        return SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyText('Add Link',
                        fontSize: 20.sp, fontWeight: FontWeight.w600),
                    CardButton(
                      onTap: () {
                        if (links.isEmpty) {
                          snack('You need to add a link');
                          return;
                        }
                        if (links.any((element) =>
                            element.title.isEmpty || element.link.isEmpty)) {
                          formKey.currentState!.validate();
                          snack('You need to fill the required fields');
                          return;
                        }
                        if (formKey.currentState!.validate()) {
                          controller.addLinks(links);
                          Get.back();
                        }
                      },
                      label: 'Save',
                      buttonType: ButtonType.solidRounded,
                      fontSize: 16.sp,
                      color: kBlack,
                      textColor: kWhite,
                      padding: EdgeInsets.symmetric(
                          horizontal: 40.w, vertical: 12.h),
                    ),
                  ],
                ),
                Gap(16.h),
                for (int i = 0; i < total.value; i++)
                  SocialMediaWidget(
                      title: 'Link',
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MyText('Title',
                              fontSize: 14.sp,
                              letterSpacing: -0.02.sp,
                              color: kTextGray,
                              height: (22 / 14).sp),
                          InputWidget(
                            validator: (value) =>
                                (value == null || value.isEmpty)
                                    ? 'This field is required'
                                    : null,
                            onChanged: (value) {
                              links[i] = links[i].copyWith(title: value);
                            },
                          ),
                          Gap(4.h),
                          MyText('Link',
                              fontSize: 14.sp,
                              letterSpacing: -0.02.sp,
                              color: kTextGray,
                              height: (22 / 14).sp),
                          InputWidget(
                            keyBoardType: TextInputType.url,
                            validator: (value) =>
                                (value == null || value.isEmpty)
                                    ? 'This field is required'
                                    : null,
                            onChanged: (value) {
                              links[i] = links[i].copyWith(link: value);
                            },
                          ),
                        ],
                      ),
                      onDelete: () {
                        links.removeAt(i);
                        total.value = total.value - 1;
                      }),
                Row(
                  children: [
                    Expanded(
                      child: CardButton(
                        onTap: () {
                          total.value = total.value + 1;
                          links.add(LinkModel(title: '', link: ''));
                        },
                        label: '+ Add links',
                        buttonType: ButtonType.lightRounded,
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.w, vertical: 16.h),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      }),
    );
  }

  Widget _textDialog() {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    TextModel textModel = TextModel(header: '', body: '');
    final controller = Get.find<EditorController>();
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: kWhite,
        borderRadius: BorderRadius.circular(16.r),
      ),
      height: 500.h,
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyText('Add Text', fontSize: 20.sp, fontWeight: FontWeight.w600),
            Gap(16.h),
            InputWidget(
              hintText: 'Header',
              validator: (value) => (value == null || value.isEmpty)
                  ? 'This field is required'
                  : null,
              onChanged: (value) {
                textModel = textModel.copyWith(header: value);
              },
            ),
            Gap(16.h),
            SizedBox(
              height: 150.h,
              child: MultiLineInputWidget(
                keyBoardType: TextInputType.multiline,
                hintText: 'Body',
                validator: (value) => (value == null || value.isEmpty)
                    ? 'This field is required'
                    : null,
                onChanged: (value) {
                  textModel = textModel.copyWith(body: value);
                },
              ),
            ),
            const Spacer(),
            Row(
              children: [
                Expanded(
                  child: CardButton(
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        controller.addText(textModel);
                        Get.back();
                      }
                    },
                    label: 'Save',
                    buttonType: ButtonType.solidRounded,
                    fontSize: 16.sp,
                    color: kBlack,
                    textColor: kWhite,
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 16.h),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _imageDialog() {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    ImageModel imageModel = ImageModel();
    final hasHeading = false.obs;
    final total = 1.obs;
    final layoutStyle = LayoutStyle.single.obs;
    final controller = Get.find<EditorController>();
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: kWhite,
        borderRadius: BorderRadius.circular(16.r),
      ),
      height: 500.h,
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Obx(() {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyText('Add Image',
                        fontSize: 20.sp, fontWeight: FontWeight.w600),
                    CardButton(
                      onTap: () {},
                      label: 'Save',
                      buttonType: ButtonType.solidRounded,
                      fontSize: 16.sp,
                      color: kBlack,
                      textColor: kWhite,
                      padding: EdgeInsets.symmetric(
                          horizontal: 40.w, vertical: 12.h),
                    ),
                  ],
                ),
                Gap(16.h),
                MyText('Select layout style',
                    fontSize: 16.sp, fontWeight: FontWeight.w600),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: OnTapFade(
                        onTap: () {
                          layoutStyle.value = LayoutStyle.single;
                        },
                        child: _layoutWidget(LayoutStyle.single,
                            layoutStyle.value == LayoutStyle.single),
                      ),
                    ),
                    Gap(6.w),
                    Expanded(
                      child: OnTapFade(
                        onTap: () {
                          layoutStyle.value = LayoutStyle.grid;
                        },
                        child: _layoutWidget(LayoutStyle.grid,
                            layoutStyle.value == LayoutStyle.grid),
                      ),
                    ),
                    Gap(6.w),
                    Expanded(
                      child: OnTapFade(
                        onTap: () {
                          layoutStyle.value = LayoutStyle.carousel;
                        },
                        child: _layoutWidget(LayoutStyle.carousel,
                            layoutStyle.value == LayoutStyle.carousel),
                      ),
                    )
                  ],
                ),
                Gap(12.h),
                HeadingWidget(
                  title: 'Heading',
                  onChanged: (value) {
                    hasHeading.value = value;
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InputWidget(
                        hintText: 'Title',
                        validator: (value) => (value == null || value.isEmpty)
                            ? 'This field is required'
                            : null,
                        onChanged: (value) {
                          imageModel = imageModel.copyWith(title: value);
                        },
                      ),
                      Gap(8.h),
                      MyText('Description (optional)',
                          fontSize: 14.sp,
                          letterSpacing: -0.02.sp,
                          color: kTextGray,
                          height: (22 / 14).sp),
                      SizedBox(
                        height: 100.h,
                        child: MultiLineInputWidget(
                          keyBoardType: TextInputType.multiline,
                          onChanged: (value) {
                            imageModel =
                                imageModel.copyWith(description: value);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                for (int i = 0; i < total.value; i++)
                  SocialMediaWidget(
                      title: 'Image',
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            height: 150.h,
                            decoration: BoxDecoration(
                              color: kInputFillColor,
                            ),
                            child: OnTapFade(
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
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  MyText('(Image size should not exceed 5MB)',
                                      fontSize: 10.sp, color: kTextGray),
                                ],
                              ),
                            ),
                          ),
                          Gap(8.h),
                          InputWidget(
                            hintText: 'Caption (optional)',
                          ),
                          Gap(8.h),
                          InputWidget(
                            hintText: 'Alt text (optional)',
                          ),
                          Gap(8.h),
                          InputWidget(
                            hintText: 'Link (optional)',
                          ),
                        ],
                      ),
                      onDelete: () {
                        total.value = total.value - 1;
                      }),
                Row(
                  children: [
                    Expanded(
                      child: CardButton(
                        onTap: () {
                          total.value = total.value + 1;
                          //links.add(LinkModel(title: '', link: ''));
                        },
                        label: '+ Add image',
                        buttonType: ButtonType.lightRounded,
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.w, vertical: 16.h),
                      ),
                    ),
                  ],
                ),
              ],
            );
          }),
        ),
      ),
    );
  }

  Widget _layoutWidget(LayoutStyle layout, bool selected) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 12.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(
          color:
              selected ? Colors.deepOrangeAccent : Colors.grey.withOpacity(0.5),
        ),
        color: selected ? Colors.deepOrangeAccent.withOpacity(0.3) : null,
      ),
      child: Column(children: [
        Icon(
          layout == LayoutStyle.single
              ? Icons.image_outlined
              : layout == LayoutStyle.grid
                  ? Icons.grid_view
                  : Icons.view_carousel_outlined,
          color: selected ? Colors.deepOrange : kBlack,
          size: 20.sp,
        ),
        Gap(8.h),
        MyText(
          '${format(layout.name)} Layout',
          color: selected ? Colors.deepOrange : kBlack,
          fontSize: 10.sp,
        ),
      ]),
    );
  }

  void snack(String content) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        content: MyText(
          content,
          color: kWhite,
          fontSize: 14.sp,
        ),
        elevation: 3,
        margin: EdgeInsets.fromLTRB(16.w, 0, 16.w, 60.h),
        backgroundColor: kBlack,
      ),
    );
  }

  String format(String text) => text[0].toUpperCase() + text.substring(1);
}
