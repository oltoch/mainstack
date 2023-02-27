import 'package:mainstack/utils/app_colors.dart';
import 'package:mainstack/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class InputWidget extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final TextInputType? keyBoardType;
  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;
  final String? Function(String?)? validator;
  final Widget? suffix;
  final Widget? prefix;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool hasLabel;
  final bool obscureText;
  final bool multiLine;
  final bool enabled;
  final bool readOnly;
  final String? initialValue;
  final List<TextInputFormatter>? inputFormatters;
  final bool filled;
  final TextAlign textAlign;
  final String? label;
  final Color? fillColor;
  final FocusNode? focusNode;
  final VoidCallback? onTap;
  final bool hasBorder;

  /// A custom TextFormField to accept user input
  const InputWidget({
    super.key,
    this.controller,
    this.hintText,
    this.onChanged,
    this.onFieldSubmitted,
    this.validator,
    this.keyBoardType,
    this.prefix,
    this.suffix,
    this.prefixIcon,
    this.suffixIcon,
    this.hasLabel = true,
    this.obscureText = false,
    this.multiLine = false,
    this.enabled = true,
    this.readOnly = false,
    this.initialValue,
    this.inputFormatters,
    this.filled = true,
    this.textAlign = TextAlign.start,
    this.label,
    this.fillColor,
    this.focusNode,
    this.onTap,
    this.hasBorder = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (hasLabel)
          Text(
            label ?? hintText ?? '',
            style: TextStyle(
                fontSize: 14.sp,
                letterSpacing: -0.02.sp,
                color: kTextGray,
                height: (22 / 14).sp),
          ),
        if (hasLabel) Gap(4.h),
        TextFormField(
          focusNode: focusNode,
          initialValue: initialValue,
          readOnly: readOnly,
          enabled: enabled,
          maxLines: multiLine ? null : 1,
          expands: multiLine ? true : false,
          cursorColor: kTextGray,
          textAlignVertical:
          multiLine ? TextAlignVertical.top : TextAlignVertical.center,
          autocorrect: true,
          textAlign: textAlign,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          textCapitalization: TextCapitalization.sentences,
          keyboardType: keyBoardType,
          obscureText: obscureText,
          controller: controller,
          obscuringCharacter: '*',
          inputFormatters: inputFormatters,
          style: kStylePoppins.copyWith(fontSize: 16.0.sp),
          decoration: InputDecoration(
            fillColor: fillColor ?? kInputFillColor,
            filled: filled,
            isDense: true,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            suffix: Padding(
              padding: EdgeInsets.only(top: 0.0.h),
              child: suffix,
            ),
            prefix: Padding(
              padding: EdgeInsets.only(top: 0.0.h),
              child: prefix,
            ),
            focusedBorder: hasBorder
                ? OutlineInputBorder(
                borderSide: const BorderSide(color: kBorderColor),
                borderRadius: BorderRadius.circular(12.0))
                : const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent)),
            contentPadding:
            EdgeInsets.symmetric(vertical: 18.0.h, horizontal: 16.0.w),
            hintText: !enabled && initialValue != null ? null : hintText,
            hintStyle: kStylePoppins.copyWith(
              fontWeight: FontWeight.w200,
              fontSize: 14.0.sp,
              height: (20.12 / 14.0).sp,
              color: kLightGray,
            ),
            errorStyle: kStylePoppins.copyWith(
              fontWeight: FontWeight.w300,
              fontSize: 10.0.sp,
              height: 1,
              color: kPrimaryRed,
            ),
            // labelText: label
            //     ? !enabled && initialValue != null
            //         ? null
            //         : hintText
            //     : null,
            labelStyle: kStylePoppins.copyWith(
              fontWeight: FontWeight.w200,
              fontSize: 14.0.sp,
              height: (22 / 14.0).sp,
            ),
            enabledBorder: hasBorder
                ? OutlineInputBorder(
                borderSide: const BorderSide(color: kBorderColor),
                borderRadius: BorderRadius.circular(12.0))
                : const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent)),
            errorBorder: hasBorder
                ? OutlineInputBorder(
                borderSide: const BorderSide(color: kPrimaryRed),
                borderRadius: BorderRadius.circular(12.0))
                : const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent)),
          ),
          onTap: onTap,
          onChanged: (String value) => onChanged?.call(value),
          onFieldSubmitted: (String value) => onFieldSubmitted?.call(value),
          validator: (String? value) => validator?.call(value),
        ),
      ],
    );
  }
}

