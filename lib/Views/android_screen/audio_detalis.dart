import 'package:assets_audio_player/assets_audio_player.dart';
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
          "Song",
          style: TextStyle(
              color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                  return Container(
                    height: 80,
                    width: 360,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          data.title,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 24,
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
                      ],
                    ),
                  );
                }),
            Container(
              height: 80,
              width: 360,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
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
            ),
          ],
        ),
      ),
    );
  }
}
