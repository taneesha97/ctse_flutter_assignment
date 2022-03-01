import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("This is my card component", style: TextStyle(fontWeight: FontWeight.bold)),
    );
  }
}
