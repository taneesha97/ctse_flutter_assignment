import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/movie.dart';
import '../../../styles.dart';
import '../../../util/crud_model.dart';
import '../moviecard/long_movie_card.dart';

class LongMovieCategory extends StatefulWidget {
  const LongMovieCategory({Key? key}) : super(key: key);

  @override
  State<LongMovieCategory> createState() => _LongMovieCategoryState();
}

class _LongMovieCategoryState extends State<LongMovieCategory> {
  @override
  Widget build(BuildContext context) {
    // Provider to the fetch all the movies.
    Stream<QuerySnapshot> movies =
        Provider.of<CrudModel>(context, listen: false).movies;

    // Custom Provider.
    Stream<List<Movie>> listMovies = Provider.of<CrudModel>(context).getListOfMoviesShort;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        elevation: 0,
        toolbarHeight: 10,
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 10,
          left: 10,
          right: 10,
        ),
        child: Container(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            Text(
              "All Libraries",
              style: Styles.textSectionHeader,
            ),
            Text(
              "Custom Libraries to Manage Favorite Movies",
              style: Styles.textSectionSubBody,
            ),
            SizedBox(
              height: 10,
            ),
            Flexible(
                child: StreamBuilder<List<Movie>>(
              stream: listMovies,
              builder: (BuildContext context, snapshot) {
                if (snapshot.hasError) {
                  return Text("There an Error Loading Movies");
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Text("Loading");
                }
                final data = snapshot.requireData;

                return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return LongMovieCard(index: index);
                  },
                );
              },
            )),
          ],
        )),
      ),
    );
  }
}
