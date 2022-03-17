import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ctse_assignment_1/models/movie_select_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/movie/moviecard/movie_select.dart';
import '../util/crud_model.dart';

class MovieMultiSelect extends StatefulWidget {
  final String libraryId;
  const MovieMultiSelect({Key? key, required this.libraryId}) : super(key: key);

  @override
  _MovieMultiSelectState createState() => _MovieMultiSelectState();
}

class _MovieMultiSelectState extends State<MovieMultiSelect> {
  List<SelectedMovieModel> selectedMovies = [];

  // Temporary Hard coded Array List;

  /// Drop this model and replaced it with the movies model.

  List<SelectedMovieModel> selectableMovies = [

  ];

  @override
  Widget build(BuildContext context) {
    // Importing the movies from Provider.
    Stream<List<SelectedMovieModel>> movies =
        Provider.of<CrudModel>(context, listen: false).getListOfMoviesShortSelectable;

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
              child: StreamBuilder<List<SelectedMovieModel>>(
                stream: movies,
                builder: (context, snapshot) {
                  final movies = snapshot.data!;
                  return ListView.builder(
                    itemCount: movies.length,
                    itemBuilder: (BuildContext context, int index){
                      return SelectableMovie(selectedMovieModel: movies[index], selectedMoviesListRef: selectedMovies);
                    },
                  );
                }
              ),
            ),
            Flexible(
              flex: 1,
              child: ElevatedButton(
                onPressed: () { print(widget.libraryId); },
                child: const Text("Add Movies to the Library"),
              ),
            )
          ],
        ),

        )
    );
  }
}
