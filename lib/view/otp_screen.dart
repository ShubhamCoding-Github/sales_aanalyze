import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:sales_aanalyze/utility/custom_colors.dart';
import 'package:sales_aanalyze/utility/utils.dart';
import 'package:sales_aanalyze/view/login_screen.dart';
import 'package:sales_aanalyze/view/resetpassword_screen.dart';
import 'package:sizer/sizer.dart';

import '../utility/custum_button.dart';

// ignore: must_be_immutable
class OtpScreen extends StatefulWidget {
  bool isFromRegister;
  bool ? isFromForgetpassword;
  OtpScreen({Key? key, required this.isFromRegister , required this.isFromForgetpassword}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  int _counter = 0;
  late Timer _timer;
  bool resendStatus = false;

  @override
  void initState() {
    super.initState();
    // Create a timer that runs every 1 second
    init();
  }

  String getFormattedTimer() {
    return _counter.toString().padLeft(2, '0');
  }

  void init() {
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      setState(() {
        _counter++;
        if (_counter >= 30) {
          _timer.cancel();
          resendStatus = true;
        }
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel(); // Cancel the timer to release resources
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(leading: InkWell(
          onTap: () {
            Get.back();
          },
            child: const Icon(Icons.arrow_back, size: 30.0))),
        body: Padding(
          padding: EdgeInsets.all(40.sp),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildSizeHeight(5),
                Center(
                    child: Image.asset(
                  'assets/images/Group 2087@3x.png',
                  height: 12.h,
                )),
                buildSizeHeight(5),
                addTextSemibold(
                    text: 'Verification', textColor: Colors.black, fontSize: 30.0),
                buildSizeHeight(1),
                widget.isFromRegister == true
                ? addTextRagular(
                    text: '4-digits code sent to your mobile number',
                    textColor: CustomColors.regulartextcolor,
                    fontSize: 11.0)
                : addTextRagular(
                    text: '4-digits code sent to your email',
                    textColor: CustomColors.regulartextcolor,
                    fontSize: 11.0),
                buildSizeHeight(3),
                PinCodeTextField(
                  appContext: context,
                  length: 4,
                  obscureText: false,
                  textStyle: SemiboldTextStyle().copyWith(
                      color: CustomColors.blackcolor,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.normal),
                  animationType: AnimationType.fade,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  pinTheme: PinTheme(
                    selectedFillColor: Colors.transparent,
                    activeFillColor: Colors.transparent,
                    shape: PinCodeFieldShape.underline,
                    activeColor: Colors.transparent,
                    selectedColor: CustomColors.blackcolor,
                    inactiveFillColor: Colors.transparent,
                    inactiveColor: CustomColors.greyColor,
                  ),
                  animationDuration: const Duration(milliseconds: 300),
                  cursorColor: CustomColors.blackcolor,
                  enableActiveFill: true,
                  onCompleted: (v) {},
                  onChanged: (value) {},
                  beforeTextPaste: (text) {
                    return true;
                  },
                ),
                buildSizeWidth(3),
                GestureDetector(
                  onTap: () {
                    if (resendStatus) {
                      resendStatus = false;
                      _counter = 0;
                      init();
                    }
                  },
                  child: Container(
                      height: 30.0,
                      width: double.infinity,
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            resendStatus
                                ? 'assets/images/undo-button@3x.png'
                                : 'assets/images/timer (1)@3x.png',
                            alignment: Alignment.center,
                            height: 2.h,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            resendStatus
                                ? 'Resend OTP'
                                : 'Resend code in 00:${getFormattedTimer()}',
                            style: const TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      )),
                ),
                buildSizeHeight(5),
                CustomButton(
                    child: Center(
                        child: addTextSemibold(
                            text: 'Continue',
                            textColor: Colors.white,
                            fontSize: 15.0)),
                    onPressed: () {
                      if (widget.isFromRegister) {
                        Get.to(const LoginScreen());
                      } else {
                        Get.to(const ResetpasswordScreen());
                      }
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
