import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MovieMultiSelect extends StatefulWidget {
  const MovieMultiSelect({Key? key}) : super(key: key);

  @override
  _MovieMultiSelectState createState() => _MovieMultiSelectState();
}

class _MovieMultiSelectState extends State<MovieMultiSelect> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movie Multi Select"),
      ),
    );
  }
}
