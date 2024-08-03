import 'package:fana_fitworld/Home/Home.dart';
import 'package:fana_fitworld/Login/Login.dart';
import 'package:fana_fitworld/OnBoarding/OnBoarding.dart';
import 'package:fana_fitworld/OnBoarding/OnBoardingThree.dart';
import 'package:fana_fitworld/OnBoarding/OnBoardingTwo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../OnBoarding/OnBoardingOne.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    statusCheck();
  }

  statusCheck() async {
    try {
      if (FirebaseAuth.instance.currentUser != null) {
        Future.delayed(const Duration(seconds: 3), () {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => Home(),
              ),
              (route) => false);
        });
      } else {
        Future.delayed(const Duration(seconds: 3), () {
          Get.to(OnBording());
        });
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Center(
          child: Container(
            width: 300,
            height: 300,
            child: Center(
              child: Image(
                image: AssetImage("Assets/Images/logo.png",),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
