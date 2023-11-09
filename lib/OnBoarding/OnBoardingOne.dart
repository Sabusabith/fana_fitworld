import 'package:flutter/material.dart';

class OnBoardingOne extends StatelessWidget {
  const OnBoardingOne({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SizedBox(
          width: size.width,
          height: size.height,
          child: Stack(children: [
            Positioned.fill(
              child: Container(
                  alignment: Alignment.topCenter,
                  height: 350,
                  width: size.width,
                  child: Image(
                    image: AssetImage("Assets/Images/pic2.png"),
                    fit: BoxFit.cover,
                  )),
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: size.width,
                  height: 320,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(.9)
                        ],
                        stops: [
                          -10,
                          .3
                        ]),
                    color: Colors.grey.shade500,
                  ),
                )),
            Padding(
              padding: const EdgeInsets.only(bottom: 180),
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    "MEET YOUR COACH\,\nSTART YOUR JOURNEY",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        letterSpacing: 2,
                        fontSize: 17,
                        color: Colors.white,
                        fontFamily: "myfontregular"),
                  )),
            )
          ]),
        ),
      ),
    );
  }
}
