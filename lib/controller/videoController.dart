import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class PlayerController extends GetxController {
  late YoutubePlayerController youtubePlayerController;

  final String videoId;

  PlayerController(this.videoId);

  @override
  void onInit() {
    super.onInit();
    youtubePlayerController = YoutubePlayerController(
      initialVideoId: videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: true,
      ),
    );
  }

  @override
  void onClose() {
    youtubePlayerController.dispose();
    super.onClose();
  }
}
