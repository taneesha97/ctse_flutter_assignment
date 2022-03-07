import 'dart:typed_data';

import 'package:audioplayers/audioplayers.dart';
import 'package:ctse_assignment_1/components/progressbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

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
    // Future.delayed(Duration.zero, () async {
    //   ByteData bytes =
    //       await rootBundle.load(audioasset); //load audio from assets
    //   audiobytes =
    //       bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);
    //   //convert ByteData to Uint8List
    //
    //   player.onDurationChanged.listen((Duration d) {
    //     //get the duration of audio
    //     maxduration = d.inMilliseconds;
    //     setState(() {});
    //   });
    //
    //   player.onAudioPositionChanged.listen((Duration p) {
    //     currentpos =
    //         p.inMilliseconds; //get the current position of playing audio
    //
    //     //generating the duration label
    //     int shours = Duration(milliseconds: currentpos).inHours;
    //     int sminutes = Duration(milliseconds: currentpos).inMinutes;
    //     int sseconds = Duration(milliseconds: currentpos).inSeconds;
    //
    //     int rhours = shours;
    //     int rminutes = sminutes - (shours * 60);
    //     int rseconds = sseconds - (sminutes * 60 + shours * 60 * 60);
    //
    //     currentpostlabel = "$rhours:$rminutes:$rseconds";
    //
    //     setState(() {
    //       //refresh the UI
    //     });
    //   });
    // });
    // super.initState();
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
                // Container(
                //   child: Column(
                //     children: [
                //       Container(
                //         child: Text(
                //           currentpostlabel,
                //           style: TextStyle(fontSize: 25),
                //         ),
                //       ),
                //       Container(
                //           child: Slider(
                //         value: double.parse(currentpos.toString()),
                //         min: 0,
                //         max: double.parse(maxduration.toString()),
                //         divisions: maxduration,
                //         label: currentpostlabel,
                //         onChanged: (double value) async {
                //           int seekval = value.round();
                //           int result = await player
                //               .seek(Duration(milliseconds: seekval));
                //           if (result == 1) {
                //             //seek successful
                //             currentpos = seekval;
                //           } else {
                //             print("Seek unsuccessful.");
                //           }
                //         },
                //       )),
                //       Container(
                //         child: Wrap(
                //           spacing: 10,
                //           children: [
                //             ElevatedButton.icon(
                //                 onPressed: () async {
                //                   if (!isplaying && !audioplayed) {
                //                     int result =
                //                         await player.playBytes(audiobytes);
                //                     if (result == 1) {
                //                       //play success
                //                       setState(() {
                //                         isplaying = true;
                //                         audioplayed = true;
                //                       });
                //                     } else {
                //                       print("Error while playing audio.");
                //                     }
                //                   } else if (audioplayed && !isplaying) {
                //                     int result = await player.resume();
                //                     if (result == 1) {
                //                       //resume success
                //                       setState(() {
                //                         isplaying = true;
                //                         audioplayed = true;
                //                       });
                //                     } else {
                //                       print("Error on resume audio.");
                //                     }
                //                   } else {
                //                     int result = await player.pause();
                //                     if (result == 1) {
                //                       //pause success
                //                       setState(() {
                //                         isplaying = false;
                //                       });
                //                     } else {
                //                       print("Error on pause audio.");
                //                     }
                //                   }
                //                 },
                //                 icon: Icon(
                //                     isplaying ? Icons.pause : Icons.play_arrow),
                //                 label: Text(isplaying ? "Pause" : "Play")),
                //             ElevatedButton.icon(
                //                 onPressed: () async {
                //                   int result = await player.stop();
                //                   if (result == 1) {
                //                     //stop success
                //                     setState(() {
                //                       isplaying = false;
                //                       audioplayed = false;
                //                       currentpos = 0;
                //                     });
                //                   } else {
                //                     print("Error on stop audio.");
                //                   }
                //                 },
                //                 icon: Icon(Icons.stop),
                //                 label: Text("Stop")),
                //           ],
                //         ),
                //       ),
                //     ],
                //   ),
                // ),

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
