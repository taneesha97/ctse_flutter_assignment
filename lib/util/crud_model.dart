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

  // Getter for the list of movies (Short hand method.) - Not yet tested.
  Stream<List<Movie>>  get getListOfMoviesShort{
    Stream<List<Movie>> movies = _movieStream.map((event) => event.docs.map((e) => e.data() as Map<String, dynamic>)).toList() as Stream<List<Movie>>;
    return movies;
  }

  // Method to add libraries to the Firebase.
  Future addLibraries(Movie movie){
    final
  }
}