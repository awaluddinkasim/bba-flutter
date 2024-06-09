import 'package:bba/pages/materi_detail/view.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

abstract class MateriDetailController extends State<MateriDetailScreen> {
  late YoutubePlayerController controller;
  late PlayerState playerState;
  bool isPlayerReady = false;

  @override
  void initState() {
    super.initState();
    controller = YoutubePlayerController.fromVideoId(
      videoId: widget.materi['id_youtube'],
      params: const YoutubePlayerParams(
        mute: false,
        strictRelatedVideos: true,
      ),
    );
  }

  @override
  void dispose() {
    controller.close();
    super.dispose();
  }

  @override
  void deactivate() {
    controller.pauseVideo();
    super.deactivate();
  }
}
