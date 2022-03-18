import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../styles.dart';

class MoviesStatusTag extends StatelessWidget {
  final String status;
  final MaterialColor color;
  const MoviesStatusTag({Key? key, required this.status, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10.0),
          bottomLeft: Radius.circular(10.0),
          topRight: Radius.circular(10.0),
          bottomRight: Radius.circular(10.0),
        ),
        color: color,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.4),
            spreadRadius: 2,
            blurRadius: 8,
          ),
        ],
      ),
      child: Text(status, style: Styles.textSectionSubBody,),
    );
  }
}
