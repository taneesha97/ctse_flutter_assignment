import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../components/movie/moviecategory/long_movie_category.dart';
import '../constants.dart';

class AllMovieScreen extends StatelessWidget {

  const AllMovieScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: LongMovieCategory(),
      )
    );
  }
}
