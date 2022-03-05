import 'package:flutter/material.dart';

class QuizeList extends StatefulWidget {
  @override
  _QuizeListState createState() => _QuizeListState();
}
//
class _QuizeListState extends State<QuizeList> {
  List category = ["Romantic", "Horror","Thriller","Animation","Romantic","Action","Romantic","Horror"];
  List time = ["20min", "10min","20min","15min","20min", "10min","20min","15min"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Quize List",
          style: TextStyle(color: Colors.black),
        ),
      ),

    );
  }
}
