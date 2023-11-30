import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sales_aanalyze/controller/viewdata_ctrl.dart';
import 'package:sales_aanalyze/utility/utils.dart';
import 'package:sales_aanalyze/view/today_data.dart';
import 'package:sizer/sizer.dart';

import '../utility/custom_colors.dart';

class ViewdataScreen extends StatefulWidget {
  const ViewdataScreen({Key? key}) : super(key: key);

  @override
  State<ViewdataScreen> createState() => _ViewdataScreenState();
}

class _ViewdataScreenState extends State<ViewdataScreen> {
  ProductList controller = Get.put(ProductList());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: CustomColors.backgroundcolor,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    size: 25,
                  )),
              buildSizeWidth(25),
              addTextSemibold(
                  text: 'Product Data', textColor: Colors.white, fontSize: 20.0)
            ],
          )),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 20.sp),
        child: SingleChildScrollView(
          child: Column(
            children: [
              buildSizeHeight(2),
              InkWell(
                onTap: () {
                  Get.to(const TodayData());
                },
                child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: controller.ViewdataScreen.length,
                    itemBuilder: (context, index) {
                      return Column(children: [
                        Row(
                          children: [
                            Image.asset(
                                controller.ViewdataScreen[index]['icon'],
                                height: 5.h),
                            buildSizeWidth(2),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(controller.ViewdataScreen[index]['title']),
                                Text(controller.ViewdataScreen[index]
                                    ['subtext']),
                              ],
                            ),
                          ],
                        ),
                        const Divider(
                          thickness: 1,
                        ),
                      ]);
                    }),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
