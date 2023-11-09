// import 'package:fana_fitworld/Home/Home.dart';
// import 'package:fana_fitworld/Login/Login.dart';
// import 'package:fana_fitworld/weight/Weight.dart';
// import 'package:flutter/material.dart';

// import 'package:awesome_number_picker/awesome_number_picker.dart';
// import 'package:get/get_core/get_core.dart';
// import 'package:get/get_navigation/get_navigation.dart';

// import '../Login/InternetCheck.dart';
// import '../NoInternet/NoConnection.dart';

// class HeightPage extends StatefulWidget {
//   const HeightPage({super.key});

//   @override
//   State<HeightPage> createState() => _HeightPageState();
// }

// class _HeightPageState extends State<HeightPage> {
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     checkConnection();
//   }

//   bool? network;
//   checkConnection() async {
//     network = await internetCheck();
//     setState(() {});
//     if (network!) {
//     } else {
//       ScaffoldMessenger.of(context)
//           .showSnackBar(SnackBar(content: Text("No internet connection!")));
//       Future.delayed(Duration(seconds: 1))
//           .then((value) => Get.to(NoConnection()));
//     }
//   }

//   int currentValue = 0;
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;

//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: SafeArea(
//         child: SizedBox(
//           width: size.width,
//           height: size.height,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               SizedBox(
//                 height: 40,
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 10),
//                 child: Text(
//                   "WHAT’S YOUR HEIGHT?",
//                   style: TextStyle(
//                       letterSpacing: 2,
//                       color: Colors.white,
//                       fontFamily: "myfontone",
//                       fontSize: 21),
//                 ),
//               ),
//               SizedBox(
//                 height: 15,
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 25),
//                 child: Text(
//                   "THIS HELPS US CREATE YOUR PERSONALIZED PLAN",
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                       letterSpacing: 1,
//                       color: Colors.white,
//                       fontFamily: "myfontregular",
//                       fontSize: 11),
//                 ),
//               ),
//               Expanded(
//                 child: IntegerNumberPicker(
//                   pickedItemDecoration: BoxDecoration(
//                       shape: BoxShape.circle,
//                       border: Border.all(color: Color(0xffD0FD3E), width: 5)),
//                   size: 80,
//                   pickedItemTextStyle:
//                       TextStyle(color: Colors.white, fontSize: 30),
//                   minValue: 0,
//                   maxValue: 200,
//                   otherItemsTextStyle:
//                       TextStyle(color: Colors.grey.shade500, fontSize: 20),
//                   initialValue: currentValue,
//                   onChanged: (value) {
//                     setState(() {
//                       currentValue = value;
//                     });
//                   },
//                 ),
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Container(
//                     margin: EdgeInsets.only(left: 25),
//                     width: 50,
//                     height: 50,
//                     decoration: BoxDecoration(
//                         shape: BoxShape.circle, color: Color(0xff3A3A3C)),
//                     child: Icon(
//                       Icons.arrow_back,
//                       color: Colors.white,
//                     ),
//                   ),
//                   Container(
//                     margin: EdgeInsets.symmetric(horizontal: 30),
//                     width: 100,
//                     height: 45,
//                     child: ElevatedButton(
//                         style: ButtonStyle(
//                             shape: MaterialStateProperty.all<
//                                 RoundedRectangleBorder>(RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(25),
//                             )),
//                             backgroundColor:
//                                 MaterialStatePropertyAll(Color(0xffD0FD3E))),
//                         onPressed: () {
//                           checkConnection();
//                           Get.to(Home());
//                         },
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                           children: [
//                             SizedBox(
//                               width: 10,
//                             ),
//                             Text(
//                               "Next",
//                               style: TextStyle(
//                                 color: Colors.black,
//                               ),
//                             ),
//                             Icon(
//                               Icons.arrow_right,
//                               color: Colors.black,
//                             )
//                           ],
//                         )),
//                   ),
//                 ],
//               ),
//               SizedBox(
//                 height: 30,
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
