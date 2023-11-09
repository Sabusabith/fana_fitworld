import 'package:fana_fitworld/Gender/Gender.dart';
import 'package:fana_fitworld/Login/InternetCheck.dart';
import 'package:fana_fitworld/Login/Shared.dart';
import 'package:fana_fitworld/NoInternet/NoConnection.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Home/Home.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailcontroller = TextEditingController();

  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController registeremail = TextEditingController();

  TextEditingController registerpassword = TextEditingController();
  final lformKey = GlobalKey<FormState>();
  final rformKey = GlobalKey<FormState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkConnection();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailcontroller.dispose();
    passwordcontroller.dispose();
  }

  bool? network;
  bool obsecure = true;
  bool obsecure1 = true;
  bool obsecure2 = true;

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

  firebaseLogin() async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(
            email: emailcontroller.text.trim(),
            password: passwordcontroller.text.trim())
        .then((value) {
      if (value != null) {
        saveName("name", name.trim());
        saveName("email", emailcontroller.text.trim());
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.green,
            content: Text(
              "Login Succes",
              style: TextStyle(color: Colors.white),
            )));
        Future.delayed(Duration(seconds: 2))
            .then((value) => Get.offAll(Home()));
      }
    }).onError((error, stackTrace) {
      network!
          ? ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Invalid email or password!")))
          : ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("No internet connection!")));
    });
  }

  String name = "";
  firebaseRegister() async {
    print("name : $name");
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: registeremail.text.trim(),
            password: registerpassword.text.trim())
        .then((value) {
      if (value != null) {
        saveObject("login", true);
        saveName("name", name.trim());
        saveName("email", registeremail.text.trim());
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.green,
            content: Text(
              "Account created succesfull",
              style: TextStyle(color: Colors.white),
            )));
        Future.delayed(Duration(seconds: 2))
            .then((value) => Get.offAll(Home()));
      }
    }).onError((error, stackTrace) {
      network!
          ? ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.red,
              content: Text(
                "Something wrong try again",
                style: TextStyle(color: Colors.white),
              )))
          : ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("No internet connection!")));
    }).then((value) => Future.delayed(Duration(seconds: 2)).then((value) {}));
  }

  var index = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: DefaultTabController(
        initialIndex: index,
        length: 2,
        child: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            toolbarHeight: 30,
            backgroundColor: Colors.transparent,
            leading: SizedBox(),
            bottom: TabBar(
              labelColor: Colors.white,
              indicatorColor: Color(0xffD0FD3E),
              padding: EdgeInsets.only(right: 100),
              tabs: [
                Tab(
                  text: "Login",
                ),
                Tab(
                  text: "Sign Up",
                ),
              ],
            ),
          ),
          backgroundColor: Colors.black,
          body: TabBarView(children: [login(context), signup(context)]),
        ),
      ),
    );
  }

  login(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Form(
      key: lformKey,
      child: SingleChildScrollView(
        child: Container(
          width: size.width,
          height: size.height,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    "Assets/Images/new.png",
                  ),
                  fit: BoxFit.cover)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 320,
                decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15))),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextFormField(
                          onChanged: (val) {
                            setState(() {
                              name = val;
                            });
                          },
                          validator: (val) {
                            return RegExp(
                                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                    .hasMatch(val!)
                                ? null
                                : "Please enter a valid email";
                          },
                          controller: emailcontroller,
                          style: TextStyle(color: Colors.white),
                          cursorColor: Colors.white,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white)),
                              labelText: "Email",
                              labelStyle:
                                  TextStyle(color: Colors.grey.shade400),
                              floatingLabelStyle:
                                  TextStyle(color: Color(0xffD0FD3E)),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white))),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextFormField(
                          textInputAction: TextInputAction.next,
                          validator: (val) {
                            if (val!.length < 6) {
                              return "Password must be at least 6 characters";
                            } else {
                              return null;
                            }
                          },
                          controller: passwordcontroller,
                          obscureText: obsecure,
                          style: TextStyle(color: Colors.white),
                          cursorColor: Colors.white,
                          decoration: InputDecoration(
                              suffixIcon: InkWell(
                                  onTap: () {
                                    setState(() {});
                                    obsecure = !obsecure;
                                  },
                                  child: obsecure
                                      ? Icon(
                                          Icons.visibility_off,
                                          color: Colors.grey,
                                        )
                                      : Icon(
                                          Icons.remove_red_eye,
                                          color: Color(0xffD0FD3E),
                                        )),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white)),
                              labelText: "Password",
                              labelStyle:
                                  TextStyle(color: Colors.grey.shade400),
                              floatingLabelStyle:
                                  TextStyle(color: Color(0xffD0FD3E)),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white))),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                                onPressed: () {
                                  checkConnection();
                                },
                                child: Text(
                                  "Forgot Password",
                                  style: TextStyle(color: Color(0xffD0FD3E)),
                                )),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 200,
                            height: 100,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 20,
                                ),
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
                                SizedBox(
                                  width: 20,
                                ),
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
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(right: 15,left: 50),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25)),
                              width: 120,
                              height: 45,
                              child: ElevatedButton(
                                  style: ButtonStyle(
                                      shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(25.0),
                                      )),
                                      backgroundColor: MaterialStatePropertyAll(
                                          Color(0xffD0FD3E))),
                                  onPressed: () {
                                    checkConnection();
                                    FocusScope.of(context)
                                        .requestFocus(new FocusNode());
                                    if (lformKey.currentState!.validate()) {
                                      firebaseLogin();
                                    }
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "Login",
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Icon(
                                        Icons.arrow_right,
                                        color: Colors.black,
                                      )
                                    ],
                                  )),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  signup(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Form(
      key: rformKey,
      child: Container(
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  "Assets/Images/nu.jpeg",
                ),
                fit: BoxFit.cover)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: 330,
              decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15))),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextFormField(
                        textInputAction: TextInputAction.next,
                        onChanged: (val) {
                          setState(() {
                            name = val;
                          });
                        },
                        controller: registeremail,
                        validator: (val) {
                          return RegExp(
                                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(val!)
                              ? null
                              : "Please enter a valid email";
                        },
                        style: TextStyle(color: Colors.white),
                        cursorColor: Colors.white,
                        decoration: InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            labelText: "Email",
                            labelStyle: TextStyle(color: Colors.grey.shade400),
                            floatingLabelStyle:
                                TextStyle(color: Color(0xffD0FD3E)),
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white))),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextFormField(
                        textInputAction: TextInputAction.next,
                        controller: registerpassword,
                        validator: (val) {
                          if (val!.length < 6) {
                            return "Password must be at least 6 characters";
                          } else {
                            return null;
                          }
                        },
                        obscureText: obsecure1,
                        style: TextStyle(color: Colors.white),
                        cursorColor: Colors.white,
                        decoration: InputDecoration(
                            suffixIcon: InkWell(
                                onTap: () {
                                  setState(() {
                                    obsecure1 = !obsecure1;
                                  });
                                },
                                child: obsecure1
                                    ? Icon(
                                        Icons.visibility_off,
                                        color: Colors.grey,
                                      )
                                    : Icon(
                                        Icons.remove_red_eye,
                                        color: Color(0xffD0FD3E),
                                      )),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            labelText: "Password",
                            labelStyle: TextStyle(color: Colors.grey.shade400),
                            floatingLabelStyle:
                                TextStyle(color: Color(0xffD0FD3E)),
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white))),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextFormField(
                        textInputAction: TextInputAction.next,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please confirm your password';
                          } else if (value != registerpassword.text) {
                            return 'Passwords do not match';
                          }
                          return null;
                        },
                        obscureText: obsecure2,
                        style: TextStyle(color: Colors.white),
                        cursorColor: Colors.white,
                        decoration: InputDecoration(
                            suffixIcon: InkWell(
                                onTap: () {
                                  setState(() {});
                                  obsecure2 = !obsecure2;
                                },
                                child: obsecure2
                                    ? Icon(
                                        Icons.visibility_off,
                                        color: Colors.grey,
                                      )
                                    : Icon(
                                        Icons.remove_red_eye,
                                        color: Color(0xffD0FD3E),
                                      )),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            labelText: "Confirm Password",
                            labelStyle: TextStyle(color: Colors.grey.shade400),
                            floatingLabelStyle:
                                TextStyle(color: Color(0xffD0FD3E)),
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white))),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 200,
                          height: 100,
                          child: Row(
                            children: [
                              SizedBox(
                                width: 20,
                              ),
                              Container(
                                width: 55,
                                height: 55,
                                decoration: BoxDecoration(
                                    color: Color(0xff3A3A3C),
                                    shape: BoxShape.circle),
                                child: Center(
                                    child:
                                        Image.asset("Assets/Images/Apple.png")),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Container(
                                width: 55,
                                height: 55,
                                decoration: BoxDecoration(
                                    color: Color(0xff3A3A3C),
                                    shape: BoxShape.circle),
                                child: Center(
                                    child:
                                        Image.asset("Assets/Images/Union.png")),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(left: 50,right: 15),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25)),
                            width: 135,
                            height: 45,
                            child: ElevatedButton(
                                style: ButtonStyle(
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25.0),
                                    )),
                                    backgroundColor: MaterialStatePropertyAll(
                                        Color(0xffD0FD3E))),
                                onPressed: () {
                                  checkConnection();
                                  FocusScope.of(context)
                                      .requestFocus(new FocusNode());
                                  if (rformKey.currentState!.validate()) {
                                    firebaseRegister();
                                  }
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                   
                                    Text(
                                      "SignUp",
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      width: 2,
                                    ),
                                    Icon(
                                      Icons.arrow_right,
                                      color: Colors.black,
                                    )
                                  ],
                                )),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
