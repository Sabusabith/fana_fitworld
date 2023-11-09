import 'package:fana_fitworld/Home/Advanced/Advanced.dart';
import 'package:fana_fitworld/Home/Beginer/Beginer.dart';
import 'package:fana_fitworld/Home/DrawerPage/DrawerPAge.dart';
import 'package:fana_fitworld/Home/Intermediet/Intermediet.dart';
import 'package:flutter/material.dart';

import '../Login/Shared.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserData();
  }

  dynamic name;

  dynamic email;
  getUserData() async {
    name = await getSavedName("name");
    email = await getSavedName("email");

    setState(() {});

    print(name);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        drawer: Drawer(
            backgroundColor: Color.fromARGB(255, 30, 28, 28),
            child: DrawerPAge(
              name: name,
            )),
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Fana ",
            style: TextStyle(
                color: Color(0xffD0FD3E),
                fontFamily: "myfontregular",
                fontSize: 27),
          ),
          leadingWidth: 75,
          toolbarHeight: 100,
          backgroundColor: Colors.black,
          actions: [
            Image.asset("Assets/Images/logo.png"),
            SizedBox(
              width: 20,
            )
          ],
          bottom: TabBar(
              unselectedLabelColor: Colors.grey.shade400,
              indicatorSize: TabBarIndicatorSize.label,
              labelColor: Colors.black,
              indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Color(0xffD0FD3E)),
              tabs: [
                Tab(
                  height: 35,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(color: Color(0xffD0FD3E), width: 1)),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("Beginner"),
                    ),
                  ),
                ),
                Tab(
                  height: 35,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(color: Color(0xffD0FD3E), width: 1)),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("Medium"),
                    ),
                  ),
                ),
                Tab(
                  height: 35,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(color: Color(0xffD0FD3E), width: 1)),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("Advance"),
                    ),
                  ),
                ),
              ]),
        ),
        backgroundColor: Colors.black,
        body: SafeArea(
          child: SizedBox(
              width: size.width,
              height: size.height,
              child: TabBarView(children: [
                Beginer(),
                InterMediet(),
                Advanced(),
              ])),
        ),
      ),
    );
  }
}
