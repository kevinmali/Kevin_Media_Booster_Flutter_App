import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

class audio extends StatefulWidget {
  const audio({super.key});

  @override
  State<audio> createState() => _audioState();
}

class _audioState extends State<audio> {
  AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer();
  playAudio() {
    assetsAudioPlayer.open(Audio(""));
  }
  @override
  void initState() {
    super.initState();
    playAudio();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            StreamBuilder(
                stream : assetsAudioPlayer.currentPosition,
                builder:(context,snapshot){
                  return
                    Container(
                      height: 400,
                      width: 360,
                      decoration: BoxDecoration(
                        // color: Colors.orange,
                        image: DecorationImage(image: AssetImage("Asset/images/images.png"),fit: BoxFit.fill),
                        borderRadius: BorderRadius.circular(30),
                      ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("${snapshot.data?.inHours} : ${snapshot.data?.inMinutes} : ${snapshot.data?.inSeconds}",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
                      ],
                  ),
                    );
                }
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 120,
              width: 360,
              decoration: BoxDecoration(
                color: Colors.orange.withOpacity(0.25),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(onPressed: () async {
                    await assetsAudioPlayer.play();
                  }, icon: Icon(Icons.play_arrow,size: 40,),),
                  IconButton(onPressed: () async {
                    await assetsAudioPlayer.pause();
                  }, icon: Icon(Icons.pause,size: 40,),),
                  IconButton(onPressed: () async {
                    await assetsAudioPlayer.stop();
                  }, icon: Icon(Icons.stop,size: 40,),),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
