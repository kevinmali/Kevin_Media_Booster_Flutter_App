import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:whtsapp/model/list_video.dart';
import 'package:whtsapp/model/video_model.dart';

class video_player extends StatefulWidget {
  const video_player({super.key});

  @override
  State<video_player> createState() => _video_playerState();
}

class _video_playerState extends State<video_player> {
  CarouselController carouselController = CarouselController();
  int i = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(children: [
            CarouselSlider(
              carouselController: carouselController,
              options: CarouselOptions(
                  height: 700,
                  viewportFraction: 0.6,
                  enlargeCenterPage: true,
                  scrollDirection: Axis.vertical,
                  onPageChanged: (val, _) {
                    setState(() {
                      i = val;
                    });
                  }),
              items: listvideo
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
                          height: 360,
                          width: 390,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Image.asset(
                            e['vimage'],
                            fit: BoxFit.fill,
                          ),
                        ),
                      ))
                  .toList(),
            ),
          ]),
        ),
      ),
    );
  }
}
