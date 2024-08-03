import 'package:fana_fitworld/utils/video_feed/feed.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Beginer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                "FOR BEGINNERS",
                style: TextStyle(color: Colors.white, fontSize: 18,letterSpacing: 2),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                width: size.width,
                height: size.height,
                child: ListView.builder(
                  itemCount: beginerList.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        InkWell(onTap: (){Get.to(Feed());},
                          child: Container(
                              width: size.width,
                              height: 180,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                      image: AssetImage(beginerList[index]),
                                      fit: BoxFit.fitWidth)),
                              child: Center(
                                child: Text(
                                  beginertxt[index],
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                              )),
                        )
                      ],
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  List<String> beginerList = [
    "Assets/Images/warm.jpeg",
    "Assets/Images/abs.jpeg",
    "Assets/Images/chest.jpeg",
    "Assets/Images/bic.jpeg",
    "Assets/Images/wings.jpeg",
    "Assets/Images/tric.jpeg",
    "Assets/Images/sholder.jpeg",
    "Assets/Images/leg.jpeg",
  ];
  List<String> beginertxt = [
    "Warm Up",
    "Abs Workout",
    "Chest Workout",
    "Biceps Workout",
    "Wings Workout",
    "Tricep Workouts",
    "Shoulder workout",
    "Leg Workout"
  ];
}
