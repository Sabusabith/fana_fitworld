import 'package:flutter/material.dart';

class DrawerPAge extends StatelessWidget {
  DrawerPAge({required this.name});

  String? name;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Container(
        width: size.width,
        height: size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 150,
              height: 150,
              child: Image.asset(
                "Assets/Images/logo.png",
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 13),
              child: Row(
                children: [
                  Text(
                    "Welcome,",
                    style: TextStyle(
                        color: Colors.white,
                        letterSpacing: 3,
                        fontFamily: "myfontregular",
                        fontSize: 20),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    child: Text(
                      "User : ",
                      style: TextStyle(color: Colors.grey.shade400),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 50,
                      child: Text(
                        name! ?? "Fana Fit World",
                        style: TextStyle(
                            color: Colors.grey.shade400, fontSize: 15),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 22,
            ),
            Divider(
              color: Colors.grey.shade700,
              height: 1,
            ),
            SizedBox(
              height: 20,
            ),
            ListTile(
              leading: Icon(
                Icons.fastfood_rounded,
                color: Colors.grey.shade200,
                size: 30,
              ),
              title: Text(
                "Diet Plan",
                style: TextStyle(color: Colors.grey.shade300, fontSize: 18),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_outlined,
                color: Colors.grey.shade400,
                size: 15,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ListTile(
              leading: Icon(
                Icons.privacy_tip_outlined,
                size: 30,
                color: Colors.grey.shade200,
              ),
              title: Text(
                "Privacy Policy",
                style: TextStyle(color: Colors.grey.shade300, fontSize: 18),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_outlined,
                color: Colors.grey.shade400,
                size: 15,
              ),
            )
          ],
        ),
      ),
    );
  }
}
