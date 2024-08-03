import 'package:animate_do/animate_do.dart';
import 'package:fana_fitworld/Gender/Gender.dart';
import 'package:fana_fitworld/Home/Home.dart';
import 'package:fana_fitworld/Login/Login.dart';
import 'package:fana_fitworld/OnBoarding/OnBoardingOne.dart';
import 'package:fana_fitworld/OnBoarding/OnBoardingThree.dart';
import 'package:fana_fitworld/OnBoarding/OnBoardingTwo.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBording extends StatefulWidget {
  @override
  State<OnBording> createState() => _OnBordingState();
}

class _OnBordingState extends State<OnBording> {
  PageController _controller = PageController();
  bool lastpage = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Stack(children: [
          PageView(
            onPageChanged: (index) {
              setState(() {
                lastpage = (index == 2);
              });
            },
            controller: _controller,
            children: [OnBoardingOne(), OnBoardingTwo(), OnBoardingThree()],
          ),
          SlideInUp(from: 100,delay: Duration(milliseconds: 700),
            child: Container(
              alignment: Alignment(0, 0.8),
              child: SmoothPageIndicator(
                controller: _controller,
                count: 3,
                effect: WormEffect(
                    dotColor: Colors.grey.shade600,
                    activeDotColor: Color(0xffD0FD3E),
                    dotHeight: 5,
                    dotWidth: 25),
              ),
            ),
          ),
          lastpage
              ? Container(
                  alignment: Alignment(0, .7),
                  child: ElevatedButton(
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        )),
                        backgroundColor:
                            MaterialStatePropertyAll(Color(0xffD0FD3E))),
                    onPressed: () {
                      Get.to(Login());
                    },
                    child: Text(
                      "Start Now",
                      style: TextStyle(
                          color: Colors.black, fontFamily: "myfontregular"),
                    ),
                  ))
              : SizedBox()
        ]),
      ),
    );
  }
}
