import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sales_aanalyze/utility/utils.dart';
import 'custom_colors.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  Color? color;
  Color? txtColor;
  Function() onPressed;
  String? text;
  double? btnWidth;
  double? btnHeight;
  double? txtSize;
  TextStyle? textStyle;
  Widget? child;
  Color? borderColor;

  CustomButton(
      {Key? key,
      this.color,
      this.text,
      this.txtColor,
      required this.onPressed,
      this.btnWidth,
      this.txtSize,
      this.btnHeight,
      this.textStyle,
      this.borderColor,
      this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: btnHeight ?? 45.0,
        width: btnWidth ?? Get.width,
        decoration: BoxDecoration(
          color: color ?? CustomColors.btanColor,
          border:
              Border.all(color: borderColor ?? Colors.transparent, width: 1),
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: child ??
            Center(
              // child: addTextBold(text: text ?? "", textColor: txtColor ?? CustomColors.whiteColor, fontSize: txtSize ?? 17.5),
              child: Text(
                text ?? "",
                style: textStyle ??
                    opensansTextStyle().copyWith(
                        color: txtColor ?? CustomColors.textColor,
                        fontSize: txtSize ?? 17.5,
                        height: 1.2),
              ),
            ),
      ),
    );
  }
}
