import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ctse_assignment_1/models/movie_select_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/movie/moviecard/movie_select.dart';
import '../util/crud_model.dart';

class MovieMultiSelect extends StatefulWidget {
  const MovieMultiSelect({Key? key}) : super(key: key);

  @override
  _MovieMultiSelectState createState() => _MovieMultiSelectState();
}

class _MovieMultiSelectState extends State<MovieMultiSelect> {
  List<SelectedMovieModel> selectedMovies = [];

  // Temporary Hard coded Array List;

  /// Drop this model and replaced it with the movies model.

  List<SelectedMovieModel> selectableMovies = [
    SelectedMovieModel("title", "imageUrl", true, 1908),
    SelectedMovieModel("title", "imageUrl", true, 1908),
    SelectedMovieModel("title", "imageUrl", true, 1908),
    SelectedMovieModel("title", "imageUrl", true, 1908),
    SelectedMovieModel("title", "imageUrl", true, 1908),
    SelectedMovieModel("title", "imageUrl", true, 1908),
    SelectedMovieModel("title", "imageUrl", true, 1908),
    SelectedMovieModel("title", "imageUrl", true, 1908),
    SelectedMovieModel("title", "imageUrl", true, 1908),
    SelectedMovieModel("title", "imageUrl", true, 1908),
    SelectedMovieModel("title", "imageUrl", true, 1908),
    SelectedMovieModel("title", "imageUrl", true, 1908),
  ];

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
        SafeArea(child: Column(
          children: [
            Flexible(
              flex: 9,
              child: ListView.builder(
                itemCount: selectableMovies.length,
                itemBuilder: (BuildContext context, int index){
                  return SelectableMovie(selectedMovieModel: selectableMovies[index], selectedMoviesListRef: selectedMovies);
                },
              ),
            ),
            Flexible(
              flex: 1,
              child: ElevatedButton(
                onPressed: () {  },
                child: const Text("Add Movies to the Library"),
              ),
            )
          ],
        ),

        )
    );
  }
}
