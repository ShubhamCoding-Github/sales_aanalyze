import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sales_aanalyze/utility/utils.dart';
import 'package:sales_aanalyze/view/login_screen.dart';
import 'package:sizer/sizer.dart';

import '../utility/custum_button.dart';
import '../utility/custum_textfield.dart';

class ResetpasswordScreen extends StatelessWidget {
  const ResetpasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back, size: 30.0),
      ),
      body: Padding(
        padding:   EdgeInsets.symmetric(horizontal: 20.sp),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            addTextSemibold(
                text: ' Reset Password', textColor: Colors.black, fontSize: 30.0),
            buildSizeHeight(3),
            CustomTextField(
              lebleText: 'Password',
            ),
            buildSizeHeight(3),
            CustomTextField(
              lebleText: 'Confirm Password',
            ),
            buildSizeHeight(5),
            CustomButton(
                child: Center(
                    child: addTextSemibold(
                        text: 'Submit', textColor: Colors.white, fontSize: 15.0)),
                onPressed: () {
                   Get.to(const LoginScreen());
                }),
          ],
        ),
      ),
    );
  }
}
