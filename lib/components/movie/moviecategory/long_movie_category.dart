import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ctse_assignment_1/models/movie_select_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/movie.dart';
import '../../../styles.dart';
import '../../../util/crud_model.dart';
import '../moviecard/long_movie_card.dart';

class LongMovieCategory extends StatefulWidget {
  final String category;
  const LongMovieCategory({Key? key, required this.category}) : super(key: key);

  @override
  State<LongMovieCategory> createState() => _LongMovieCategoryState();
}

class _LongMovieCategoryState extends State<LongMovieCategory> {
  TextEditingController _searchController = TextEditingController();

  @override
  void initState(){
    super.initState();
    _searchController.addListener(_onSearchChange);
  }

  _onSearchChange(){
    print(_searchController.text);
  }


  @override
  Widget build(BuildContext context) {
    // Provider to the fetch all the movies.
    Stream<QuerySnapshot> movies =
        Provider.of<CrudModel>(context, listen: false).movies;

    // Custom Provider.
    Stream<List<SelectedMovieModel>> listMovies = Provider.of<CrudModel>(context).getListOfMoviesShort;


    // Conditionally select the Provider Method.
    Stream<List<SelectedMovieModel>> movies1;
    if (widget.category == "All Movies"){
      movies1 = Provider.of<CrudModel>(context).getListOfMoviesShort;
    } else {
      movies1 = Provider.of<CrudModel>(context).getMoviesFromCategories(widget.category);
    }




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
              widget.category,
              style: Styles.textSectionHeader,
            ),
            Text(
              "Custom Libraries to Manage Favorite Movies",
              style: Styles.textSectionSubBody,
            ),
            SizedBox(
              height: 10,
            ),

            // Search Bar for the All Movies.
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search);
              ),
            ),



            Flexible(
                child: StreamBuilder<List<SelectedMovieModel>>(
              stream: movies1,
              builder: (BuildContext context, snapshot) {
                if (snapshot.hasError) {
                  return Text("There an Error Loading Movies");
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Text("Loading");
                }
                final data = snapshot.requireData;

                if(data.length != 0){
                  return ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return LongMovieCard(index: index, movie: data[index],);
                    },
                  );
                } else {
                  return Center(child: Column(
                    children: [

                      const Text("No such category in the system!"),
                    ],
                  ));
                }
              },
            )),
          ],
        )),
      ),
    );
  }
}
