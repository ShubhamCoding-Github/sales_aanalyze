import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sales_aanalyze/utility/custum_button.dart';
import 'package:sizer/sizer.dart';
import '../utility/custom_colors.dart';
import '../utility/utils.dart';

class CategorydetailsScreen extends StatefulWidget {
  @override
  State<CategorydetailsScreen> createState() => _CategorydetailsScreenState();
}

class _CategorydetailsScreenState extends State<CategorydetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: const Color(0xffEFEFEF),
      appBar: AppBar(
        toolbarHeight:90 ,
        automaticallyImplyLeading: false,
        backgroundColor: CustomColors.backgroundcolor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
                onTap: () {
                  Get.back();
                },
                child: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                )),
            const Icon(
              Icons.notifications_none_rounded,
              size: 24,
              color: Colors.white,
            )
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding:  EdgeInsets.all(20.sp),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.0),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.shade300,
                        blurRadius: 7.0,
                        spreadRadius: 4.0),
                  ]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 15.0, left: 15.0, right: 15.0),
                    child: addTextSemibold(
                        text: 'Consumer Packaged Goods',
                        textColor: Colors.black,
                        fontSize: 16.0),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 15.0, left: 15.0, right: 15.0),
                    child: addTextRagular(
                        text: 'Today\'s Results',
                        textColor: CustomColors.greyColor,
                        fontSize: 11.0),
                  ),
                  const Padding(
                    padding:
                        EdgeInsets.only(top: 15.0, left: 15.0, right: 15.0),
                    child: Divider(
                      thickness: 1,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 15.0, left: 15.0, right: 15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            addTextSemibold(
                                text: 'CP',
                                textColor: Colors.black,
                                fontSize: 11.0),
                            addTextBold(
                                text: '\$33.00',
                                textColor: Colors.black,
                                fontSize: 15.0),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                        child: VerticalDivider(
                          thickness: 1,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 15.0, left: 15.0, right: 15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            addTextSemibold(
                                text: 'SP',
                                textColor: Colors.black,
                                fontSize: 11.0),
                            addTextBold(
                                text: '\$54.00',
                                textColor: Colors.black,
                                fontSize: 15)
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 50.0,
                        child: VerticalDivider(
                          thickness: 1,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 15.0, left: 15.0, right: 15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            addTextSemibold(
                                text: 'Margin',
                                textColor: Colors.black,
                                fontSize: 11.0),
                            addTextBold(
                                text: '\$55.00',
                                textColor: Colors.black,
                                fontSize: 15.0)
                          ],
                        ),
                      ),
                    ],
                  ),
                  buildSizeHeight(2),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 15.0, left: 15.0, right: 15.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: CustomButton(
                            btnHeight: 4.h,
                            borderColor: CustomColors.greyColor,
                            color: Colors.transparent,
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  addTextSemibold(
                                      text: 'Date Range',
                                      textColor: Colors.black,
                                      fontSize: 12.0),
                                  const Icon(Icons.calendar_month),
                                ],
                              ),
                            ),
                            onPressed: () {},
                          ),
                        ),
                        Checkbox(
                          side: BorderSide(color: CustomColors.greyColor),
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                          value: false,
                          onChanged: (value) {},
                        ),
                        addTextSemibold(
                            text: 'Current Month',
                            textColor: Colors.black,
                            fontSize: 13.0),
                      ],
                    ),
                  ),
                  buildSizeHeight(2),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15.0),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.shade300,
                              blurRadius: 7.0,
                              spreadRadius: 4.0)
                        ]),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 250,
                          child: PieChart(
                            PieChartData(
                                centerSpaceRadius: 4,
                                borderData: FlBorderData(show: false),
                                sectionsSpace: 10,
                                startDegreeOffset: 270,
                                sections: [
                                  PieChartSectionData(
                                      value: 30,
                                      color: CustomColors.piechart2,
                                      radius: 100),
                                  PieChartSectionData(
                                      value: 70,
                                      color: CustomColors.piechart1,
                                      radius: 100),
                                ]),
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 10,
                              width: 10,
                              color: CustomColors.piechart2,
                            ),
                            buildSizeWidth(2),
                            const Text('Sales'),
                            const SizedBox(
                              height: 40,
                              child: VerticalDivider(
                                thickness: 1,
                              ),
                            ),
                            Container(
                              height: 10,
                              width: 10,
                              color: CustomColors.piechart1,
                            ),
                            buildSizeWidth(2),
                            const Text('Profit')
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
