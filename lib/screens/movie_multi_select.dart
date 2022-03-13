import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../util/crud_model.dart';

class MovieMultiSelect extends StatefulWidget {
  const MovieMultiSelect({Key? key}) : super(key: key);

  @override
  _MovieMultiSelectState createState() => _MovieMultiSelectState();
}

class _MovieMultiSelectState extends State<MovieMultiSelect> {
  @override
  Widget build(BuildContext context) {
    // Importing the movies from Provider.
    Stream<QuerySnapshot> movies =
        Provider.of<CrudModel>(context, listen: false).movies;

    // Importing Movie List from The Steam - Prototype.


    return Scaffold(
      appBar: AppBar(
        title: Text("Movie Multi Select"),
      ),
      body:
        SafeArea(child: Container(
          child: ListView.builder(
            itemCount: 4,
            itemBuilder: (BuildContext context, int index){
              return Text("this");
            },
          ),
        ),

        )
    );
  }
}
