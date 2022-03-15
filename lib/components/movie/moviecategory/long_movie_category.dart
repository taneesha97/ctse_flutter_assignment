import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/movie.dart';
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
    Stream<QuerySnapshot> movies = Provider.of<CrudModel>(context, listen: false).movies;
    return Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
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
                    onPressed: () {},
                  ),
                ],
              ),
            ),

            Container(
              height: MediaQuery.of(context).size.height - 128,
              child: StreamBuilder<QuerySnapshot>(
                stream: movies,
                builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
                  if(snapshot.hasError){
                    return Text("There an Error Loading Movies");
                  }
                  if(snapshot.connectionState == ConnectionState.waiting){
                    return Text("Loading");
                  }
                  final data = snapshot.requireData;

                  return ListView.builder(
                    itemCount: data.size,
                    itemBuilder: (context, index){
                      return LongMovieCard(index: index);
                    },
                  );
                },
              )
            ),
            // Flexible(
            //   child: ListView.builder(
            //       itemCount: 4,
            //       itemBuilder: (context, index){
            //         return LongMovieCard(index: index);
            //       }),
            // )
          ],
        ));
  }
}
