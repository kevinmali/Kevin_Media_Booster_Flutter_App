import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Views/android_screen/audio_screen.dart';
import 'Views/android_screen/search_page.dart';
import 'Views/android_screen/video_player.dart';

void main () {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(useMaterial3: true),
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin{
  late TabController tabController ;
  List<Widget> tablist = [
    audio(),
    video_player(),
    search(),
  ];
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
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
            Tab(
              icon: Icon(Icons.library_add_check),
              text: "Library",
            ),
          ],
        ),
      ),
      body: TabBarView(
          controller : tabController ,
          children: tablist,),
    );
  }
}
