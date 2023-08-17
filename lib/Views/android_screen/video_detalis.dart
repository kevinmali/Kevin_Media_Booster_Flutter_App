import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:whtsapp/model/video_model.dart';

class Video_detalis extends StatefulWidget {
  const Video_detalis({super.key});

  @override
  State<Video_detalis> createState() => _Video_detalisState();
}

class _Video_detalisState extends State<Video_detalis> {
  late VideoPlayerController videoPlayerController;
  late ChewieController chewieController;
  @override
  void initState() {
    super.initState();
    videoPlayerController =
        VideoPlayerController.asset("Asset/video_player/deshmere.3gpp")
          ..initialize().then(
            (value) => () {
              setState(() {});
            },
          );
    chewieController =
        ChewieController(videoPlayerController: videoPlayerController);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    videoPlayerController.dispose();
    chewieController.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Video",
          style: TextStyle(
              color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: AspectRatio(
        aspectRatio: 16 / 9,
        child: Chewie(
          controller: chewieController,
        ),
      ),
    );
  }
}
