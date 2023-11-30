import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sales_aanalyze/utility/custom_colors.dart';
import 'package:sales_aanalyze/utility/custum_button.dart';
import 'package:sales_aanalyze/utility/utils.dart';
import 'package:sales_aanalyze/view/viewdata_screen.dart';
import 'package:sales_aanalyze/view/addproduct_screen.dart';
import 'package:sales_aanalyze/view/graphs_screen.dart';
import 'package:sales_aanalyze/view/product_screen.dart';
import 'package:sales_aanalyze/view/profile_screen.dart';
import 'package:sizer/sizer.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  String? dropdownvalue;
  bool isTap = false;
  bool Tap = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(20.sp),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    maxRadius: 30,
                    backgroundColor: Colors.blue,
                    child: InkWell(
                      onTap: () {
                        Get.to(ProfileScreen());
                      },
                      child: Image.asset(
                        'assets/images/Group 1977@3x.png',
                        height: 20.h,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(top: 10.sp, left: 5.sp),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          addTextSemibold(
                              text: 'Yash Chopra',
                              textColor: Colors.black,
                              fontSize: 18.0),
                          addTextRagular(
                              text: 'April 21, 2023',
                              textColor: CustomColors.greyColor,
                              fontSize: 12.0),
                        ],
                      ),
                    ),
                  ),
                  Align(
                      alignment: Alignment.topRight,
                      child: InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Image.asset(
                          'assets/images/error@3x.png',
                          height: 3.h,
                        ),
                      )),
                ],
              ),
              buildSizeHeight(3),
              const Divider(
                thickness: 1,
              ),
              buildSizeHeight(5),
              InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: drawerRow('Home', 'assets/images/home@3x.png', false)),
              buildSizeHeight(2),
              InkWell(
                  onTap: () {
                    Get.to(ProductScreen());
                  },
                  child:
                      drawerRow('Product', 'assets/images/home@3x.png', false)),
              buildSizeHeight(2),
              GestureDetector(
                onTap: () {
                  Tap = !Tap;
                  setState(() {});
                },
                child:
                    drawerRow('Data', 'assets/images/block-user@3x.png', true),
              ),
              if (Tap) _buildExpandableContent2(),
              buildSizeHeight(2),
              GestureDetector(
                onTap: () {
                  isTap = !isTap;
                  setState(() {});
                },
                child: drawerRow(
                    'Bulk Import', 'assets/images/g3591@3x.png', true),
              ),
              if (isTap) _buildExpandableContent(),
              buildSizeHeight(2),
              InkWell(
                  onTap: () {
                    Get.to(GraphsScreen());
                  },
                  child: drawerRow(
                      'Analysis', 'assets/images/Layer 22@3x.png', false)),
              buildSizeHeight(2),
              drawerRow(
                  'Delete Account', 'assets/images/block-user@3x.png', false),
              buildSizeHeight(2),
              InkWell(
                onTap: () {
                 Get.to(_buildExpandableContent3()) ;
                },
                child: drawerRow(
                    'Support', 'assets/images/block-user@3x.png', false),
              ),
              buildSizeHeight(2),
              drawerRow('Logout', 'assets/images/logout@3x.png', false),
            ],
          ),
        ),
      ),
    );
  }

  Widget drawerRow(text, image, bool showIcon) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Image.asset(
              image,
              height: 20,
            ),
            buildSizeWidth(2),
            addTextSemibold(text: text, textColor: Colors.black, fontSize: 14),
          ],
        ),
        if (showIcon == true) const Icon(Icons.keyboard_arrow_down),
      ],
    );
  }

  _buildExpandableContent() {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Column(
        children: [
          buildSizeHeight(2),
          Row(
            children: [
              const Icon(Icons.arrow_forward),
              addTextRagular(
                  text: 'Upload', textColor: Colors.black, fontSize: 13),
            ],
          ),
          buildSizeHeight(1),
          Row(
            children: [
              buildSizeHeight(3),
              const Icon(Icons.arrow_forward),
              addTextRagular(
                  text: 'Download Sample Excel',
                  textColor: Colors.black,
                  fontSize: 13),
            ],
          ),
          const Divider(
            thickness: 1,
          ),
        ],
      ),
    );
  }

  _buildExpandableContent2() {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 20.sp,vertical: 20.sp),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              Get.to((const ViewdataScreen()));
            },
            child: addTextRagular(
                text: 'View Data', textColor: Colors.black, fontSize: 13.0),
          ),
          buildSizeHeight(2),
          InkWell(
            onTap: () {
              Get.to((AddProductScreen(
                isreadOnly: true,
                text: true,
                text2: true,
              )));
            },
            child: addTextRagular(
                text: 'Add today\'s data',
                textColor: Colors.black,
                fontSize: 13.0),
          ),
          const Divider(
            thickness: 1,
          ),
        ],
      ),
    );
  }
}

_buildExpandableContent3() {
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
                visualDensity:
                    const VisualDensity(vertical: -4, horizontal: -4),
                padding: EdgeInsets.zero,
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(Icons.close)),
          ),
          addTextBold(text: 'Counter', textColor:Colors.black, fontSize:15.0),
         const Divider(
           thickness: 1,
         ),
          InkWell(
            onTap: (){
              Get.to(_buildExpandableContent5());
            },
              child: addTextBold(text: 'Contact Support', textColor:Colors.black, fontSize:15.0)),
          const Divider(
            thickness: 1,
          ),
          Center(
              child: InkWell(
                onTap: () {
                  Get.to(_buildExpandableContent4());
                },
                child: addTextBold(
                    text: 'How to use App',
                    textColor: Colors.black,
                    fontSize: 15.0),
              )),
        ],
      ));
}
_buildExpandableContent4() {
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
                visualDensity:
                const VisualDensity(vertical: -4, horizontal: -4),
                padding: EdgeInsets.zero,
                onPressed: () {
                  Get.back();
                },
                icon: Icon(Icons.close)),
          ),
          CustomButton(
            child:Center(child: addTextBold(text: 'Youtube.com', textColor: Colors.white, fontSize:15.0)), onPressed: () {  },

          )
        ],
      ));
}
_buildExpandableContent5() {
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
                visualDensity:
                const VisualDensity(vertical: -4, horizontal: -4),
                padding: EdgeInsets.zero,
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(Icons.close)),
          ),
          CustomButton(
            child:Center(child: addTextBold(text: 'Email.@gmail.com', textColor: Colors.white, fontSize:15)), onPressed: () {  },

          ),
        ],
      ));
}