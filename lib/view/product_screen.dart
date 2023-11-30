import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sales_aanalyze/controller/product_ctrl.dart';
import 'package:sales_aanalyze/utility/custom_colors.dart';
import 'package:sales_aanalyze/utility/utils.dart';
import 'package:sizer/sizer.dart';

import '../utility/custum_button.dart';
import '../utility/custum_textfield.dart';

class ProductScreen extends StatefulWidget {
  ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  AllProduct controller = Get.put(AllProduct());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: CustomColors.backgroundcolor,
            title: Center(
              child: addTextSemibold(
                  text: 'Product',
                  textColor: Colors.white,
                  fontSize: 20.0),
            ),
          ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 20.sp),
        child: Column(
          children: [
            buildSizeHeight(2),
            Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.ProductScreen.length,
                  itemBuilder: (context, index) {
                    return Column(children: [
                      Row(
                        children: [
                          Image.asset(controller.ProductScreen[index]['icon'],
                              height: 5.h),
                          buildSizeWidth(2),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(controller.ProductScreen[index]['title']),
                            ],
                          ),
                        ],
                      ),
                      const Divider(
                        thickness: 1,
                      ),
                    ]);
                  }),
            ),
              buildSizeHeight(2),
            CustomButton(
                child: Center(
                    child: addTextSemibold(
                        text: 'Add Product',
                        textColor: Colors.white,
                        fontSize: 13.0)),
                onPressed: () {
                  Get.to(_buildExpandableContent());
                }),
          ],
        ),
      ),
    ));
  }
}
_buildExpandableContent() {
  Get.defaultDialog(
    confirm: CustomButton(
      btnWidth: 25.w,
      btnHeight: 4.h,
      child:  Center(child: addTextBold(text: 'save', textColor: Colors.white, fontSize: 12.0)),
        onPressed: (){}),
      titlePadding: EdgeInsets.zero,
      contentPadding: const EdgeInsets.all(8.0),
      titleStyle: const TextStyle(fontSize: 0.0),
      title: '',
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
                visualDensity:
                const VisualDensity(vertical: -4, horizontal: -4),
                padding: EdgeInsets.zero,
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(Icons.close)),
          ),
          CustomTextField(
            fillColor: Colors.transparent,
            textInputType: TextInputType.emailAddress,
            lebleText: 'Product Name',
          ),
          
        ],
      ));
}
