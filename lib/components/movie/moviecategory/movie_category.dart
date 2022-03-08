import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../util/crud_model.dart';
import '../moviecard/small_movie_card.dart';

class MovieCategory extends StatelessWidget {
  const MovieCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Later Changed this to relevant category of movies.
    Stream<QuerySnapshot> movies = Provider.of<CrudModel>(context, listen: false).movies;
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
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
              )
            ],
          ),
        ),
        Container(
          height: 230,
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
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index){
                  return MovieCard(index: index);
                },
              );
            },
          )
        )
      ],
    );
  }
}