class MultiLineInputWidget extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final TextInputType? keyBoardType;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final Function(String)? onFieldSubmitted;
  final bool obscureText;
  final bool multiLine;
  final bool enabled;
  final bool readOnly;
  final String? initialValue;
  final List<TextInputFormatter>? inputFormatters;
  final bool filled;
  final TextAlign textAlign;
  final Color? fillColor;
  final bool hasBorder;

  /// A custom TextFormField to accept user input
  const MultiLineInputWidget({
    super.key,
    this.controller,
    this.hintText,
    this.onChanged,
    this.validator,
    this.onFieldSubmitted,
    this.keyBoardType,
    this.obscureText = false,
    this.multiLine = true,
    this.enabled = true,
    this.readOnly = false,
    this.initialValue,
    this.inputFormatters,
    this.filled = true,
    this.textAlign = TextAlign.start,
    this.fillColor,
    this.hasBorder = true,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      readOnly: readOnly,
      enabled: enabled,
      maxLines: multiLine ? null : 1,
      expands: multiLine ? true : false,
      cursorColor: kTextGray,
      textAlignVertical:
      multiLine ? TextAlignVertical.top : TextAlignVertical.center,
      autocorrect: true,
      textAlign: textAlign,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      textCapitalization: TextCapitalization.sentences,
      keyboardType: keyBoardType,
      obscureText: obscureText,
      controller: controller,
      obscuringCharacter: '*',
      inputFormatters: inputFormatters,
      style: kStylePoppins.copyWith(fontSize: 16.0.sp),
      decoration: InputDecoration(
        fillColor: fillColor ?? kInputFillColor,
        filled: filled,
        isDense: true,
        focusedBorder: hasBorder
            ? OutlineInputBorder(
            borderSide: const BorderSide(color: kBorderColor),
            borderRadius: BorderRadius.circular(12.0))
            : const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent)),
        contentPadding:
        EdgeInsets.symmetric(vertical: 18.0.h, horizontal: 16.0.w),
        hintText: !enabled && initialValue != null ? null : hintText,
        hintStyle: kStylePoppins.copyWith(
          fontWeight: FontWeight.w200,
          fontSize: 14.0.sp,
          height: (20.12 / 14.0).sp,
          color: kLightGray,
        ),
        errorStyle: kStylePoppins.copyWith(
          fontWeight: FontWeight.w300,
          fontSize: 10.0.sp,
          height: 1,
          color: kPrimaryRed,
        ),
        labelStyle: kStylePoppins.copyWith(
          fontWeight: FontWeight.w200,
          fontSize: 14.0.sp,
          height: (22 / 14.0).sp,
        ),
        enabledBorder: hasBorder
            ? OutlineInputBorder(
            borderSide: const BorderSide(color: kBorderColor),
            borderRadius: BorderRadius.circular(12.0))
            : const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent)),
        errorBorder: hasBorder
            ? OutlineInputBorder(
            borderSide: const BorderSide(color: kPrimaryRed),
            borderRadius: BorderRadius.circular(12.0))
            : const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent)),
      ),
      onChanged: (String value) => onChanged?.call(value),
      validator: (String? value) => validator?.call(value),
      onFieldSubmitted: (String value) => onFieldSubmitted?.call(value),
    );
  }
}
