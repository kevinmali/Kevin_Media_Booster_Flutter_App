import 'package:flutter/material.dart';
import 'package:whtsapp/model/audio_model.dart';

import '../../model/list_audio.dart';

class audio extends StatefulWidget {
  const audio({super.key});

  @override
  State<audio> createState() => _audioState();
}

class _audioState extends State<audio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
                children: listsong
                    .map(
                      (e) => GestureDetector(
                        onTap: () {
                          Model m = Model(
                            audio: e['audio'],
                            image: e['image'],
                            title: e['title'],
                          );
                          Navigator.pushNamed(context, 'song_details',
                              arguments: m);
                        },
                        child: Container(
                          height: 200,
                          width: 390,
                          margin: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(e['image']),
                                fit: BoxFit.fill),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    )
                    .toList()),
          ],
        ),
      ),
    );
  }
}
