import 'dart:typed_data';

import 'package:audioplayers/audioplayers.dart';
import 'package:ctse_assignment_1/components/progressbar.dart';
import 'package:ctse_assignment_1/util/Quizes/quiz_crud_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

import 'Options.dart';

class AudioQuizBody extends StatefulWidget {
  
  AudioQuizBody({Key? key}) : super(key: key);

  @override
  State<AudioQuizBody> createState() => _AudioQuizBodyState();
}

class _AudioQuizBodyState extends State<AudioQuizBody> {
  VideoPlayerController? _controller;
  int maxduration = 100;
  int currentpos = 0;
  String currentpostlabel = "00:00";
  String audioasset = "assets/audio/music2.mp3";
  bool isplaying = false;
  bool audioplayed = false;
  late Uint8List audiobytes;

  AudioPlayer player = AudioPlayer();

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        'https://www.youtube.com/watch?v=8FAUEv_E_xQ&list=RD8FAUEv_E_xQ&start_radio=1')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });

  }

  @override
  Widget build(BuildContext context) {
    var audio = AudioPlayer();
    bool isplaying = false;
    return SafeArea(
        child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          SizedBox(
            height: 8,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 4),
            padding: EdgeInsets.all(12),
            width: double.infinity,
            decoration: BoxDecoration(
                color: Color.fromARGB(196, 151, 151, 163),
                borderRadius: BorderRadius.circular(25)),
            child: Column(
              children: [
                Text.rich(
                  TextSpan(
                      text: "1",
                      style: Theme.of(context).textTheme.headline6,
                      // .copyWith(color: Colors.black54
                      // ),
                      children: [
                        TextSpan(
                          text: "/10",
                          style: Theme.of(context).textTheme.headline6,
                        )
                      ]),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "Guess the Movie",
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(color: Colors.blueGrey),
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    IconButton(
                        icon: const Icon(Icons.play_arrow),
                        onPressed: () {
                          _controller?.play();
                          audio.play(
                              'https://youtu.be/8FAUEv_E_xQ');
                        }),
                    IconButton(
                        icon: const Icon(Icons.pause),
                        onPressed: () {
                          audio.pause();
                        }),
                    IconButton(
                        icon: const Icon(Icons.stop),
                        onPressed: () {
                          audio.stop();
                        }),
                  ],
                ),


                SizedBox(
                  height: 16,
                ),
                ListView.builder(
                  itemCount: 4,
                  shrinkWrap: true,
                  itemBuilder: (context, index) => Options(),
                ),
                SizedBox(
                  height: 16,
                ),
                ProgressBar(),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
