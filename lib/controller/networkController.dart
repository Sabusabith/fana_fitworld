import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../Login/InternetCheck.dart';
import '../NoInternet/NoConnection.dart';


class NetworkController extends GetxController {
  var hasInternet = false.obs;

  @override
  void onInit() {
    super.onInit();
    checkConnection();
  }

  checkConnection() async {
    hasInternet.value = await internetCheck();
    if (!hasInternet.value) {
      Get.snackbar("Connection Error", "No internet connection!",
          snackPosition: SnackPosition.BOTTOM);
      Future.delayed(Duration(seconds: 1))
          .then((value) => Get.to(NoConnection()));
    }
  }
}
