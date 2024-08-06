import 'dart:ui'; // Import this for the BackdropFilter

import 'package:animate_do/animate_do.dart';
import 'package:fana_fitworld/utils/video_feed/player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../appcolors.dart';

class Feed extends StatelessWidget {
  final String image;
  final String title;
  List videos = [];
  String phara;
  String name;

  Feed(
      {super.key,
      required this.image,
      required this.title,
      required this.videos,
      required this.phara,
      required this.name});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.transparent.withOpacity(.9),
      appBar: AppBar(
        toolbarHeight: 75,
        backgroundColor: Colors.transparent.withOpacity(.9),
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
        title: Padding(
          padding: const EdgeInsets.only(bottom: 7),
          child: TweenAnimationBuilder(
            tween: Tween<double>(begin: 0, end: 1),
            duration: Duration(seconds: 1),
            curve: Curves.easeInOut,
            builder: (context, double scale, child) {
              return Transform.scale(
                scale: scale,
                child: GradientText(
                  colors: [
                    ksecondarycolor,
                    kprimerycolor,
                  ],
                  title,
                  style: TextStyle(
                    fontFamily: "myfontregular",
                    fontSize: 20,
                  ),
                ),
              );
            },
          ),
        ),
      ),
      body: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: videos.length,
        itemBuilder: (context, index) {
          final videoID = YoutubePlayer.convertUrlToId(videos[index]);

          return Column(
            children: [
              SizedBox(
                height: 20,
              ),
              FadeInUp(duration: Duration(seconds: 1),animate: true,
                child: InkWell(onTap: (){
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => PLayerScreen(
                          videoId: videoID,
                          phara: phara,
                          name: name,
                        ),
                      ),
                    );
                },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 30),
                    width: size.width,
                    height: 200,
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: ImageFiltered(
                              imageFilter: ImageFilter.blur(
                                sigmaX: 1.0,
                                sigmaY: 1.0,
                              ),
                              child: Image.network(
                                YoutubePlayer.getThumbnail(videoId: videoID!),
                                fit: BoxFit.cover,
                                width: size.width,
                                height: 200,
                              ),
                            ),
                          ),
                        ),
                        Positioned.fill(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(
                                colors: [Colors.black.withOpacity(0.5), Colors.black.withOpacity(0.3)],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                            ),
                            child: Center(
                              child: Icon(
                                CupertinoIcons.play_circle,
                                size: 50,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
