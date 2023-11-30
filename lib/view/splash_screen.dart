import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sales_aanalyze/utility/custom_colors.dart';
import 'package:sales_aanalyze/utility/utils.dart';
import 'package:sales_aanalyze/view/signup_screen.dart';
import 'package:sizer/sizer.dart';
import 'package:action_slider/action_slider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.backgroundcolor,
      body: SafeArea(
          child: Stack(
              children: [
        Align(
          alignment: Alignment.bottomCenter,
          child: Image.asset(
            'assets/images/Group 755@3x.png',
            fit: BoxFit.cover,
          ),
        ),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          buildSizeHeight(5),
          Center(
              child: Image.asset(
            'assets/images/Group 19686@3x.png',
            height: 10.0.h,
          )),
          buildSizeHeight(5),
          Image.asset(
            'assets/images/Mask Group 19@3x.png',
            color: CustomColors.imageColor,
          ),
          buildSizeHeight(3),
          Padding(
            padding: EdgeInsets.only(left: 20.sp, right: 20.sp),
            child: addTextBold(
                text: 'Grow your business\nwith our app',
                textColor: CustomColors.textColor,
                fontSize: 20.sp),
          ),
          buildSizeHeight(3),
          Padding(
            padding: EdgeInsets.only(left: 20.sp, right: 20.sp,bottom: 20.sp,),
            child: addTextLight(
                text: 'Get more customers and good insight\nwith this app',
                textColor: CustomColors.textColor,
                fontSize: 10.sp),
          ),
          buildSizeHeight(3),
          Padding(
            padding: EdgeInsets.only(left: 20.sp, right: 20.sp),
            child: ActionSlider.standard(
              backgroundColor: CustomColors.btanColor,
              width: double.infinity,
              toggleColor: CustomColors.backgroundcolor,
              action: (controller) async {
                Get.to(const SignupScreen());
              },
              direction: TextDirection.ltr,
              icon: const Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
              ),
              child: Padding(
                padding:  EdgeInsets.all(8.sp),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Image.asset(
                    'assets/images/Group 1975@3x.png',
                    height: 2.h,
                  ),
                ),
              ),
              onTap: (controller) {
              },
            ),
          ),
        ]),
      ])),
    );
  }
}
