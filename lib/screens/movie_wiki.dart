import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ctse_assignment_1/components/movie/moviecard/medium_movie_card.dart';
import 'package:ctse_assignment_1/components/movie/moviecategory/movie_category.dart';
import 'package:ctse_assignment_1/screens/movie_all.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../util/crud_model.dart';

class MovieWiki extends StatelessWidget {
  late QuerySnapshot<Object?> array_data;

  MovieWiki({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Provider Movies - Changed to the Appropriate movie list.
    Stream<QuerySnapshot> movies =
        Provider.of<CrudModel>(context, listen: false).movies;
    return Scaffold(
      body: Container(
          margin: EdgeInsets.only(
            top: 24,
          ),
          child: SingleChildScrollView(
              child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(
                  left: 9,
                  top: 7,
                ),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Movie Categories",
                        style: TextStyle(
                          fontFamily: "Raleway",
                          fontWeight: FontWeight.w600,
                          fontSize: 30,
                        ))),
              ),
              const Padding(
                padding: EdgeInsets.only(
                  left: 9,
                ),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Categories",
                      style: TextStyle(fontFamily: "Raleway", fontSize: 20),
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
                              builder: (context) =>
                                  AllMovieScreen(index: array_data)),
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
                child: StreamBuilder<QuerySnapshot>(
                  stream: movies,
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError) {
                      return Text("There an Error Loading Movies");
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Text("Loading");
                    }
                    final data = snapshot.requireData;
                    array_data = data;

                    return ListView.builder(
                      itemCount: data.size,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return CustomCard(index: index);
                      },
                    );
                  },
                ),
              ),
              Container(
                child: MovieCategory(),
              ),
              Container(
                child: MovieCategory(),
              ),
            ],
          ))),
    );
  }
}
