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
  Stream<List<Movie>>  get getListOfMovies{
    return _movieStream.map((event) => event.docs.map((e) => Movie(
      id: e["id"] ?? '',
      title: e["title"] ?? "default",
      imageUrl: e["imageUrl"] ?? "default",
      description: e["description"] ?? "default",
      rating: e["rating"] ?? "default",
      year: e["year"] ?? "default",
      duration: e["duration"] ?? "default",
    )).toList());
  }
}