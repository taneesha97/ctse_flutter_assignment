import 'package:flutter/material.dart';

import '../moviecard/long_movie_card.dart';

class LongMovieCategory extends StatelessWidget {
  const LongMovieCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 500,
        child: ListView(
          children: [
            Column(
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
                LongMovieCard(),
              ],
            ),
          ],
        ));
  }
}
