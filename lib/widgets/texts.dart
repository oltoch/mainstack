import 'package:flutter/material.dart';
import 'package:mainstack/utils/constants.dart';

class MyText extends StatelessWidget {
  const MyText(
    this.data, {
    super.key,
    this.fontSize,
    this.color,
    this.fontWeight,
    this.letterSpacing,
    this.overflow,
    this.maxLines,
    this.height,
    this.textAlign,
    this.textDecoration,
    this.decorationColor,
    this.textDirection,
    this.wordSpacing,
    this.shadowColor,
    this.textBaseline,
    this.fontStyle = FontStyle.poppins,
  });

  final String data;
  final double? fontSize;
  final Color? color;
  final FontWeight? fontWeight;
  final double? letterSpacing;
  final TextOverflow? overflow;
  final int? maxLines;
  final double? height;
  final TextAlign? textAlign;
  final TextDecoration? textDecoration;
  final Color? decorationColor;
  final TextDirection? textDirection;
  final double? wordSpacing;
  final Color? shadowColor;
  final TextBaseline? textBaseline;
  final FontStyle fontStyle;

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      key: key,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      softWrap: true,
      textDirection: textDirection,
      style: fontStyle == FontStyle.poppins
          ? kStylePoppins.copyWith(
              color: color,
              fontSize: fontSize,
              fontWeight: fontWeight,
              letterSpacing: letterSpacing,
              decoration: textDecoration,
              decorationColor: decorationColor,
              height: height,
              wordSpacing: wordSpacing,
              textBaseline: textBaseline,
            )
          : fontStyle == FontStyle.openSans
              ? kStyleOpenSans.copyWith(
                  color: color,
                  fontSize: fontSize,
                  fontWeight: fontWeight,
                  letterSpacing: letterSpacing,
                  decoration: textDecoration,
                  decorationColor: decorationColor,
                  height: height,
                  wordSpacing: wordSpacing,
                  textBaseline: textBaseline,
                )
              : fontStyle == FontStyle.ibmPlexSans
                  ? kStyleIBMPlexSans.copyWith(
                      color: color,
                      fontSize: fontSize,
                      fontWeight: fontWeight,
                      letterSpacing: letterSpacing,
                      decoration: textDecoration,
                      decorationColor: decorationColor,
                      height: height,
                      wordSpacing: wordSpacing,
                      textBaseline: textBaseline,
                    )
                  : fontStyle == FontStyle.sourceSerif
                      ? kStyleSerifSans.copyWith(
                          color: color,
                          fontSize: fontSize,
                          fontWeight: fontWeight,
                          letterSpacing: letterSpacing,
                          decoration: textDecoration,
                          decorationColor: decorationColor,
                          height: height,
                          wordSpacing: wordSpacing,
                          textBaseline: textBaseline,
                        )
                      : fontStyle == FontStyle.bitter
                          ? kStyleBitter.copyWith(
                              color: color,
                              fontSize: fontSize,
                              fontWeight: fontWeight,
                              letterSpacing: letterSpacing,
                              decoration: textDecoration,
                              decorationColor: decorationColor,
                              height: height,
                              wordSpacing: wordSpacing,
                              textBaseline: textBaseline,
                            )
                          : kStylePoppins.copyWith(
                              color: color,
                              fontSize: fontSize,
                              fontWeight: fontWeight,
                              letterSpacing: letterSpacing,
                              decoration: textDecoration,
                              decorationColor: decorationColor,
                              height: height,
                              wordSpacing: wordSpacing,
                              textBaseline: textBaseline,
                            ),
    );
  }
}

enum FontStyle { poppins, openSans, ibmPlexSans, sourceSerif, bitter }
