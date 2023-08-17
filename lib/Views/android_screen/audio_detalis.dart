import 'dart:math';

import 'package:action_slider/action_slider.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:whtsapp/model/audio_model.dart';

class song_page extends StatefulWidget {
  const song_page({super.key});

  @override
  State<song_page> createState() => _song_pageState();
}

class _song_pageState extends State<song_page> {
  AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer();
  playAudio(String s) {
    assetsAudioPlayer.open(
      Audio(s),
    );
  }

  @override
  Widget build(BuildContext context) {
    Model data = ModalRoute.of(context)!.settings.arguments as Model;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "MX Player",
          style: TextStyle(
              color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              margin: EdgeInsets.all(20),
              height: 400,
              width: 360,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(data.image), fit: BoxFit.fill),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            StreamBuilder(
                stream: assetsAudioPlayer.currentPosition,
                builder: (context, snapshot) {
                  return BlurryContainer(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          data.title,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 26,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "${snapshot.data?.inHours} : "
                          "${snapshot.data?.inMinutes} : "
                          "${snapshot.data?.inSeconds}",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                        ),
                        ActionSlider.dual(
                          backgroundBorderRadius: BorderRadius.circular(10.0),
                          foregroundBorderRadius: BorderRadius.circular(10.0),
                          width: 300.0,
                          backgroundColor: Colors.white,
                          startChild: const Text('Start'),
                          endChild: const Text('End'),
                          icon: Padding(
                            padding: const EdgeInsets.only(right: 2.0),
                            child: Transform.rotate(
                                angle: 0.5 * pi,
                                child: const Icon(Icons.unfold_more_rounded,
                                    size: 28.0)),
                          ),
                          startAction: (controller) async {
                            controller.loading(); //starts loading animation
                            await Future.delayed(const Duration(seconds: 3));
                            controller.success(); //starts success animation
                            await Future.delayed(const Duration(seconds: 1));
                            controller.reset(); //resets the slider
                          },
                          endAction: (controller) async {
                            controller.loading(); //starts loading animation
                            await Future.delayed(const Duration(seconds: 3));
                            controller.success(); //starts success animation
                            await Future.delayed(const Duration(seconds: 1));
                            controller.reset(); //resets the slider
                          },
                        ),
                      ],
                    ),
                    blur: 10,
                    width: 360,
                    height: 200,
                    elevation: 0,
                    color: Colors.grey.shade400,
                    padding: const EdgeInsets.all(8),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(20),
                    ),
                  );
                }),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {
                    playAudio(data.audio);
                  },
                  icon: Icon(
                    Icons.play_arrow,
                    size: 40,
                  ),
                ),
                IconButton(
                  onPressed: () async {
                    await assetsAudioPlayer.pause();
                  },
                  icon: Icon(
                    Icons.pause,
                    size: 40,
                  ),
                ),
                IconButton(
                  onPressed: () async {
                    await assetsAudioPlayer.stop();
                  },
                  icon: Icon(
                    Icons.stop,
                    size: 40,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
