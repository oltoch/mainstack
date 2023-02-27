import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mainstack/controllers/theme_controller.dart';
import 'package:mainstack/utils/app_colors.dart';

import 'on_tap_fade.dart';
import 'texts.dart';

class CardButton extends StatelessWidget {
  const CardButton({
    super.key,
    this.label,
    this.color,
    this.textColor,
    this.onTap,
    this.fontSize,
    this.borderRadius,
    this.fontWeight,
    this.padding,
    this.buttonType = ButtonType.solidRounded,
    this.fontStyle = FontStyle.poppins,
  });

  final String? label;
  final Color? color;
  final Color? textColor;
  final VoidCallback? onTap;
  final double? fontSize;
  final double? borderRadius;
  final FontWeight? fontWeight;
  final EdgeInsetsGeometry? padding;
  final ButtonType buttonType;
  final FontStyle fontStyle;

  @override
  Widget build(BuildContext context) {
    return OnTapFade(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        padding:
            padding ?? EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
        decoration: BoxDecoration(
          borderRadius: buttonType == ButtonType.solidRounded
              ? BorderRadius.circular(borderRadius ?? 25.r)
              : buttonType == ButtonType.lightRounded
                  ? BorderRadius.circular(borderRadius ?? 25.r)
                  : buttonType == ButtonType.solidCurved
                      ? BorderRadius.circular(borderRadius ?? 12.r)
                      : buttonType == ButtonType.lightCurved
                          ? BorderRadius.circular(borderRadius ?? 12.r)
                          : null,
          color: buttonType == ButtonType.solidRounded ||
                  buttonType == ButtonType.solidCurved ||
                  buttonType == ButtonType.solidSquare
              ? color
              : null,
          border: buttonType == ButtonType.lightRounded ||
                  buttonType == ButtonType.lightCurved ||
                  buttonType == ButtonType.lightSquare
              ? Border.all(
                  color: color ?? kBlack,
                  width: 1.w,
                )
              : null,
        ),
        child: MyText(
          label ?? '',
          textAlign: TextAlign.center,
          color: buttonType == ButtonType.solidRounded ||
                  buttonType == ButtonType.solidCurved ||
                  buttonType == ButtonType.solidSquare
              ? textColor
              : color,
          fontStyle: fontStyle,
          fontSize: fontSize ?? 12.sp,
          fontWeight: fontWeight ?? FontWeight.w600,
        ),
      ),
    );
  }
}
