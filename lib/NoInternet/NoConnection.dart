import 'package:fana_fitworld/Home/Home.dart';
import 'package:fana_fitworld/Login/Login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

import '../Login/InternetCheck.dart';
import '../OnBoarding/OnBoarding.dart';

class NoConnection extends StatefulWidget {
  const NoConnection({super.key});

  @override
  State<NoConnection> createState() => _NoConnectionState();
}

class _NoConnectionState extends State<NoConnection> {
  bool? network;
  checkConnection() async {
    network = await internetCheck();
    setState(() {});
    if (network!) {
      if (FirebaseAuth.instance.currentUser != null) {
        Future.delayed(const Duration(seconds: 0), () {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => Home(),
              ),
              (route) => false);
        });
      } else {
        Future.delayed(const Duration(seconds: 0), () {
          Get.to(Login());
        });
      }
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("No internet connection!")));
      Future.delayed(Duration(seconds: 1))
          .then((value) => Get.to(NoConnection()));
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                checkConnection();
              },
              child: Icon(
                Icons.refresh,
                color: Colors.grey.shade300,
                size: 42,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "No internet connection",
              style: TextStyle(color: Colors.grey.shade400, fontSize: 18),
            )
          ],
        ),
      ),
    );
  }
}
