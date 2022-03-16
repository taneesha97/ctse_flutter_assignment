import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ctse_assignment_1/components/movie/moviecard/long_library_movie_card.dart';
import 'package:flutter/material.dart';
import '../components/movie/moviecategory/long_movie_category.dart';
import '../constants.dart';

class AllMovieScreen extends StatelessWidget {

  const AllMovieScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(
          top: 100,
        ),
        child: LongLibraryMovieCard(index: 5,),
      )
    );
  }
}
