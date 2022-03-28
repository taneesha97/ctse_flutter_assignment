import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ctse_assignment_1/components/movie/moviecard/medium_movie_card.dart';
import 'package:ctse_assignment_1/components/movie/moviecategory/movie_category.dart';
import 'package:ctse_assignment_1/models/movie_select_model.dart';
import 'package:ctse_assignment_1/screens/movie_all.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/movie/moviecategory/long_movie_category.dart';
import '../styles.dart';
import '../util/crud_model.dart';

class MovieWiki extends StatelessWidget {
  late QuerySnapshot<Object?> array_data;

  MovieWiki({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Provider Movies - Changed to the Appropriate movie list.
    Stream<List<SelectedMovieModel>> movies =
        Provider.of<CrudModel>(context, listen: false).getListOfMoviesShort;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        elevation: 0,
        toolbarHeight: 10,
      ),
      body: Container(
          margin: EdgeInsets.only(
            top: 10,
          ),
          child: SingleChildScrollView(
              child: Column(
            children: [
               Padding(
                padding: EdgeInsets.only(
                  left: 9,
                ),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Movie Categories",
                        style: Styles.textSectionHeader)),
              ),
               Padding(
                padding: EdgeInsets.only(
                  left: 9,
                ),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Categories",
                      style: Styles.textSectionSubBody,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                  right: 5,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Recommended",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      child: const Text("View All"),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LongMovieCategory(category: "All Movies",)
                                  ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 3,
              ),
              SizedBox(
                height: 200,
                child: StreamBuilder<List<SelectedMovieModel>>(
                  stream: movies,
                  builder: (BuildContext context, snapshot) {
                    if (snapshot.hasError) {
                      return Text("There an Error Loading Movies");
                    }
                    else if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator(),);
                    }
                    else if (snapshot.hasData){
                      final data = snapshot.requireData;
                      return ListView.builder(
                        itemCount: data.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return CustomCard(index: index, movie: data[index],);
                        },
                      );
                    } else {
                      return Center(child: CircularProgressIndicator(),);
                    }
                  },
                ),
              ),
              Container(
                child: MovieCategory(category: "Action",),
              ),
              Container(
                child: MovieCategory(category: "Crime",),
              ),
            ],
          ))),
    );
  }
}
