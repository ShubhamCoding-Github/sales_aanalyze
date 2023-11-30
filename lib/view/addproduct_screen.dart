import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sales_aanalyze/utility/custom_colors.dart';
import 'package:sales_aanalyze/utility/utils.dart';
import 'package:sizer/sizer.dart';
import '../utility/custum_button.dart';
import '../utility/custum_textfield.dart';
import 'home_screen.dart';

// ignore: must_be_immutable
class AddProductScreen extends StatefulWidget {
  bool? isreadOnly;
  bool? text;
  bool? text2;
  AddProductScreen(
      {Key? key,
      required this.isreadOnly,
      required this.text,
      required this.text2})
      : super(key: key);

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  DateTime today = DateTime.now();
  String? dropdownvalue;

  // List of items in our dropdown menu
  var items = [
    'Low', 'Medium', 'High',
  ];

  // List of items in our dropdown menu
  String? dropdown2value;
  var items2 =
  ['mango', 'Apple', 'Orange', 'Grapes'];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(20.sp),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: const Icon(
                        Icons.arrow_back,
                        size: 25.0,
                      ),
                    ),
                    buildSizeWidth(15),
                    widget.text2 == false
                        ? addTextSemibold(
                            text: 'Add Product',
                            textColor: Colors.black,
                            fontSize: 18.0)
                        : addTextSemibold(
                            text: 'Add Today\'s data',
                            textColor: Colors.black,
                            fontSize: 18.0),
                  ],
                ),
                buildSizeHeight(5),
                widget.isreadOnly == true
                    ? Container(
                        height: 55.0,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0),
                            border: Border.all(color: CustomColors.greyColor)),
                        padding: const EdgeInsets.only(
                          left: 10.0,
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                              hint: addTextRagular(
                                  text: 'Product Name',
                                  textColor: CustomColors.greyColor,
                                  fontSize: 13.0),
                              value: dropdown2value,
                              items: items2.map((String items2) {
                                return DropdownMenuItem(
                                    value: items2,
                                    child: addTextRagular(
                                        text: items2,
                                        textColor: CustomColors.greyColor,
                                        fontSize: 13.0));
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  dropdown2value = newValue!;
                                });
                              }),
                        ))
                    : CustomTextField(
                        lebleText: 'Product Name',
                      ),
                buildSizeHeight(3),
                CustomTextField(
                  suffixIcon: Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: InkWell(
                        onTap: () {
                          showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1900),
                              lastDate: DateTime.now());
                        },
                        child: const Icon(Icons.calendar_month)),
                  ),
                  textInputType: TextInputType.datetime,
                  lebleText: 'Date',
                ),
                buildSizeHeight(3),
                Container(
                  height: 6.5.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.0),
                      border: Border.all(color: CustomColors.greyColor)),
                  padding: const EdgeInsets.only(
                    left: 10.0,
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                        hint: addTextRagular(
                            text: 'Market Demand',
                            textColor: CustomColors.greyColor,
                            fontSize: 13.0),
                        value: dropdownvalue,
                        items: items.map((String items) {
                          return DropdownMenuItem(
                              value: items,
                              child: addTextRagular(
                                  text: items,
                                  textColor: CustomColors.greyColor,
                                  fontSize: 13.0));
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownvalue = newValue!;
                          });
                        }),
                  ),
                ),
                buildSizeHeight(3),
                CustomTextField(
                  readOnly: widget.isreadOnly,
                  lebleText: 'Cost Price',
                ),
                buildSizeHeight(3),
                CustomTextField(
                  lebleText: 'Selling Price',
                ),
                buildSizeHeight(3),
                CustomTextField(
                  lebleText: 'Quantity',
                ),
                buildSizeHeight(3),
                CustomTextField(
                  lebleText: 'Profit',
                ),
                buildSizeHeight(3),
                CustomTextField(
                  lebleText: 'Note',
                ),
                buildSizeHeight(3),
                CustomButton(
                    child: Center(
                        child: addTextSemibold(
                            text: 'Submit',
                            textColor: Colors.white,
                            fontSize: 15.0)),
                    onPressed: () {
                      Get.defaultDialog(
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
                                    visualDensity: const VisualDensity(
                                        vertical: -4, horizontal: -4),
                                    padding: EdgeInsets.zero,
                                    onPressed: () {
                                      Get.back();
                                    },
                                    icon: const Icon(Icons.close)),
                              ),
                              Image.asset('assets/images/_x32_0_Success@3x.png',
                                  height: 50.0),
                              buildSizeHeight(3),
                              widget.text == false
                                  ? Center(
                                      child: addTextBold(
                                          text: 'Product Added Successfully',
                                          textColor: Colors.black,
                                          fontSize: 15.0))
                                  : addTextBold(
                                      text: 'Data Added Successfully',
                                      textColor: Colors.black,
                                      fontSize: 15.0),
                              buildSizeHeight(2),
                              addTextRagular(
                                  text:
                                      'It is a long established fact that a reader will be distracted by the readable',
                                  textColor: CustomColors.greyColor,
                                  textAlign: TextAlign.center,
                                  fontSize: 13.0),
                            ],
                          )).then((value) {
                        Get.to(const HomeScreen());
                      });
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
