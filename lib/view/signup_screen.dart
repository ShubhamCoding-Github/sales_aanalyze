import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sales_aanalyze/utility/custom_colors.dart';
import 'package:sales_aanalyze/utility/custum_button.dart';
import 'package:sales_aanalyze/utility/utils.dart';
import 'package:sales_aanalyze/view/login_screen.dart';
import 'package:sales_aanalyze/view/otp_screen.dart';
import 'package:sizer/sizer.dart';

import '../utility/custum_textfield.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(20.sp),
          child: SingleChildScrollView(
            child: Column(
              children: [
                buildSizeHeight(3),
                Center(
                    child: Image.asset(
                  'assets/images/Group 2087@3x.png',
                  height: 12.h,
                )),
                buildSizeHeight(3),
                addTextSemibold(
                    text: 'Sign Up', textColor: Colors.black, fontSize:15.sp),
                buildSizeHeight(3),
                CustomTextField(
                  textInputType: TextInputType.name,
                  lebleText: 'Full Name',
                ),
                buildSizeHeight(3),
                CustomTextField(
                  textInputType: TextInputType.emailAddress,
                  lebleText: 'Email Address',
                ),
                buildSizeHeight(3),
                CustomTextField(
                 textInputType:  TextInputType.number,
                  lebleText: 'Mobile Number',
                ),
                buildSizeHeight(3),
                CustomTextField(
                  lebleText: 'Password',
                  suffixIcon: Padding(
                    padding: EdgeInsets.only(right: 15.sp),
                    child: Image.asset(
                      'assets/images/eye@3x.png',
                      height: 1.h,
                    ),
                  ),
                ),
                buildSizeHeight(3),
                CustomTextField(
                  lebleText: 'Confirm Password',
                  suffixIcon: Padding(
                    padding: EdgeInsets.only(right: 15.sp),
                    child: Image.asset(
                      'assets/images/eye@3x.png',
                      height: 1.h,
                    ),
                  ),
                ),
                buildSizeHeight(3),
                CustomButton(
                    child: Center(
                        child: addTextSemibold(
                            text: 'Continue',
                            textColor: Colors.white,
                            fontSize: 15.0)),
                    onPressed: () {
                      Get.to(OtpScreen(isFromRegister: true,isFromForgetpassword: true,));
                    }),
                buildSizeHeight(3),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    addTextLight(
                        text: 'Already have an account ?',
                        textColor: Colors.black,
                        fontSize: 15.0),
                    InkWell(
                      onTap: (){
                        Get.to(const LoginScreen());
                      },
                      child: addTextSemibold(
                          text: 'Login',
                          textColor: CustomColors.btanColor,
                          fontSize: 15.0),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
