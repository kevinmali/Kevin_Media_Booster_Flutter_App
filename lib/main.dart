import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whtsapp/Views/android_screen/splace_screen.dart';

import 'Views/android_screen/audio_detalis.dart';
import 'Views/android_screen/audio_screen.dart';
import 'Views/android_screen/video_detalis.dart';
import 'Views/android_screen/video_player.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      darkTheme: ThemeData.dark(),
      routes: {
        '/': (context) => Splash(),
        'Home_page': (context) => Home(),
        'song_details': (context) => song_page(),
        'video_details': (context) => Video_detalis(),
      }));
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late TabController tabController;
  List<Widget> tablist = [
    audio(),
    video_player(),
  ];
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: TabBar(
          controller: tabController,
          tabs: <Tab>[
            Tab(
              icon: Icon(Icons.audio_file_outlined),
              text: "Audio",
            ),
            Tab(
              icon: Icon(Icons.video_call_outlined),
              text: "Video",
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: tablist,
      ),
    );
  }
}
