import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Login/InternetCheck.dart';
import 'NoInternet/NoConnection.dart';
import 'Splash/Splash.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'controller/networkController.dart';
import 'package:animate_do/animate_do.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (Platform.isIOS) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDdzFhuu0nEJ7GWN9Yph9ajkLNhs7X8CNs",
            appId: "1:131023730286:ios:9a37febf49e49b1abe987f",
            messagingSenderId: "131023730286",
            projectId: "fanafitworld"));
  } else {
    await Firebase.initializeApp();
  }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize the NetworkController
    Get.put(NetworkController());

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splash(),
    );
  }
}
