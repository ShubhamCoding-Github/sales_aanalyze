import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sales_aanalyze/utility/custom_colors.dart';
import 'package:sales_aanalyze/utility/utils.dart';
import 'package:sales_aanalyze/view/categorydetails_screen.dart';
import 'package:sizer/sizer.dart';
import 'menu_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {

  late TabController controller;
  @override
  void initState() {
    controller = TabController(vsync: this, length: 2);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: const Color(0xffEFEFEF),
      appBar:
      AppBar(
        toolbarHeight: 90,
        automaticallyImplyLeading: false,
        backgroundColor: CustomColors.backgroundcolor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: (){
                Get.to(const MenuScreen());
              },
              child: Image.asset(
                'assets/images/Mask Group 6@3x.png',
                height: 40,
              ),
            ),
            const Icon(
              Icons.notifications_none_rounded,
              size: 24,
              color: Colors.white,
            ),
          ],
        ),
      ),
      body: FutureBuilder(
        builder: (context,snapshot) {
          return Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    addTextSemibold(
                        text: 'Home', textColor: Colors.black, fontSize: 15.0),
                    const Spacer(),
                    Image.asset(
                      'assets/images/sort (1)@3x.png',
                      height: 18.0,
                    ),
                    buildSizeWidth(2),
                    const Icon(Icons.help_outline)
                  ],
                ),
                buildSizeHeight(3),
                Center(child: buildTabBar()),
                buildSizeHeight(3),
                Expanded(
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return InkWell(
                      onTap: (){
                        Get.to(CategorydetailsScreen());
                      },
                          child: Card(
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  addTextSemibold(
                                      text: 'Consumer Packaged Goods',
                                      textColor: Colors.black,
                                      fontSize: 16.0),
                                  addTextRagular(
                                      text: 'Today\'s Results',
                                      textColor: CustomColors.greyColor,
                                      fontSize: 11.0),
                                  const Divider(
                                    thickness: 1,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          addTextSemibold(
                                              text: 'CP',
                                              textColor: Colors.black,
                                              fontSize: 11),
                                          addTextBold(
                                              text: '\$33.00',
                                              textColor: Colors.black,
                                              fontSize: 15.0)
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 50,
                                        child: VerticalDivider(
                                          thickness: 1,
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          addTextSemibold(
                                              text: 'SP',
                                              textColor: Colors.black,
                                              fontSize: 11.0),
                                          addTextBold(
                                              text: '\$54.00',
                                              textColor: Colors.black,
                                              fontSize: 15.0)
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 50,
                                        child: VerticalDivider(
                                          thickness: 1,
                                        ),
                                      ),
                                      Column(
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
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                ),
                Image.asset('assets/images/Mask Group 8@3x.png'),
              ],
            ),
          );
        }
      ),
    ));
  }

  Widget buildTabBar() {
    return Container(
      height: 25.sp,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          border: Border.all(
            color: const Color(0xff3395FF),
          ),
          color: Colors.white,
          borderRadius: BorderRadius.circular(30.sp)),
      child: TabBar(
        dividerColor: Colors.transparent,
        controller: controller,
        labelPadding: EdgeInsets.zero,
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(30.sp),
          color: CustomColors.btanColor,
        ),
        onTap: (index) {
        },
        labelColor: Colors.white,
        labelStyle: TextStyle(
            color: Colors.white, fontSize: 13.sp, fontWeight: FontWeight.w500),
        unselectedLabelStyle: TextStyle(
            color: Colors.white, fontSize: 13.sp, fontWeight: FontWeight.w500),
        unselectedLabelColor: Colors.black,
        tabs: const [
          SizedBox(
            width: double.infinity,
            child: Tab(
              text: 'Latest Data',
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Tab(
              text: 'Previous Data',
            ),
          ),
        ],
      ),
    );
  }
}
