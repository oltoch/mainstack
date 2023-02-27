import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mainstack/controllers/editor_controller.dart';
import 'package:mainstack/utils/app_colors.dart';
import 'package:mainstack/widgets/inputs.dart';

import '../widgets/texts.dart';

class EditHeader extends StatelessWidget {
  const EditHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<EditorController>(
      init: EditorController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () => Navigator.pop(context),
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
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 200.h,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                      ),
                      child: Column(
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
                    Gap(60.h),
                    InputWidget(
                      initialValue: controller.name,
                      onChanged: (value) => controller.name = value,
                      label: 'Display Name',
                      hintText: 'Enter your name',
                      validator: (value) =>
                          value == null || value.isEmpty ? 'Please enter your name' : null,
                    ),
                    Gap(12.h),
                    MyText('Bio',
                        fontSize: 14.sp,
                        letterSpacing: -0.02.sp,
                        color: kTextGray,
                        height: (22 / 14).sp
                    ),
                    Gap(4.h),
                    SizedBox(
                      height: 100.h,
                      child: MultiLineInputWidget(
                        keyBoardType: TextInputType.multiline,
                        initialValue: controller.bio,
                        onChanged: (value) => controller.bio = value,
                        hintText: 'Enter your bio',
                        validator: (value) =>
                            value == null || value.isEmpty ? 'Please enter your Bio' : null,
                      ),
                    ),
                    Gap(12.h),
                    MyText('Applicable Titles',
                        fontSize: 14.sp,
                        letterSpacing: -0.02.sp,
                        color: kTextGray,
                        height: (22 / 14).sp
                    ),
                    Gap(4.h),
                    Card(
                      color: kInputFillColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      elevation: 2,
                      child: Container(
                        width: double.maxFinite,
                        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                        child: Wrap(
                          children: [
                            for (var i = 0; i < controller.titles.length; i++)
                              Padding(
                                padding: EdgeInsets.only(right: 8.w),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    MyText(
                                      controller.titles[i],
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    IconButton(
                                      icon: Icon(Icons.close, size: 14.sp,),
                                      onPressed: () => controller.titles.removeAt(i),
                                    ),
                                  ],
                                ),
                              ), 
                            // IconButton(
                            //   icon: Icon(Icons.add, size: 14.sp,),
                            //   onPressed: () => controller.addTitle(),
                            // ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
  Widget _titleWidget(String title){
    return Container(
      margin: EdgeInsets.only(right: 10.w),
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.3),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        children: [
          MyText(
            title,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
          Gap(5.w),
          Icon(Icons.close, size: 14.sp,),
        ],
      ),
    );
  }
}
