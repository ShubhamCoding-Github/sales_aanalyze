import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sales_aanalyze/utility/custom_colors.dart';
import 'package:sales_aanalyze/view/selectindustry_screen.dart';
import 'package:sales_aanalyze/view/signup_screen.dart';
import 'package:sizer/sizer.dart';
import '../utility/custum_button.dart';
import '../utility/custum_textfield.dart';
import '../utility/utils.dart';
import 'forgotpassword_screen.dart';

class LoginScreen extends StatefulWidget {

  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _checkbox = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(20.sp),
          child: SingleChildScrollView(
            child: Column(
              children: [
                buildSizeHeight(10),
                Center(
                    child: Image.asset(
                  'assets/images/Group 2087@3x.png',
                  height: 12.h,
                )),
                buildSizeHeight(3),
                addTextSemibold(
                    text: 'Login', textColor: Colors.black, fontSize: 30.0),
                buildSizeHeight(5),
                CustomTextField(
                  lebleText: 'Email Address/Mobile Number',
                ),
                buildSizeHeight(3),
                CustomTextField(
                  lebleText: 'Password',
                ),
                Row(
                  children: [
                    Checkbox(
                     activeColor: CustomColors.btanColor,
                      side: const BorderSide(color: Color(0xff0F1511)),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      value: _checkbox,
                      onChanged: (value) {
                        setState(() {
                          _checkbox = !_checkbox;
                        });
                      },
                    ),
                    addTextRagular(
                        text: 'Remember me',
                        textColor: Colors.black,
                        fontSize: 13.0),
                  ],
                ),
                CustomButton(
                    child: Center(
                        child: addTextSemibold(
                            text: 'Login',
                            textColor: Colors.white,
                            fontSize: 15.0)),
                    onPressed: () {
                       Get.to(const SelectindustryScreen());
                    }),
                buildSizeHeight(3),
                InkWell(
                  onTap: () {
                    Get.to(const ForgetpasswordScreen());
                  },
                  child: addTextSemibold(
                      text: 'Forgot password?',
                      textColor: Colors.black,
                      fontSize: 13.0),
                ),
                buildSizeHeight(5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    addTextRagular(
                        text: 'Don\'t have an account?',
                        textColor: Colors.black,
                        fontSize: 15.0),
                    InkWell(
                      onTap: (){
                        Get.to(const SignupScreen());
                      },
                      child: addTextSemibold(
                          text: 'Sign Up',
                          textColor: CustomColors.btanColor,
                          fontSize: 15.0),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
