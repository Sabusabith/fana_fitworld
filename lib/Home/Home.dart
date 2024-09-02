import 'package:fana_fitworld/Home/Advanced/Advanced.dart';
import 'package:fana_fitworld/Home/Beginer/Beginer.dart';
import 'package:fana_fitworld/Home/DrawerPage/DrawerPAge.dart';
import 'package:fana_fitworld/Home/Intermediet/Intermediet.dart';
import 'package:fana_fitworld/screens/fit/fit_home.dart';
import 'package:fana_fitworld/utils/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import '../controller/home_controller.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.put(HomeController());
    Size size = MediaQuery.of(context).size;

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        drawer: Drawer(
          shape: Border.all(),
          width: size.width / 2.1,
          backgroundColor: Colors.transparent.withOpacity(.9),
          child: Obx(() => DrawerPAge(
            name: homeController.name.value,
          )),
        ),
        appBar: AppBar(
          actions: [
            GestureDetector(onTap: () {
              Get.to(FitHome());
            },child: Icon(Icons.alarm_add,color: kprimerycolor,size: 26,)),
            
            SizedBox(width: 25,)
          ],
          iconTheme: IconThemeData(color: kprimerycolor),
          centerTitle: true,
          title: TweenAnimationBuilder(
            tween: Tween<double>(begin: 0, end: 1),
            duration: Duration(seconds: 2),
            curve: Curves.easeInOut,

            builder: (context, double scale, child) {
              return Transform.scale(
                scale: scale,
                child: GradientText(
                  colors: [
                    ksecondarycolor,
                    kprimerycolor,
                
                  ],
                  "Fana Fit",
                  style: TextStyle(
                  
                 
                    fontFamily: "myfontregular",
                    fontSize: 27,
                  ),
                ),
              );
            },
          ),
          leadingWidth: 75,
          toolbarHeight: 100,
          backgroundColor: Colors.black,
          bottom: TabBar(
            dividerColor: Colors.transparent,
            unselectedLabelColor: Colors.grey.shade400,
            indicatorSize: TabBarIndicatorSize.label,
            labelColor: Colors.black,
            indicator: BoxDecoration(
              gradient: LinearGradient(colors: [
                ksecondarycolor,
                kprimerycolor
              ],),
              borderRadius: BorderRadius.circular(50),
              color: kprimerycolor,
            ),
            tabs: [
              Tab(
                height: 35,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(color: kprimerycolor, width: 1,),
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text("Beginner"),
                  ),
                ),
              ),
              Tab(
                height: 35,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(color:kprimerycolor, width: 1),
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text("Medium"),
                  ),
                ),
              ),
              Tab(
                height: 35,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(color: kprimerycolor, width: 1),
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text("Advance"),
                  ),
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.black,
        body: SafeArea(
          child: SizedBox(
            width: size.width,
            height: size.height,
            child: TabBarView(
              children: [
                Beginer(),
                InterMediet(),
                Advanced(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
