import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../controller/videoController.dart';
import '../appcolors.dart';

class PLayerScreen extends StatelessWidget {
  final String videoId;
String name;
String phara;
  PLayerScreen({required this.videoId,required this.name,required this.phara});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GetBuilder<PlayerController>(
      init: PlayerController(videoId),
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.transparent.withOpacity(.9),
          appBar: AppBar(
            toolbarHeight: 75,
            leading: SlideInLeft(
              from: 100,
              duration: Duration(seconds: 1),
              child: InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Icon(
                    CupertinoIcons.back,
                    color: kprimerycolor,
                  )),
            ),
            backgroundColor: Colors.transparent.withOpacity(.9),
            title: TweenAnimationBuilder(
              tween: Tween<double>(begin: 0, end: 1),
              duration: Duration(seconds: 2),
              curve: Curves.easeInOut,
              builder: (context, double scale, child) {
                return Transform.scale(
                  scale: scale,
                  child: GradientText(
                    colors: [
                      ksecondarycolor,
                      kprimerycolor,
                    ],
                    "Fana Fit",
                    style: TextStyle(
                      fontFamily: "myfontregular",
                      fontSize: 27,
                    ),
                  ),
                );
              },
            ),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 20,),
              YoutubePlayer(
                controller: controller.youtubePlayerController,
                showVideoProgressIndicator: true,
                onReady: () {
                  print('Player is ready.');
                },
              ),
              Expanded(
                  child: Container(
                child: ListView(children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 40,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: GradientText(
                          colors: [
                            Colors.white.withOpacity(.7),
                            Colors.white.withOpacity(.7),
                          ],
                          phara,
                          style: TextStyle(
                            letterSpacing: 2,
                            fontSize: 15,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 40),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TweenAnimationBuilder(
                              tween: Tween<double>(begin: 0, end: 1),
                              duration: Duration(seconds: 2),
                              curve: Curves.easeInOut,
                              builder: (context, double scale, child) {
                                return Transform.scale(
                                  scale: scale,
                                  child: GradientText(
                                    colors: [
                                      ksecondarycolor,
                                      kprimerycolor,
                                    ],
                                    name,
                                    style: TextStyle(
                                      fontFamily: "myfontregular",
                                      fontSize: 13,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ]),
              ))
            ],
          ),
        );
      },
    );
  }
}
