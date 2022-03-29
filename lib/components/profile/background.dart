import 'package:flutter/material.dart';

class Background extends StatefulWidget {
  final Widget child;

  Background({Key? key, required this.child}) : super(key: key);

  @override
  State<Background> createState() => _BackgroundState();
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
              top: 0,
              //left: 0,
              child: Image.asset(
                "assets/images/Rectangle 64.png",
                height: size.height * 0.3,
                width: size.width,
              )),
          Positioned(
              bottom: 0,
              left: 0,
              child: Image.asset(
                "assets/images/Rectangle 63.png",
                width: size.width * 0.3,
              )),
          widget.child
        ],
      ),
    );
  }
}
