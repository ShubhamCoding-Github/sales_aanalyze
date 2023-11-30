import 'dart:math';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sales_aanalyze/utility/custum_button.dart';
import 'package:sales_aanalyze/utility/utils.dart';
import 'package:sizer/sizer.dart';
import '../utility/custom_colors.dart';

class DataItem {
  int x;
  double y1;
  double y2;
  double y3;
  DataItem(
      {required this.x, required this.y1, required this.y2, required this.y3});
}

class GraphsScreen extends StatefulWidget {
  const GraphsScreen({Key? key}) : super(key: key);

  @override
  State<GraphsScreen> createState() => _GraphsScreenState();
}

class _GraphsScreenState extends State<GraphsScreen> {
  String? dropdownvalue;

  // List of items in our dropdown menu
  var items = [
    '2017',
    '2018',
    '2019',
  ];
  final List<FlSpot> dummyData1 = List.generate(8, (index) {
    return FlSpot(index.toDouble(), index * Random().nextDouble());
  });

  SideTitles get _bottomTitles => SideTitles(
        showTitles: true,
        getTitlesWidget: (value, meta) {
          String text = '';
          switch (value.toInt()) {
            case 1:
              text = 'Jan';
              break;
            case 2:
              text = 'Fab';
              break;
            case 3:
              text = 'Mar';
              break;
            case 4:
              text = 'Apr';
              break;
            case 5:
              text = 'May';
              break;
            case 6:
              text = 'Jun';
              break;
          }
          return Text(text);
        },
      );
  // This will be used to draw the orange line
  final List<FlSpot> dummyData2 = List.generate(8, (index) {
    return FlSpot(index.toDouble(), index * Random().nextDouble());
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: const Color(0xffEFEFEF),
            appBar: AppBar(
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
                      addTextSemibold(
                          text: 'Analyze Screen',
                          textColor: Colors.white,
                          fontSize: 17.0),
                      const Icon(
                        Icons.notifications_none_rounded,
                        size: 24,
                        color: Colors.white,
                      ),
                    ])),
            body: SingleChildScrollView(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Column(children: [
                buildSizeHeight(3),
                Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50.0),
                          border: Border.all(color: Colors.black)),
                      padding: const EdgeInsets.only(
                        left: 10.0,
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          borderRadius: BorderRadius.circular(10),
                          value: "Select Product",
                          isExpanded: true,
                          items: const [
                            DropdownMenuItem(
                                value: "Select Product",
                                child: Text("Select Product")),
                          ],
                          onChanged: (value) {},
                        ),
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 15.0, left: 15.0, right: 15.0),
                            child: addTextSemibold(
                                text: 'Pie chart',
                                textColor: Colors.black,
                                fontSize: 16.0),
                          ),
                          buildSizeHeight(2),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 15.0, right: 15.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: CustomButton(
                                    btnHeight: 4.h,
                                    borderColor: CustomColors.greyColor,
                                    color: Colors.transparent,
                                    child: Padding(
                                      padding: const EdgeInsets.all(6.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          addTextSemibold(
                                              text: 'Date Range',
                                              textColor: Colors.black,
                                              fontSize: 9.0),
                                          const Icon(Icons.calendar_month,
                                              size: 15.0),
                                        ],
                                      ),
                                    ),
                                    onPressed: () {},
                                  ),
                                ),
                                Checkbox(
                                  side:
                                      BorderSide(color: CustomColors.greyColor),
                                  shape: const RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5))),
                                  value: false,
                                  onChanged: (value) {},
                                ),
                                addTextSemibold(
                                    text: 'Current Month',
                                    textColor: Colors.black,
                                    fontSize: 13),
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
                  ],
                ),
                buildSizeHeight(2),
                Column(
                  children: [
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 15.0, left: 15.0, right: 15.0),
                            child: addTextSemibold(
                                text: 'Time Series Graph',
                                textColor: Colors.black,
                                fontSize: 16.0),
                          ),
                          buildSizeHeight(2),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 15.0, right: 15.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: CustomButton(
                                    btnHeight: 4.h,
                                    borderColor: CustomColors.greyColor,
                                    color: Colors.transparent,
                                    child: Padding(
                                      padding: EdgeInsets.all(6.sp),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          addTextSemibold(
                                              text: 'Date Range',
                                              textColor: Colors.black,
                                              fontSize: 9.0),
                                          const Icon(
                                            Icons.calendar_month,
                                            size: 15.0,
                                          ),
                                        ],
                                      ),
                                    ),
                                    onPressed: () {},
                                  ),
                                ),
                                Checkbox(
                                  side:
                                      BorderSide(color: CustomColors.greyColor),
                                  shape: const RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5))),
                                  value: false,
                                  onChanged: (value) {},
                                ),
                                addTextSemibold(
                                    text: 'Current Month',
                                    textColor: Colors.black,
                                    fontSize: 13),
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
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(top: 10.0, right: 10.0),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 10,
                                          width: 10,
                                          color: const Color(0xff99CCCC),
                                        ),
                                        buildSizeWidth(2),
                                        const Text('Profit'),
                                        buildSizeWidth(5),
                                        Container(
                                          height: 10,
                                          width: 10,
                                          color: const Color(0xffF26722),
                                        ),
                                        buildSizeWidth(2),
                                        const Text('Sales')
                                      ],
                                    ),
                                  ),
                                  buildSizeHeight(4),
                                  SizedBox(
                                    height: 250,
                                    width: Get.width,
                                    child: LineChart(
                                      LineChartData(
                                        titlesData: FlTitlesData(
                                          rightTitles: const AxisTitles(
                                              sideTitles: SideTitles(
                                                  showTitles: false)),
                                          topTitles: const AxisTitles(
                                              sideTitles: SideTitles(
                                                  showTitles: false)),
                                          bottomTitles: AxisTitles(
                                              sideTitles: _bottomTitles),
                                        ),
                                        borderData: FlBorderData(
                                            border: Border(
                                          left: BorderSide(
                                              color: CustomColors.greyColor),
                                          bottom: BorderSide(
                                              color: CustomColors.greyColor),
                                        )),
                                        lineBarsData: [
                                          // The red line
                                          LineChartBarData(
                                            spots: dummyData1,
                                            isCurved: false,
                                            dotData:
                                                const FlDotData(show: false),
                                            barWidth: 5,
                                            color: const Color(0xff99CCCC),
                                          ),
                                          // The orange line
                                          LineChartBarData(
                                            spots: dummyData2,
                                            dotData:
                                                const FlDotData(show: false),
                                            isCurved: false,
                                            barWidth: 5,
                                            color: const Color(0xffF26722),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                buildSizeHeight(2),
                Column(children: [
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 15.0, left: 15.0, right: 15.0),
                          child: addTextSemibold(
                              text: 'Bar Graph Year Wise',
                              textColor: Colors.black,
                              fontSize: 16.0),
                        ),
                        buildSizeHeight(2),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 15.0, right: 15.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: CustomButton(
                                  btnHeight: 4.4.h,
                                  borderColor: CustomColors.greyColor,
                                  color: Colors.transparent,
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton(
                                        hint: Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: addTextRagular(
                                              text: 'Select year',
                                              textColor: CustomColors.greyColor,
                                              fontSize: 9.0),
                                        ),
                                        value: dropdownvalue,
                                        items: items.map((String items) {
                                          return DropdownMenuItem(
                                              value: items,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: addTextRagular(
                                                    text: items,
                                                    textColor:
                                                        CustomColors.greyColor,
                                                    fontSize: 13),
                                              ));
                                        }).toList(),
                                        onChanged: (String? newValue) {
                                          setState(() {
                                            dropdownvalue = newValue!;
                                          });
                                        }),
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
                                  fontSize: 13),
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
                          child: Padding(
                            padding:
                                const EdgeInsets.only(top: 10.0, right: 10.0),
                            child: Column(
                              children: [
                                buildSizeHeight(3),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  height: 250,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.only(
                                            left: 5.0,
                                            right: 5.0,
                                            bottom: 13.0),
                                        width: 30,
                                        height: 250,
                                        // color: Colors.green,
                                        child: const Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            RotatedBox(
                                              quarterTurns:
                                                  3, // Rotate text 270 degrees counter-clockwise (vertical)
                                              child: Text(
                                                "High",
                                                style:
                                                    TextStyle(fontSize: 10.0),
                                              ),
                                            ),
                                            RotatedBox(
                                              quarterTurns:
                                                  3, // Rotate text 270 degrees counter-clockwise (vertical)
                                              child: Text(
                                                "Medium",
                                                style:
                                                    TextStyle(fontSize: 10.0),
                                              ),
                                            ),
                                            RotatedBox(
                                                quarterTurns:
                                                    3, // Rotate text 270 degrees counter-clockwise (vertical)
                                                child: Text(
                                                  "Low",
                                                  style:
                                                      TextStyle(fontSize: 10.0),
                                                ))
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          height: 250,
                                          // color: Colors.red,
                                          child: BarChart(BarChartData(
                                              titlesData: FlTitlesData(
                                                leftTitles: const AxisTitles(
                                                    sideTitles: SideTitles(
                                                        showTitles: false)),
                                                bottomTitles: AxisTitles(
                                                    sideTitles: _bottomTitles),
                                                topTitles: const AxisTitles(
                                                    sideTitles: SideTitles(
                                                        showTitles: false)),
                                                rightTitles: const AxisTitles(
                                                    sideTitles: SideTitles(
                                                        showTitles: false)),
                                              ),
                                              borderData: FlBorderData(
                                                  border: const Border(
                                                top: BorderSide.none,
                                                right: BorderSide.none,
                                                left: BorderSide.none,
                                                bottom: BorderSide(width: 1),
                                              )),
                                              groupsSpace: 10,
                                              gridData: const FlGridData(
                                                drawVerticalLine: false,
                                              ),
                                              barGroups: [
                                                BarChartGroupData(
                                                    x: 1,
                                                    barsSpace: 0.0,
                                                    barRods: [
                                                      BarChartRodData(
                                                          fromY: 0,
                                                          toY: 3,
                                                          width: 10,
                                                          color: Colors.blue,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      0.0)),
                                                      BarChartRodData(
                                                          fromY: 0,
                                                          toY: 5,
                                                          width: 10,
                                                          color: Colors.red,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      0.0)),
                                                      BarChartRodData(
                                                          fromY: 0,
                                                          toY: 4,
                                                          width: 10,
                                                          color: Colors.amber,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      0.0)),
                                                      BarChartRodData(
                                                          fromY: 0,
                                                          toY: 8,
                                                          width: 10,
                                                          color: Colors.green,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      0.0)),
                                                    ]),
                                                BarChartGroupData(
                                                    x: 2,
                                                    barsSpace: 0.0,
                                                    barRods: [
                                                      BarChartRodData(
                                                          fromY: 0,
                                                          toY: 2,
                                                          width: 10,
                                                          color: Colors.blue,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      0.0)),
                                                      BarChartRodData(
                                                          fromY: 0,
                                                          toY: 6,
                                                          width: 10,
                                                          color: Colors.red,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      0.0)),
                                                      BarChartRodData(
                                                          fromY: 0,
                                                          toY: 8,
                                                          width: 10,
                                                          color: Colors.amber,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      0.0)),
                                                      BarChartRodData(
                                                          fromY: 0,
                                                          toY: 5,
                                                          width: 10,
                                                          color: Colors.green,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      0.0)),
                                                    ]),
                                                BarChartGroupData(
                                                    x: 3,
                                                    barsSpace: 0.0,
                                                    barRods: [
                                                      BarChartRodData(
                                                          fromY: 0,
                                                          toY: 4,
                                                          width: 10,
                                                          color: Colors.blue,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      0.0)),
                                                      BarChartRodData(
                                                          fromY: 0,
                                                          toY: 9,
                                                          width: 10,
                                                          color: Colors.red,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      0.0)),
                                                      BarChartRodData(
                                                          fromY: 0,
                                                          toY: 3,
                                                          width: 10,
                                                          color: Colors.amber,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      0.0)),
                                                      BarChartRodData(
                                                          fromY: 0,
                                                          toY: 10,
                                                          width: 10,
                                                          color: Colors.green,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      0.0)),
                                                    ]),
                                                BarChartGroupData(
                                                    x: 4,
                                                    barsSpace: 0.0,
                                                    barRods: [
                                                      BarChartRodData(
                                                          fromY: 0,
                                                          toY: 1,
                                                          width: 10,
                                                          color: Colors.blue,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      0.0)),
                                                      BarChartRodData(
                                                          fromY: 0,
                                                          toY: 6,
                                                          width: 10,
                                                          color: Colors.red,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      0.0)),
                                                      BarChartRodData(
                                                          fromY: 0,
                                                          toY: 8,
                                                          width: 10,
                                                          color: Colors.amber,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      0.0)),
                                                      BarChartRodData(
                                                          fromY: 0,
                                                          toY: 9,
                                                          width: 10,
                                                          color: Colors.green,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      0.0)),
                                                    ]),
                                              ])),
                                        ),
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
                  ),
                  buildSizeHeight(2),
                  Column(
                    children: [
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 15.0, left: 15.0, right: 15.0),
                                child: addTextSemibold(
                                    text: 'Market Demand',
                                    textColor: Colors.black,
                                    fontSize: 16),
                              ),
                              buildSizeHeight(2),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 15.0, right: 15.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: CustomButton(
                                        btnHeight: 5.h,
                                        borderColor: CustomColors.greyColor,
                                        color: Colors.transparent,
                                        child: Padding(
                                          padding: EdgeInsets.all(7.sp),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              addTextSemibold(
                                                  text: 'Jan 1 to Jan 10',
                                                  textColor: Colors.black,
                                                  fontSize: 9.0),
                                              const Icon(
                                                Icons.calendar_month,
                                                size: 16.0,
                                              ),
                                            ],
                                          ),
                                        ),
                                        onPressed: () {},
                                      ),
                                    ),
                                    Checkbox(
                                      side: BorderSide(
                                          color: CustomColors.greyColor),
                                      shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5))),
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
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10.0, right: 10.0),
                                  child: Column(
                                    children: [
                                      buildSizeHeight(4),
                                      Center(
                                          child: SizedBox(
                                        height: 250,
                                        child: Row(
                                          children: [
                                            Container(
                                              padding: const EdgeInsets.only(
                                                  left: 5.0,
                                                  right: 5.0,
                                                  bottom: 20,
                                                  top: 8),
                                              width: 30,
                                              // color: Colors.green,
                                              child: const Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  RotatedBox(
                                                    quarterTurns:
                                                        3, // Rotate text 270 degrees counter-clockwise (vertical)
                                                    child: Text(
                                                      "High",
                                                      style: TextStyle(
                                                          fontSize: 10),
                                                    ),
                                                  ),
                                                  RotatedBox(
                                                    quarterTurns:
                                                        3, // Rotate text 270 degrees counter-clockwise (vertical)
                                                    child: Text(
                                                      "Medium",
                                                      style: TextStyle(
                                                          fontSize: 10),
                                                    ),
                                                  ),
                                                  RotatedBox(
                                                      quarterTurns:
                                                          3, // Rotate text 270 degrees counter-clockwise (vertical)
                                                      child: Text(
                                                        "Low",
                                                        style: TextStyle(
                                                            fontSize: 10),
                                                      ))
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(9.0),
                                                child: LineChart(
                                                  LineChartData(
                                                      gridData:
                                                          const FlGridData(
                                                        show: true,
                                                        drawVerticalLine: false,
                                                        drawHorizontalLine:
                                                            true,
                                                        horizontalInterval: 5.5,
                                                      ),
                                                      titlesData:
                                                          const FlTitlesData(
                                                        show: true,
                                                        leftTitles: AxisTitles(
                                                            sideTitles:
                                                                SideTitles(
                                                                    showTitles:
                                                                        false)),
                                                        rightTitles: AxisTitles(
                                                            sideTitles:
                                                                SideTitles(
                                                                    showTitles:
                                                                        false)),
                                                        bottomTitles:
                                                            AxisTitles(
                                                          sideTitles:
                                                              SideTitles(
                                                            showTitles: true,
                                                          ),
                                                        ),
                                                        topTitles: AxisTitles(
                                                            sideTitles:
                                                                SideTitles(
                                                                    showTitles:
                                                                        false)),
                                                      ),
                                                      borderData: FlBorderData(
                                                          border: const Border(
                                                              left:
                                                                  BorderSide(),
                                                              bottom:
                                                                  BorderSide())),
                                                      lineBarsData: [
                                                        LineChartBarData(
                                                            show: true,
                                                            dotData:
                                                                const FlDotData(),
                                                            color: CustomColors
                                                                .btanColor,
                                                            spots: [
                                                              const FlSpot(
                                                                  0, 1),
                                                              const FlSpot(
                                                                  1, 3),
                                                              const FlSpot(
                                                                  2, 10),
                                                              const FlSpot(
                                                                  3, 7),
                                                              const FlSpot(
                                                                  4, 12),
                                                              const FlSpot(
                                                                  5, 13),
                                                              const FlSpot(
                                                                  6, 17),
                                                              const FlSpot(
                                                                  7, 15),
                                                              const FlSpot(
                                                                  8, 20),
                                                              const FlSpot(
                                                                  9, 16),
                                                              const FlSpot(
                                                                  10, 14),
                                                            ]),
                                                      ]),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )),
                                    ],
                                  ),
                                ),
                              ),
                            ]),
                      )
                    ],
                  ),
                ]),
              ]),
            ))));
  }
}
