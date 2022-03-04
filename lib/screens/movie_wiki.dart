import 'package:ctse_assignment_1/components/movie/moviecard/card_custom.dart';
import 'package:ctse_assignment_1/components/movie/moviecategory/movie_category.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import '../styles.dart';

class MovieWiki extends StatelessWidget {
  const MovieWiki({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Movie Wiki"),
        backgroundColor: primaryColor,
        centerTitle: true,
      ),
      body: Container(
          child: SingleChildScrollView(
              child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 15,
          ),
          const Padding(
            padding: EdgeInsets.only(
              left: 9,
            ),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Movie Categories",
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
                  style: TextStyle(
                      fontFamily: "Raleway",
                      fontSize: 20),
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 20,
              top: 5,
              right: 20,
            ),
            child: Row (
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
                  onPressed: () {},
                ),
              ],
            ),
          ),

          const SizedBox(
            height: 3,
          ),
          SizedBox(
            height: 200,
            child: ListView.builder(
                itemCount: 10,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Container(
                      child: CustomCard(title: "Spider-Man", year: 2007),
                    )),
          ),
          Flexible(
            child: ListView.builder(
              itemCount: 1,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) => ListTile(
                title: MovieCategory(),
              ),
            ),
          )
        ],
      ))),
    );
  }
}
