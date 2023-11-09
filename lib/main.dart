import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'Login/InternetCheck.dart';
import 'NoInternet/NoConnection.dart';
import 'Splash/Splash.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool? network;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkConnection();
  }

  checkConnection() async {
    network = await internetCheck();
    setState(() {});
    if (network!) {
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("No internet connection!")));
      Future.delayed(Duration(seconds: 1))
          .then((value) => Get.to(NoConnection()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splash(),
    );
  }
}
