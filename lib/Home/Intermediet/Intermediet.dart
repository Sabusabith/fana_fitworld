import 'package:flutter/material.dart';

class InterMediet extends StatelessWidget {
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
                "FOR INTERMEDIATE",
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
                        Container(
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
                            ))
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
    "Assets/Images/interwarm.png",
    "Assets/Images/advabs.jpeg",
    "Assets/Images/adchest.jpeg",
    "Assets/Images/adbicep.jpeg",
    "Assets/Images/advwing.png",
    "Assets/Images/tric.jpeg",
    "Assets/Images/advsold.jpeg",
    "Assets/Images/advleg.jpeg"
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
