import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';

import '../models/library_model.dart';
import '../models/movie.dart';

class CrudModel extends ChangeNotifier {
  final Stream<QuerySnapshot> _movieStream =
      FirebaseFirestore.instance.collection('movies').snapshots();

  // Testing Constructor.
  CrudModel();

  // Getter for the User Steam.
  Stream<QuerySnapshot> get movies {
    return _movieStream;
  }

  // Getter for the private testing variable.
  Stream<List<Movie>> get getListOfMovies {
    Stream<QuerySnapshot> movieStreams =
        FirebaseFirestore.instance.collection('movies').snapshots();

    return movieStreams.map((event) => event.docs
        .map((e) => Movie(
              id: e["id"] ?? '',
              title: e["title"] ?? "default",
              imageUrl: e["imageUrl"] ?? "default",
              description: e["description"] ?? "default",
              rating: e["rating"] ?? "default",
              year: e["year"] ?? "default",
              duration: e["duration"] ?? "default",
            ))
        .toList());
  }

  // Getter for the list of movies (Short hand method.) - Not yet tested.
  Stream<List<Movie>> get getListOfMoviesShort {
    return FirebaseFirestore.instance.collection("movies").snapshots().map(
            (event) => event.docs.map((e) => Movie.fromMap(e.data())).toList());
  }

  // Method to add libraries to the Firebase.
  Future addLibraries(Library library) async {
    final addLibrary = FirebaseFirestore.instance.collection("libraries").doc();
    library.id = addLibrary.id;
    final json = library.toJson();
    await addLibrary.set(json);
  }

  // Get a List of Libraries.
  Stream<List<Library>> get getListOfLibraries {
    return FirebaseFirestore.instance.collection("libraries").snapshots().map(
        (event) => event.docs.map((e) => Library.fromMap(e.data())).toList());
  }
}
