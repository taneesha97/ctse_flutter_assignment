import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    // Input Parameters.
    Key? key,
    this.image,
    this.title,
    this.year,
    this.press,

  }) : super(key: key);

  // Attributes. (Card)
  final String? image, title;
  final int? year;
  final Function? press;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("This is my card component", style: TextStyle(fontWeight: FontWeight.bold)),
    );
  }
}
