import 'package:animate_do/animate_do.dart';
import 'package:fana_fitworld/utils/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class DrawerPAge extends StatelessWidget {
  DrawerPAge({required this.name});

  String? name;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Container(
            //   width: 100,
            //   height: 100,
            //   child: Image.asset(
            //     "Assets/Images/logo.png",
            //     fit: BoxFit.cover,
            //   ),
            // ),
            SizedBox(
              height: 40,
            ),
            SlideInLeft(
              from: 100,
              duration: Duration(milliseconds: 500),
              child: Image.asset(
                "Assets/Images/gym.png",
                height: 60,
                width: 180,
                fit: BoxFit.cover,
              ),
            ),
            SlideInLeft(
              from: 100,
              duration: Duration(milliseconds: 500),
              child: GradientText(
                colors: [
                  ksecondarycolor,
                  kprimerycolor,
                ],
                "Fana Fit",
                style: TextStyle(
                  fontFamily: "myfontregular",
                  fontSize: 20,
                ),
              ),
            ),

            SizedBox(
              height: 22,
            ),
            SizedBox(
              height: 22,
            ),
            Divider(
              color: Colors.grey.shade700,
              height: 1,
            ),
            SizedBox(
              height: 60,
            ),
            SlideInLeft(
              from: 100,
              duration: Duration(milliseconds: 700),
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: kprimerycolor, width: 1.5)),
                child: Center(
                  child: Icon(
                    Icons.fastfood_rounded,
                    color: Colors.grey.shade200,
                    size: 60,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            SlideInLeft(
              from: 100,
              duration: Duration(milliseconds: 900),
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: kprimerycolor, width: 1.5)),
                child: Center(
                  child: Icon(
                    Icons.privacy_tip_outlined,
                    size: 60,
                    color: Colors.grey.shade200,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            SlideInLeft(
              from: 100,
              duration: Duration(milliseconds: 1100),
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: kprimerycolor, width: 1.5)),
                child: Icon(
                  Icons.settings,
                  size: 60,
                  color: Colors.grey.shade200,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
