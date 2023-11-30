import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sales_aanalyze/utility/custum_button.dart';
import 'package:sales_aanalyze/utility/utils.dart';
import 'package:sizer/sizer.dart';
import '../api_manager/api_converter.dart';
import '../utility/custom_colors.dart';
import '../utility/custum_textfield.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: HttpService().getPosts(),
      builder: (BuildContext context, snapshot) {
        return Scaffold(
          body: Padding(
            padding: EdgeInsets.all(20.sp),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: const Icon(Icons.arrow_back)),
                      addTextSemibold(
                          text: 'Profile', textColor: Colors.black, fontSize: 18),
                      CustomButton(
                        btnHeight: 3.2.h,
                        btnWidth: 20.w,
                        child: Center(
                            child: addTextSemibold(
                                text: 'Logout',
                                textColor: Colors.white,
                                fontSize: 12.0)),
                        onPressed: () {},
                      )
                    ],
                  ),
                  buildSizeHeight(5),
                  Center(
                    child: CircleAvatar(
                      minRadius: 50.0,
                      backgroundColor: Colors.blue,
                      child: Image.asset(
                        'assets/images/Group 1977@3x.png',
                        height: 13.h,
                      ),
                    ),
                  ),
                  buildSizeHeight(5),
                  CustomTextField(
                    borderColor: CustomColors.greyColor,
                    lebleText: snapshot.data?.data?.name ?? "",

                  ),
                  buildSizeHeight(3),
                  CustomTextField(
                    borderColor: CustomColors.greyColor,
                    lebleText: snapshot.data?.data?.email ?? "",
                  ),
                  buildSizeHeight(3),
                  CustomTextField(
                    borderColor: CustomColors.greyColor,
                    lebleText: snapshot.data?.data?.phone ?? "",
                  ),
                  buildSizeHeight(3),
                  CustomTextField(
                    borderColor: CustomColors.greyColor,
                    lebleText:snapshot.data?.data?.pwd ?? "" ,
                  ),
                  buildSizeHeight(3),
                  CustomTextField(
                    borderColor: CustomColors.greyColor,
                    lebleText: 'Confirm Password',
                  ),
                  buildSizeHeight(5),
                  CustomButton(
                    btnHeight: 5.h,
                    btnWidth: 50.w,
                    borderColor: const Color(0xff3395FF),
                    color: Colors.transparent,
                    onPressed: () {
                      Get.defaultDialog(
                          cancel: CustomButton(
                            btnWidth: 25.w,
                            btnHeight: 4.h,
                            color: Colors.transparent,
                            borderColor: CustomColors.btanColor,
                            text: 'Cancel',
                            txtColor: Colors.black,
                            onPressed: () {
                              Get.back();
                            },
                          ),
                          confirm: CustomButton(
                            btnWidth: 25.w,
                            btnHeight: 4.h,
                            text: 'Delete',
                            txtColor: Colors.white,
                            onPressed: () {},
                          ),
                          titlePadding: EdgeInsets.zero,
                          contentPadding: const EdgeInsets.all(8.0),
                          titleStyle: const TextStyle(fontSize: 0.0),
                          title: '',
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Align(
                                alignment: Alignment.topRight,
                                child: Icon(Icons.close),
                              ),
                              Image.asset('assets/images/x-button@3x.png',
                                  height: 50),
                              buildSizeHeight(3),
                              Center(
                                  child: addTextBold(
                                      text: 'Are you sure?',
                                      textColor: Colors.black,
                                      fontSize: 20.0)),
                              buildSizeHeight(2),
                              addTextRagular(
                                  text:
                                  'Do you really want to delete account? This process cannot be undone.',
                                  textColor: CustomColors.greyColor,
                                  textAlign: TextAlign.center,
                                  fontSize: 13.0),
                            ],
                          ));
                    },
                    child: Center(
                        child: addTextSemibold(
                            text: 'Delete My Account',
                            textColor: Colors.black,
                            fontSize: 13.0)),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
