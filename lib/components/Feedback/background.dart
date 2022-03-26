import 'package:flutter/material.dart';

class Background extends StatefulWidget {
  final Widget child;

  Background({Key? key, required this.child}) : super(key: key);
  @override
  _BackgroundState createState() => _BackgroundState();
}

class _BackgroundState extends State<Background> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
              bottom: 0,
              left: -50,
              child: Image.asset(
                "assets/images/MovieQuizImage.jpg",
                width: size.width * 0.3,
              )),
          widget.child
        ],
      ),
    );
  }
}
