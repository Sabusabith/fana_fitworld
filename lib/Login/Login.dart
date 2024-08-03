import 'dart:ui';

import 'package:animate_do/animate_do.dart';
import 'package:fana_fitworld/Login/InternetCheck.dart';
import 'package:fana_fitworld/NoInternet/NoConnection.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fana_fitworld/Home/Home.dart';

import '../controller/authController.dart';

class Login extends StatelessWidget {
  final AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      top: false,
      child: DefaultTabController(
        initialIndex: 0,
        length: 2,
        child: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            toolbarHeight: 30,
            backgroundColor: Colors.transparent,
            leading: SizedBox(),
            bottom: TabBar(
              unselectedLabelColor: Colors.white,
              dividerColor: Colors.transparent,
              labelColor: Color(0xffD0FD3E),
              indicatorColor: Color(0xffD0FD3E),
              padding: EdgeInsets.only(right: size.width / 2),
              tabs: [
                FadeIn(
                    duration: Duration(milliseconds: 1000),
                    animate: true,
                    child: Tab(text: "Login")),
                FadeIn(
                    duration: Duration(milliseconds: 1000),
                    animate: true,
                    child: Tab(text: "Sign Up")),
              ],
            ),
          ),
          backgroundColor: Colors.black,
          body: TabBarView(children: [login(context), signup(context)]),
        ),
      ),
    );
  }

  Widget login(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Form(
      child: Container(
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("Assets/Images/new.png"), fit: BoxFit.cover),
        ),
        child: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
            child: Container(
              color: Colors.black.withOpacity(0.5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SlideInUp(from: 1000,animate: true,duration: Duration(milliseconds: 700),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.black54,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15))),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(height: 30),
                            SlideInUp( from: 100,
                              duration: Duration(milliseconds: 1600),
                              child: AnimatedOpacity(
                                opacity: 1.0,
                                duration: Duration(seconds: 1),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                child: TextFormField(
                                  controller: authController.emailController,
                                  style: TextStyle(color: Colors.white),
                                  cursorColor: Colors.white,
                                  textInputAction: TextInputAction.next,
                                  decoration: InputDecoration(
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white)),
                                      labelText: "Email",
                                      labelStyle:
                                          TextStyle(color: Colors.grey.shade400),
                                      floatingLabelStyle:
                                          TextStyle(color: Color(0xffD0FD3E)),
                                      enabledBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white))),
                                ),
                              ),
                            ),),
                            SizedBox(height: 10),
                            SlideInUp(  duration: Duration(milliseconds: 1600),
                              child: AnimatedOpacity(
                                opacity: 1.0,
                                duration: Duration(seconds: 1),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                child: Obx(() => TextFormField(
                                      controller: authController.passwordController,
                                      obscureText: authController.obsecure.value,
                                      style: TextStyle(color: Colors.white),
                                      cursorColor: Colors.white,
                                      decoration: InputDecoration(
                                          suffixIcon: InkWell(
                                              onTap: () {
                                                authController.obsecure.value =
                                                    !authController.obsecure.value;
                                              },
                                              child: authController.obsecure.value
                                                  ? Icon(Icons.visibility_off,
                                                      color: Colors.grey)
                                                  : Icon(Icons.remove_red_eye,
                                                      color: Color(0xffD0FD3E))),
                                          focusedBorder: UnderlineInputBorder(
                                              borderSide:
                                                  BorderSide(color: Colors.white)),
                                          labelText: "Password",
                                          labelStyle: TextStyle(
                                              color: Colors.grey.shade400),
                                          floatingLabelStyle:
                                              TextStyle(color: Color(0xffD0FD3E)),
                                          enabledBorder: UnderlineInputBorder(
                                              borderSide:
                                                  BorderSide(color: Colors.white))),
                                    )),
                              ),)
                            ),
                            SizedBox(height: 8),
                            SlideInUp(  duration: Duration(milliseconds: 1500),
                              child: AnimatedOpacity(
                                opacity: 1.0,
                                duration: Duration(seconds: 1),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 15),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    TextButton(
                                        onPressed: () {
                                          authController.checkConnection();
                                        },
                                        child: Text("Forgot Password",
                                            style: TextStyle(
                                                color: Color(0xffD0FD3E)))),
                                  ],
                                ),
                              ),)
                            ),
                            FadeIn(  duration: Duration(milliseconds: 1600),
                            delay: Duration(seconds: 1),
                              child: AnimatedOpacity(
                                opacity: 1.0,
                                duration: Duration(seconds: 1),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(width: 10),
                                  Container(
                                    height: 100,
                                    child: Row(
                                      children: [
                                        SizedBox(width: 20),
                                        Container(
                                          width: 55,
                                          height: 55,
                                          decoration: BoxDecoration(
                                              color: Color(0xff3A3A3C),
                                              shape: BoxShape.circle),
                                          child: Center(
                                              child: Image.asset(
                                                  "Assets/Images/Apple.png")),
                                        ),
                                        SizedBox(width: 10),
                                        Container(
                                          width: 55,
                                          height: 55,
                                          decoration: BoxDecoration(
                                              color: Color(0xff3A3A3C),
                                              shape: BoxShape.circle),
                                          child: Center(
                                              child: Image.asset(
                                                  "Assets/Images/Union.png")),
                                        )
                                      ],
                                    ),
                                  ),
                                  Spacer(),
                                  Container(
                                    margin: EdgeInsets.only(right: 15, left: 15),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(25)),
                                    height: 45,
                                    child: Obx(() => ElevatedButton(
                                        style: ButtonStyle(
                                            shape: MaterialStateProperty.all<
                                                    RoundedRectangleBorder>(
                                                RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(25.0),
                                            )),
                                            backgroundColor:
                                                MaterialStatePropertyAll(
                                                    Color(0xffD0FD3E))),
                                        onPressed: () {
                                          FocusScope.of(context)
                                              .requestFocus(new FocusNode());
                                          if (authController.emailController.text
                                                  .isNotEmpty &&
                                              authController.passwordController.text
                                                  .isNotEmpty) {
                                            authController.firebaseLogin();
                                          }
                                        },
                                        child: authController.isLoggingIn.value
                                            ? Center(
                                                child: SizedBox(
                                                    width: 20,
                                                    height: 20,
                                                    child:
                                                        CircularProgressIndicator(
                                                      color: Colors.white,
                                                      strokeWidth: 2,
                                                    )))
                                            : Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  SizedBox(width: 10),
                                                  Text("Login",
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                  SizedBox(width: 5),
                                                  Icon(Icons.arrow_right,
                                                      color: Colors.black)
                                                ],
                                              ))),
                                  ),
                                  SizedBox(width: 10),
                                ],
                              ),)
                            ),
                            SizedBox(
                              height: 10,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget signup(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Form(
      child: Container(
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("Assets/Images/new.png"), fit: BoxFit.cover)),
        child: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
            child: Container(
              color: Colors.black.withOpacity(0.5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SlideInUp(from: 1000,duration: Duration(milliseconds: 700),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.black54,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15))),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(height: 30),
                            SlideInUp(     duration: Duration(milliseconds: 1600),
                              child: AnimatedOpacity(
                                opacity: 1.0,
                                duration: Duration(seconds: 1),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                child: TextFormField(
                                  controller:
                                      authController.registerEmailController,
                                  style: TextStyle(color: Colors.white),
                                  cursorColor: Colors.white,
                                  textInputAction: TextInputAction.next,
                                  decoration: InputDecoration(
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white)),
                                      labelText: "Email",
                                      labelStyle:
                                          TextStyle(color: Colors.grey.shade400),
                                      floatingLabelStyle:
                                          TextStyle(color: Color(0xffD0FD3E)),
                                      enabledBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white))),
                                ),
                              ),)
                            ),
                            SizedBox(height: 10),
                            SlideInUp(     duration: Duration(milliseconds: 1600),
                              child: AnimatedOpacity(
                                opacity: 1.0,
                                duration: Duration(seconds: 1),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                child: Obx(() => TextFormField(
                                      controller:
                                          authController.registerPasswordController,
                                      obscureText: authController.obsecure1.value,
                                      style: TextStyle(color: Colors.white),
                                      cursorColor: Colors.white,
                                      decoration: InputDecoration(
                                          suffixIcon: InkWell(
                                              onTap: () {
                                                authController.obsecure1.value =
                                                    !authController.obsecure1.value;
                                              },
                                              child: authController.obsecure1.value
                                                  ? Icon(Icons.visibility_off,
                                                      color: Colors.grey)
                                                  : Icon(Icons.remove_red_eye,
                                                      color: Color(0xffD0FD3E))),
                                          focusedBorder: UnderlineInputBorder(
                                              borderSide:
                                                  BorderSide(color: Colors.white)),
                                          labelText: "Password",
                                          labelStyle: TextStyle(
                                              color: Colors.grey.shade400),
                                          floatingLabelStyle:
                                              TextStyle(color: Color(0xffD0FD3E)),
                                          enabledBorder: UnderlineInputBorder(
                                              borderSide:
                                                  BorderSide(color: Colors.white))),
                                    )),
                              ),)
                            ),
                            SizedBox(height: 10),
                            SlideInUp(     duration: Duration(milliseconds: 1600),
                              child: AnimatedOpacity(
                                opacity: 1.0,
                                duration: Duration(seconds: 1),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                child: Obx(() => TextFormField(
                                      controller:
                                          authController.confirmPasswordController,
                                      obscureText: authController.obsecure2.value,
                                      style: TextStyle(color: Colors.white),
                                      cursorColor: Colors.white,
                                      decoration: InputDecoration(
                                          suffixIcon: InkWell(
                                              onTap: () {
                                                authController.obsecure2.value =
                                                    !authController.obsecure2.value;
                                              },
                                              child: authController.obsecure2.value
                                                  ? Icon(Icons.visibility_off,
                                                      color: Colors.grey)
                                                  : Icon(Icons.remove_red_eye,
                                                      color: Color(0xffD0FD3E))),
                                          focusedBorder: UnderlineInputBorder(
                                              borderSide:
                                                  BorderSide(color: Colors.white)),
                                          labelText: "Confirm Password",
                                          labelStyle: TextStyle(
                                              color: Colors.grey.shade400),
                                          floatingLabelStyle:
                                              TextStyle(color: Color(0xffD0FD3E)),
                                          enabledBorder: UnderlineInputBorder(
                                              borderSide:
                                                  BorderSide(color: Colors.white))),
                                    )),
                              )),
                            ),
                            SizedBox(height: 20),
                            FadeIn( duration: Duration(milliseconds: 2000),
                            delay: Duration(seconds: 1),
                              child: AnimatedOpacity(
                                opacity: 1.0,
                                duration: Duration(seconds: 2),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    child: Obx(() => ElevatedButton(
                                        style: ButtonStyle(
                                            shape: MaterialStateProperty.all<
                                                    RoundedRectangleBorder>(
                                                RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(25.0),
                                            )),
                                            backgroundColor:
                                                MaterialStatePropertyAll(
                                                    Color(0xffD0FD3E))),
                                        onPressed: () {
                                          FocusScope.of(context)
                                              .requestFocus(new FocusNode());
                                          if (authController.registerEmailController.text.isNotEmpty &&
                                              authController
                                                  .registerPasswordController
                                                  .text
                                                  .isNotEmpty &&
                                              authController
                                                  .confirmPasswordController
                                                  .text
                                                  .isNotEmpty &&
                                              authController
                                                      .registerPasswordController
                                                      .text ==
                                                  authController
                                                      .confirmPasswordController
                                                      .text) {
                                            authController.firebaseRegister();
                                          } else {
                                            Get.snackbar(
                                                "Error", "Passwords do not match",
                                                snackPosition: SnackPosition.BOTTOM,
                                                colorText: Colors.white);
                                          }
                                        },
                                        child: authController.isRegistering.value
                                            ? Center(
                                                child: SizedBox(
                                                    width: 20,
                                                    height: 20,
                                                    child:
                                                        CircularProgressIndicator(
                                                      color: Colors.white,
                                                      strokeWidth: 2,
                                                    )))
                                            : Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  SizedBox(width: 10),
                                                  Text("Sign Up",
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                  SizedBox(width: 5),
                                                  Icon(Icons.arrow_right,
                                                      color: Colors.black)
                                                ],
                                              ))),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  )
                                ],
                              ),)
                            ),
                            SizedBox(
                              height: 35,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
