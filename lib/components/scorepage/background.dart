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
              bottom: -120,
              right: 0,
              child: Image.asset(
                "assets/images/Rectangle65.png",
                width: size.width * 1,
              )),
          widget.child
        ],
      ),
    );
  }
}
