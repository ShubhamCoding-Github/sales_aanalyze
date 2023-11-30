import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sales_aanalyze/utility/custom_colors.dart';
import 'package:sales_aanalyze/utility/custum_button.dart';
import 'package:sales_aanalyze/utility/utils.dart';
import 'package:sales_aanalyze/view/addproduct_screen.dart';
import 'package:sizer/sizer.dart';

class HomeoneScreen extends StatelessWidget {
  const HomeoneScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffF5F5F5),
        appBar: AppBar(
          toolbarHeight: 90,
          automaticallyImplyLeading: false,
          backgroundColor: CustomColors.backgroundcolor,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                'assets/images/Mask Group 6@3x.png',
                height: 5.h,
              ),
              const Icon(
                Icons.notifications_none_rounded,
                size: 24.0,
                color: Colors.white,
              )
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
          child: Column(
            children: [
              buildSizeHeight(25),
              Image.asset(
                'assets/images/box@3x.png',
                height: 5.h,
              ),
              buildSizeHeight(2),
              addTextRagular(
                  text: 'No Product Added',
                  textColor: CustomColors.greyColor,
                  fontSize: 13.0),
              buildSizeHeight(5),
              CustomButton(
                btnWidth: 20.h,
                child: Center(
                    child: addTextSemibold(
                        text: '+ Add Product',
                        textColor: Colors.white,
                        fontSize: 15.0)),
                onPressed: () {
                  Get.to(AddProductScreen(
                    isreadOnly: false,
                    text: false,
                    text2: false,
                  ));
                },
              ),
              Expanded(child: Container()),
              Image.asset('assets/images/Mask Group 8@3x.png'),
            ],
          ),
        ),
      ),
    );
  }
}
