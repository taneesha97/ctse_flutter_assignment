import 'package:flutter/material.dart';

class SingleMoviePage extends StatelessWidget {
  const SingleMoviePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("This is single movie page"),
      ),
    );
  }
}
