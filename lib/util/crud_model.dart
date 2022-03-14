import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import '../models/movie.dart';

class CrudModel extends ChangeNotifier{

  final Stream<QuerySnapshot> _movieStream = FirebaseFirestore.instance.collection('movies').snapshots();

  // Testing Constructor.
  CrudModel();

  // Getter for the User Steam.
  Stream<QuerySnapshot> get movies {
    return _movieStream;
  }

  // Getter for the private testing variable.
  // Stream<List<Movie>>  get getListOfMovies{
  //   return _movieStream.map((event) => event.docs.map((e) => Movie(
  //     id: e.data()["id"] ?? 2,
  //     title: e.data()["title"] ?? "default",
  //     imageUrl: e.data()["imageUrl"] ?? "default",
  //     description: e.data()["description"] ?? "default",
  //     rating: e.data()["rating"] ?? "default",
  //     year: e.data()["year"] ?? "default",
  //     duration: e.data()["duration"] ?? "default",
  //   )).toList());
  // }


}