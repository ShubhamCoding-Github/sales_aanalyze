import 'package:flutter/material.dart';
class TodayData extends StatefulWidget {
  const TodayData({Key? key}) : super(key: key);

  @override
  State<TodayData> createState() => _TodayDataState();
}

class _TodayDataState extends State<TodayData> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SingleChildScrollView(
            child: DataTable(
              columnSpacing:Checkbox.width,
              // dataRowColor: MaterialStateColor.resolveWith((states) => Colors.blue),
              // Datatable widget that have the property columns and rows.
                columns:  const [
                  // Set the name of the column
                  DataColumn(label: Text('S.No'),),
                  DataColumn(label: Text('Date'),),
                  DataColumn(label: Text('Quantity'),),
                  DataColumn(label: Text('Market Demand'),),
                  DataColumn(label: Text('Cost Price'),),
                  DataColumn(label: Text('Selling Price'),),
                  DataColumn(label: Text('Margin'),),
                  DataColumn(label: Text('Note'),),

                ],
                rows: const [
                  // Set the values to the columns
                  DataRow(cells: [
                    DataCell(Text("1")),
                    DataCell(Text("27-02-2019")),
                    DataCell(Text("30")),
                    DataCell(Text("Low")),
                    DataCell(Text("18")),
                    DataCell(Text("18")),
                    DataCell(Text("18")),
                    DataCell(Text("selling")),
                  ]),
                  DataRow(cells: [
                    DataCell(Text("2")),
                    DataCell(Text("2-02-2019")),
                    DataCell(Text("60")),
                    DataCell(Text("Medium")),
                    DataCell(Text("18")),
                    DataCell(Text("78")),
                    DataCell(Text("54")),
                    DataCell(Text("Anderson")),
                  ]),
                  DataRow(cells: [
                    DataCell(Text("3")),
                    DataCell(Text("22-02-2019")),
                    DataCell(Text("89")),
                    DataCell(Text("Low")),
                    DataCell(Text("18")),
                    DataCell(Text("78")),
                    DataCell(Text("55")),
                    DataCell(Text("Anderson")),
                  ]),
                  DataRow(cells: [
                    DataCell(Text("4")),
                    DataCell(Text("14-02-2019")),
                    DataCell(Text("90")),
                    DataCell(Text("Low")),
                    DataCell(Text("18")),
                    DataCell(Text("98")),
                    DataCell(Text("33")),
                    DataCell(Text("Anderson")),
                  ]),
                  DataRow(cells: [
                    DataCell(Text("5")),
                    DataCell(Text("16-02-2019")),
                    DataCell(Text("45")),
                    DataCell(Text("Low")),
                    DataCell(Text("56")),
                    DataCell(Text("89")),
                    DataCell(Text("76")),
                    DataCell(Text("Anderson")),
                  ]),
                  DataRow(cells: [
                    DataCell(Text("6")),
                    DataCell(Text("18-02-2019")),
                    DataCell(Text("75")),
                    DataCell(Text("High")),
                    DataCell(Text("45")),
                    DataCell(Text("90")),
                    DataCell(Text("54")),
                    DataCell(Text("Anderson")),
                  ]),
                  DataRow(cells: [
                    DataCell(Text("7")),
                    DataCell(Text("27-02-2019")),
                    DataCell(Text("79")),
                    DataCell(Text("High")),
                    DataCell(Text("18")),
                    DataCell(Text("89")),
                    DataCell(Text("76")),
                    DataCell(Text("Anderson")),
                  ]),
                  DataRow(cells: [
                    DataCell(Text("8")),
                    DataCell(Text("24-02-2019")),
                    DataCell(Text("96")),
                    DataCell(Text("Low")),
                    DataCell(Text("18")),
                    DataCell(Text("45")),
                    DataCell(Text("34")),
                    DataCell(Text("son")),
                  ]),
                  DataRow(cells: [
                    DataCell(Text("9")),
                    DataCell(Text("20-02-2019")),
                    DataCell(Text("89")),
                    DataCell(Text("Medium")),
                    DataCell(Text("18")),
                    DataCell(Text("98")),
                    DataCell(Text("12")),
                    DataCell(Text("son")),
                  ]),
                  DataRow(cells: [
                    DataCell(Text("10")),
                    DataCell(Text("21-02-2019")),
                    DataCell(Text("88")),
                    DataCell(Text("Low")),
                    DataCell(Text("18")),
                    DataCell(Text("32")),
                    DataCell(Text("78")),
                    DataCell(Text("son")),
                  ]),
                  DataRow(cells: [
                    DataCell(Text("11")),
                    DataCell(Text("26-02-2019")),
                    DataCell(Text("678")),
                    DataCell(Text("high")),
                    DataCell(Text("18")),
                    DataCell(Text("56")),
                    DataCell(Text("78")),
                    DataCell(Text("son")),
                  ]),
                  DataRow(cells: [
                    DataCell(Text("11")),
                    DataCell(Text("26-02-2019")),
                    DataCell(Text("678")),
                    DataCell(Text("high")),
                    DataCell(Text("18")),
                    DataCell(Text("56")),
                    DataCell(Text("78")),
                    DataCell(Text("son")),
                  ]),
                  DataRow(cells: [
                    DataCell(Text("11")),
                    DataCell(Text("26-02-2019")),
                    DataCell(Text("678")),
                    DataCell(Text("high")),
                    DataCell(Text("18")),
                    DataCell(Text("56")),
                    DataCell(Text("78")),
                    DataCell(Text("son")),
                  ]),
                  DataRow(cells: [
                    DataCell(Text("11")),
                    DataCell(Text("26-02-2019")),
                    DataCell(Text("678")),
                    DataCell(Text("high")),
                    DataCell(Text("18")),
                    DataCell(Text("56")),
                    DataCell(Text("78")),
                    DataCell(Text("son")),
                  ]),
                  DataRow(cells: [
                    DataCell(Text("11")),
                    DataCell(Text("26-02-2019")),
                    DataCell(Text("678")),
                    DataCell(Text("high")),
                    DataCell(Text("18")),
                    DataCell(Text("56")),
                    DataCell(Text("78")),
                    DataCell(Text("son")),
                  ]),
                ]
            ),
          ),
        ),
      ),
    );
  }
}
