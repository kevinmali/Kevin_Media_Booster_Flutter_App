import 'package:flutter/material.dart';

class video_player extends StatefulWidget {
  const video_player({super.key});

  @override
  State<video_player> createState() => _video_playerState();
}

class _video_playerState extends State<video_player> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 150,
        width: 200,
        color: Colors.red,
      ),
    );
  }
}
