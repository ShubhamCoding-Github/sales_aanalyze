import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sales_aanalyze/utility/utils.dart';
import 'package:sizer/sizer.dart';
import 'custom_colors.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  TextEditingController? controller;
  bool? obscureText;
  String? hintText;
  String? lebleText;
  Color? fillColor;
  Color? txtColor;
  Color? borderColor;
  int? maxLine;
  int? maxLength;
  TextInputAction? textInputAction;
  List<TextInputFormatter>? textInputFormatter;
  TextInputType? textInputType;
  String? errorText;
  Widget? suffixIcon;
  double? borderRadius;
  Widget? prefixIcon;
  bool? readOnly;
  EdgeInsets? contentPadding;
  Function(String value)? onChanged;
  TextAlign? textAlign;
  TextStyle? txtStyle;
  String? prefixText;

  Function()? onTap;

  TextCapitalization? textCapitalization;

  String? Function(String? value)? validator;
  CustomTextField(
      {Key? key,
      this.lebleText,
      this.controller,
      this.obscureText,
      this.hintText,
      this.textInputAction,
      this.textInputType,
      this.textInputFormatter,
      this.suffixIcon,
      this.prefixIcon,
      this.errorText,
      this.borderRadius,
      this.fillColor,
      this.txtColor,
      this.onChanged,
      this.maxLine,
      this.borderColor,
      this.maxLength,
      this.contentPadding,
      this.readOnly,
      this.txtStyle,
      this.textAlign,
      this.prefixText,
      this.onTap,
      this.textCapitalization,
      this.validator})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText ?? false,
      obscuringCharacter: "⁕",
      onChanged: onChanged,
      textInputAction: textInputAction,
      keyboardType: textInputType,
      textCapitalization: textCapitalization ?? TextCapitalization.none,
      maxLines: maxLine ?? 1,
      textAlign: textAlign ?? TextAlign.start,
      maxLength: maxLength,
      readOnly: readOnly ?? false,
      onTap: onTap,
      autocorrect: false,
      inputFormatters: textInputFormatter,
      validator: validator,
      style: txtStyle ??
          SemiboldTextStyle().copyWith(
              color: txtColor ?? CustomColors.blackcolor, fontSize: 17.sp),
      decoration: InputDecoration(
        contentPadding: contentPadding ??
            EdgeInsets.only(
                top: 10.sp, bottom: 10.sp, left: 13.sp, right: 13.sp),
        isDense: true,
        border: OutlineInputBorder(
            borderSide: BorderSide(
                color: borderColor ?? CustomColors.TextfieldborderColor)),
        hintText: hintText,
        errorText: errorText,
        counterStyle: const TextStyle(fontSize: 0.0),
        suffixIconConstraints: const BoxConstraints(maxHeight: 45),
        prefixIconConstraints: const BoxConstraints(maxHeight: 45),
        prefixText: prefixText,
        hintStyle: SemiboldTextStyle()
            .copyWith(color: CustomColors.greyColor, fontSize: 17.sp),
        labelText: lebleText,
        labelStyle: TextStyle(
            color: txtColor ?? CustomColors.greyColor, fontSize: 13.sp),
        filled: true,
        suffixIcon: suffixIcon,
        prefixStyle: SemiboldTextStyle()
            .copyWith(color: CustomColors.greyColor, fontSize: 15.sp),
        prefixIcon: prefixIcon,
        errorMaxLines: 3,
        fillColor: fillColor ?? Colors.white,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: borderColor ?? CustomColors.TextfieldborderColor,
              width: 1.0),
          borderRadius: BorderRadius.circular(borderRadius ?? 18.0),
        ),
        enabledBorder: OutlineInputBorder(
          // borderSide: BorderSide.none,
          borderSide: BorderSide(
              color: borderColor ?? CustomColors.greyColor, width: 1.0),
          borderRadius: BorderRadius.circular(borderRadius ?? 18.0),
        ),
        errorBorder: OutlineInputBorder(
          // borderSide: BorderSide.none,
          borderSide:
              BorderSide(color: CustomColors.TextfieldborderColor, width: 1.0),
          borderRadius: BorderRadius.circular(borderRadius ?? 18.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: borderColor ?? Colors.red, width: 1.0),
          // borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(borderRadius ?? 18.0),
        ),
      ),
    );
  }
}
