import 'package:flutter/cupertino.dart';
import 'package:sizer/sizer.dart';

SizedBox buildSizeHeight(double height) {
  return SizedBox(
    height: height.h,
  );
}

SizedBox buildSizeWidth(double width) {
  return SizedBox(
    width: width.w,
  );
}

Text addTextBold(
    { required String text,
    required Color textColor,
    required double fontSize,
    TextAlign? textAlign,
    double? height}) {
  return Text(
    text,
    style: opensansTextStyle().copyWith(
      color: textColor,
      height: height ?? 1.2,
      fontSize: fontSize.sp,
    ),
    textAlign: textAlign,
  );
}

TextStyle opensansTextStyle() {
  return const TextStyle(fontFamily: 'OpenSans Bold');
}

Text addTextLight(
    {required String text,
    required Color textColor,
    required double fontSize,
    TextAlign? textAlign,
    double? height}) {
  return Text(
    text,
    style: openlightTextStyle().copyWith(
      color: textColor,
      height: height ?? 1.2,
      fontSize: fontSize.sp,
    ),
    textAlign: textAlign,
  );
}

TextStyle openlightTextStyle() {
  return const TextStyle(fontFamily: 'OpenSans Light');
}

Text addTextSemibold(
    {required String text,
    required Color textColor,
    required double fontSize,
    TextAlign? textAlign,
    double? height}) {
  return Text(
    text,
    style: SemiboldTextStyle().copyWith(
      color: textColor,
      height: height ?? 1.2,
      fontSize: fontSize.sp,
    ),
    textAlign: textAlign,
  );
}

TextStyle SemiboldTextStyle() {
  return const TextStyle(fontFamily: 'Semibold');
}

Text addTextRagular(
    {required String text,
    required Color textColor,
    required double fontSize,
    TextAlign? textAlign,
    double? height}) {
  return Text(
    text,
    style: RagularTextStyle().copyWith(
      color: textColor,
      height: height ?? 1.2,
      fontSize: fontSize.sp,
    ),
    textAlign: textAlign,
  );
}

TextStyle RagularTextStyle() {
  return const TextStyle(fontFamily: 'OpenSans Light');
}
