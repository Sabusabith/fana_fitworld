import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../Home/Home.dart';
import '../Login/InternetCheck.dart';
import '../Login/Shared.dart';
import '../NoInternet/NoConnection.dart';

class AuthController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final registerEmailController = TextEditingController();
  final registerPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  var obsecure = true.obs;
  var obsecure1 = true.obs;
  var obsecure2 = true.obs;
  var network = true.obs;
  var isLoggingIn = false.obs;
  var isRegistering = false.obs;

  @override
  void onInit() {
    super.onInit();
    checkConnection();
  }

  checkConnection() async {
    network.value = await internetCheck();
    if (!network.value) {
      Get.snackbar("Connection Error", "No internet connection!",
          snackPosition: SnackPosition.BOTTOM,colorText: Colors.white);
      Future.delayed(Duration(seconds: 1))
          .then((value) => Get.to(NoConnection()));
    }
  }

  firebaseLogin() async {
    isLoggingIn.value = true;
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());
      saveName("email", FirebaseAuth.instance.currentUser?.email.toString());
      Get.snackbar("Success", "Login Successful", snackPosition: SnackPosition.BOTTOM,colorText: Colors.white);
      Future.delayed(Duration(seconds: 2)).then((value) => Get.offAll(Home()));
    } catch (e) {
      Get.snackbar("Error", "Invalid email or password", snackPosition: SnackPosition.BOTTOM,colorText: Colors.white);
    } finally {
      isLoggingIn.value = false;
    }
  }

  firebaseRegister() async {
    isRegistering.value = true;
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: registerEmailController.text.trim(),
          password: registerPasswordController.text.trim());
      saveObject("login", true);
     
      saveName("email", FirebaseAuth.instance.currentUser?.email.toString());
      Get.snackbar("Success", "Account created successfully", snackPosition: SnackPosition.BOTTOM,colorText: Colors.white);
      Future.delayed(Duration(seconds: 2)).then((value) => Get.offAll(Home()));
    } catch (e) {
      Get.snackbar("Error", "Invalid email or password", snackPosition: SnackPosition.BOTTOM,colorText: Colors.white);
    } finally {
      isRegistering.value = false;
    }
  }
}
