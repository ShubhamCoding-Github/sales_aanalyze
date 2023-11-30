import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sales_aanalyze/utility/custom_colors.dart';
import 'package:sales_aanalyze/utility/utils.dart';
import 'package:sales_aanalyze/view/homeone_screen.dart';
import '../controller/selectindustry_ctrl.dart';

class SelectindustryScreen extends StatefulWidget {
  const SelectindustryScreen({Key? key}) : super(key: key);

  @override
  State<SelectindustryScreen> createState() => _SelectindustryScreenState();
}

class _SelectindustryScreenState extends State<SelectindustryScreen> {
  bool value = false;

  CounterUpdater controller = Get.put(CounterUpdater());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffF5F5F5),
        appBar: AppBar(
          toolbarHeight: 90,
          automaticallyImplyLeading: false,
          backgroundColor: CustomColors.backgroundcolor,
          title: Center(
            child: addTextSemibold(
                text: 'Select Your Industry',
                textColor: Colors.white,
                fontSize: 20.0),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
          child: Column(
            children: [
              buildSizeHeight(2),
              Center(
                  child: addTextSemibold(
                      text: 'Industries',
                      textColor: Colors.black,
                      fontSize: 14.0)),
              buildSizeHeight(3),
              Expanded(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: controller.ProductList.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: (){
                          Get.to(const HomeoneScreen());
                        },
                        child: Card(
                          color: Colors.white,
                          child: ListTile(
                            contentPadding: const EdgeInsets.all(10.0),
                            leading: Image.asset(
                              controller.ProductList[index]['icon'],
                            ),
                            title: addTextSemibold(
                                text: controller.ProductList[index]['title'],
                                textColor: Colors.black,
                                fontSize: 16.0),
                            trailing: Checkbox(
                              side: BorderSide(color: CustomColors.greyColor),
                              fillColor: MaterialStateColor.resolveWith(
                                  (states) => CustomColors.btanColor),
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5))),
                              value: false,
                              onChanged: (bool? value) {
                                // Get.to(HomeoneScreen());
                              },
                            ),
                          ),
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
