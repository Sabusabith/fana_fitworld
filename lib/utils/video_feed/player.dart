import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../controller/videoController.dart';


class PLayerScreen extends StatelessWidget {
  final String videoId;

  const PLayerScreen({Key? key, required this.videoId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PlayerController playerController = Get.put(PlayerController(videoId));

    return Scaffold(
      appBar: AppBar(title: const Text("Player")),
      body: 
       YoutubePlayer(controller: playerController.youtubePlayerController)
      
    );
  }
}
