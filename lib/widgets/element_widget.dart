import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:mainstack/utils/app_colors.dart';
import 'package:mainstack/widgets/texts.dart';

class ElementWidget extends StatefulWidget {
  const ElementWidget({super.key, required this.title, required this.child});

  final String title;
  final Widget child;

  @override
  State<ElementWidget> createState() => _ElementWidgetState();
}

class _ElementWidgetState extends State<ElementWidget> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isExpanded = !_isExpanded;
        });
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 12.h),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
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
                Icon(
                  Icons.more_vert,
                  color: kTextGray,
                  size: 18.sp,
                ),
                Gap(10.w),
                MyText(
                  widget.title,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: kTextGray,
                ),
                const Spacer(),
                RotatedBox(
                  quarterTurns: _isExpanded ? 1 : 3,
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                    size: 14.sp,
                  ),
                ),
              ],
            ),
            if (_isExpanded) Gap(16.h),
            if (_isExpanded) widget.child,
            if (_isExpanded) Gap(16.h),
            if (_isExpanded)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ButtonIcon(
                    Icons.edit_outlined,
                    onTap: () {},
                  ),
                  Gap(10.w),
                  ButtonIcon(
                    Icons.visibility_outlined,
                    onTap: () {},
                  ),
                  Gap(10.w),
                  ButtonIcon(
                    Icons.copy_all,
                    onTap: () {},
                  ),
                  Gap(10.w),
                  ButtonIcon(
                    Icons.delete_outline,
                    onTap: () {},
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}

class ButtonIcon extends StatelessWidget {
  const ButtonIcon(this.icon, {super.key, required this.onTap});

  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(8.r),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.grey.withOpacity(0.2),
            width: 0.5.w,
          ),
        ),
        child: Icon(
          icon,
          color: Colors.black.withOpacity(0.7),
          size: 20.sp,
        ),
      ),
    );
  }
}

class SocialMediaWidget extends StatefulWidget {
  const SocialMediaWidget({
    super.key,
    required this.title,
    required this.child,
    required this.onDelete,
  });

  final String title;
  final Widget child;
  final VoidCallback onDelete;

  @override
  State<SocialMediaWidget> createState() => _SocialMediaWidgetState();
}

class _SocialMediaWidgetState extends State<SocialMediaWidget> {
  bool _isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isExpanded = !_isExpanded;
        });
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 12.h),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          color: Colors.white,
          border: Border.all(
            color: Colors.grey.withOpacity(0.3),
            width: 1.w,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Icon(
                  Icons.more_vert,
                  color: kTextGray,
                  size: 18.sp,
                ),
                Gap(10.w),
                MyText(
                  widget.title,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: kTextGray,
                ),
                const Spacer(),
                ButtonIcon(
                  Icons.delete_outline,
                  onTap:widget.onDelete,
                ),
                Gap(8.w),
                RotatedBox(
                  quarterTurns: _isExpanded ? 1 : 3,
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                    size: 14.sp,
                  ),
                ),
              ],
            ),
            if (_isExpanded) Gap(16.h),
            if (_isExpanded) widget.child,
          ],
        ),
      ),
    );
  }
}

class HeadingWidget extends StatefulWidget {
  const HeadingWidget({
    super.key,
    required this.title,
    required this.child,
    required this.onChanged,
  });

  final String title;
  final Widget child;
  final Function(bool) onChanged;

  @override
  State<HeadingWidget> createState() => _HeadingWidgetState();
}

class _HeadingWidgetState extends State<HeadingWidget> {
  bool _isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: Colors.white,
        border: Border.all(
          color: Colors.grey.withOpacity(0.3),
          width: 1.w,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              MyText(
                widget.title,
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: kTextGray,
              ),
              const Spacer(),
        Switch(
          value: _isExpanded,
          activeColor: Colors.deepOrangeAccent,
          onChanged: (value) {
            widget.onChanged.call(value);
            setState(() {
              _isExpanded = value;
            });
          },
        )
              ,
            ],
          ),
          if (_isExpanded) Gap(16.h),
          if (_isExpanded) widget.child,
        ],
      ),
    );
  }
}