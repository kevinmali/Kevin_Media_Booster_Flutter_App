import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:whtsapp/model/list_video.dart';
import 'package:whtsapp/model/video_model.dart';

class video_player extends StatefulWidget {
  const video_player({super.key});

  @override
  State<video_player> createState() => _video_playerState();
}

class _video_playerState extends State<video_player> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: SingleChildScrollView(
        child: Column(
          children: listvideo
              .map((e) => GestureDetector(
                    onTap: () {
                      Vmodel v1 = Vmodel(
                          video: e['video'],
                          vimage: e['vimage'],
                          vtitle: e['vtitle']);
                      Navigator.pushNamed(context, 'video_details',
                          arguments: v1);
                    },
                    child: Container(
                      margin: EdgeInsets.all(5),
                      height: 220,
                      width: 360,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Image.asset(
                        e['vimage'],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ))
              .toList(),
        ),
      ),
      // child: AspectRatio(
      //   aspectRatio: videoPlayerController.value.aspectRatio,
      //   child: VideoPlayer(videoPlayerController),
      // ),
    ));
  }
}
