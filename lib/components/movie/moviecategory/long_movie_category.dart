import 'package:flutter/material.dart';

import '../../../models/movie.dart';
import '../moviecard/long_movie_card.dart';

class LongMovieCategory extends StatelessWidget {
  const LongMovieCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              child: ListView.builder(
                itemCount: movieList.length,
                itemBuilder: (ctx,i) => LongMovieCard(index: i),
              ),
            ),
          ],
        ));
  }
}
