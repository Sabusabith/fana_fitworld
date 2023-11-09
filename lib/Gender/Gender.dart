// import 'package:fana_fitworld/Home/Home.dart';
// import 'package:fana_fitworld/age/Age.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get_core/get_core.dart';
// import 'package:get/get_navigation/get_navigation.dart';

// import '../Login/InternetCheck.dart';
// import '../NoInternet/NoConnection.dart';

// class GenderPage extends StatefulWidget {
//   const GenderPage({super.key});

//   @override
//   State<GenderPage> createState() => _GenderPageState();
// }

// class _GenderPageState extends State<GenderPage> {
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

//   int selected = 3;
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
//             children: [
//               SizedBox(
//                 height: 55,
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 10),
//                 child: Text(
//                   "TELL US ABOUT YOURSELF",
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
//                 padding: const EdgeInsets.symmetric(horizontal: 45),
//                 child: Text(
//                   "TO GIVE YOU A BETTER EXPERIENCE WE NEED\NTO KNOW YOUR GENDER",
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                       letterSpacing: 2,
//                       color: Colors.white,
//                       fontFamily: "myfontregular",
//                       fontSize: 11),
//                 ),
//               ),
//               Expanded(
//                 child: Align(
//                   alignment: Alignment.center,
//                   child: Container(
//                     width: size.width,
//                     height: 400,
//                     child: Align(
//                       alignment: Alignment.center,
//                       child: ListView.builder(
//                         physics: NeverScrollableScrollPhysics(),
//                         itemCount: 2,
//                         itemBuilder: (context, index) => Column(
//                           children: [
//                             SizedBox(
//                               height: 40,
//                             ),
//                             GestureDetector(
//                               onTap: () {
//                                 setState(() {
//                                   selected = index;
//                                 });
//                               },
//                               child: Container(
//                                 width: 140,
//                                 height: 140,
//                                 decoration: BoxDecoration(
//                                     shape: BoxShape.circle,
//                                     color: selected == index
//                                         ? Color(0xffD0FD3E)
//                                         : Color(0xff2C2C2E)),
//                                 child: Column(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     Icon(icon[index],
//                                         size: 55,
//                                         color: selected == index
//                                             ? Colors.black
//                                             : Colors.white),
//                                     Text(
//                                       names[index],
//                                       style: TextStyle(
//                                           fontSize: 15,
//                                           color: selected == index
//                                               ? Colors.black
//                                               : Colors.white),
//                                     )
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 40,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
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
//                           if (selected == 0 || selected == 1) {
//                             Get.to(AgePage());
//                           } else {
//                             Get.snackbar("Select Gender", "",
//                                 colorText: Colors.white,
//                                 snackPosition: SnackPosition.BOTTOM);
//                           }
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

//   List<IconData> icon = [Icons.male, Icons.female];
//   List<String> names = ["Male", "Female"];
// }
