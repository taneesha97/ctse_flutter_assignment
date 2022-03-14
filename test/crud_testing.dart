import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ctse_assignment_1/models/movie.dart';
import 'package:ctse_assignment_1/util/crud_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';



void main() async {

  final firestore  = FakeFirebaseFirestore();
  final snapshot = await firestore.collection('movies').snapshots();



  Stream<List<Movie>> listOfMovies () {
    //final Stream<QuerySnapshot> _movieStream = FirebaseFirestore.instance.collection('movies').snapshots();
    return snapshot.map((event) => event.docs.map((e) => Movie(
      id: e.get("id") ?? 2,
      title: e.get("name") ?? "default",
      imageUrl: e.get("title") ?? "default",
      description: e.get("id") ?? "default",
      rating: e.get("id") ?? "default",
      year: e.get("id") ?? "default",
      duration: e.get("id") ?? "default",
    )).toList());
  }

  test("Testing the Crud Operations with Firestore Streams.", () async {
    await firestore.collection("movies").add({
    "id": 'tt4154796',
    "title": 'Avengers: Endgame',
    "imageUrl": 'https://m.media-amazon.com/images/M/MV5BMTc5MDE2ODcwNV5BMl5BanBnXkFtZTgwMzI2NzQ2NzM@._V1_SX300.jpg',
    "description": 'After the devastating events of Avengers: Infinity War (2018), the universe is in ruins. With the help of remaining allies, the Avengers assemble once more in order to reverse...',
    "rating": '8.6',
    "year": '2019',
    "duration": '181 min',
    'created_at': FieldValue.serverTimestamp(),
    });

    // Arrange.
    Stream<List<Movie>> movies = listOfMovies();

    //Act

    // Asset
    movies.listen((event) => print(event.length));

  });


}