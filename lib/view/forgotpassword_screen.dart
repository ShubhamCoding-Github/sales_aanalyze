import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sales_aanalyze/utility/utils.dart';
import 'package:sizer/sizer.dart';
import '../utility/custum_button.dart';
import '../utility/custum_textfield.dart';
import 'otp_screen.dart';

class ForgetpasswordScreen extends StatelessWidget {
  const ForgetpasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading:
          InkWell(
            onTap: () {
              Get.back();
            },
              child:  const Icon(Icons.arrow_back, size: 30.0))),
        body: Padding(
          padding: EdgeInsets.all(20.sp),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                  child: addTextSemibold(
                      text: 'Forgot Password?',
                      textColor: Colors.black,
                      fontSize: 30.0)),
              buildSizeHeight(5),
              CustomTextField(
                textInputType: TextInputType.emailAddress,
                lebleText: 'Email Address',
              ),
              buildSizeHeight(3),
              CustomButton(
                  child: Center(
                      child: addTextSemibold(
                          text: 'Continue',
                          textColor: Colors.white,
                          fontSize: 15.0)),
                  onPressed: () {
                     Get.to(OtpScreen(isFromRegister: false,isFromForgetpassword: true,));
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
