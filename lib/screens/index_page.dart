import 'package:ctse_assignment_1/components/movie/moviecard/long_library_movie_card.dart';
import 'package:ctse_assignment_1/components/movie/moviecategory/long_movie_category.dart';
import 'package:ctse_assignment_1/screens/movie_library_list.dart';
import 'package:ctse_assignment_1/screens/movie_multi_select.dart';
import 'package:ctse_assignment_1/screens/movie_single.dart';
import 'package:ctse_assignment_1/screens/movie_wiki.dart';
import 'package:ctse_assignment_1/screens/quice_configuration_screen.dart';
import 'package:ctse_assignment_1/screens/quice_configuration_splash.dart';
import 'package:ctse_assignment_1/screens/quiz_screen.dart';
import 'package:ctse_assignment_1/screens/score_screen.dart';
import 'package:ctse_assignment_1/util/crud_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../styles.dart';
import 'movie_all.dart';
import 'movie_library_form.dart';

class IndexPage extends StatelessWidget {
  const IndexPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.black,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(
                  left: 20,
                  top: 20,
                ),
                child: Text(
                  "Index Page",
                  style: TextStyle(
                    fontSize: 25,
                    fontFamily: "Relaway",
                    color: Colors.white,
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(
                  left: 20,
                ),
                child: Text(
                  "Index Page",
                  style: TextStyle(
                    fontSize: 15,
                    fontStyle: FontStyle.italic,
                    fontFamily: "Relaway",
                    color: Colors.white,
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Styles.indexPurple, // background
                      onPrimary: Colors.white,
                      padding: const EdgeInsets.all(20.0),
                      fixedSize: const Size(640, 70),
                      // foreground
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MovieWiki()),
                      );
                    },
                    child: const Text(
                      'Movie Wiki Page',
                      style: TextStyle(
                          fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Styles.indexPurple, // background
                      onPrimary: Colors.white,
                      padding: const EdgeInsets.all(20.0),
                      fixedSize: const Size(640, 70),
                      // foreground
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>  const SingleMoviePage(index: 1,)),
                      );
                    },
                    child: const Text(
                      'Single Movie Page',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Styles.indexPurple, // background
                      onPrimary: Colors.white,
                      padding: const EdgeInsets.all(20.0),
                      fixedSize: const Size(640, 70),
                      // foreground
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>  QuizScreen()),
                      );
                    },
                    child: const Text(
                      'Audio Quiz',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Styles.indexPurple, // background
                      onPrimary: Colors.white,
                      padding: const EdgeInsets.all(20.0),
                      fixedSize: const Size(640, 70),
                      // foreground
                    ),

                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>  MovieMultiSelect()),
                      );
                    },
                    child: const Text(
                      'Movie Multi Select',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),




                  // Testing Button
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Styles.indexPurple, // background
                      onPrimary: Colors.white,
                      padding: const EdgeInsets.all(20.0),
                      fixedSize: const Size(640, 70),
                      // foreground
                    ),

                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>  AllMovieScreen()),
                      );
                    },
                    child: const Text(
                      'All Movies Page',
                      style:
                      TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Styles.indexPurple, // background
                      onPrimary: Colors.white,
                      padding: const EdgeInsets.all(20.0),
                      fixedSize: const Size(640, 70),
                      // foreground
                    ),

                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>  LibraryList()),
                      );
                    },
                    child: const Text(
                      'Library List',
                      style:
                      TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Styles.indexPurple, // background
                      onPrimary: Colors.white,
                      padding: const EdgeInsets.all(20.0),
                      fixedSize: const Size(640, 70),
                      // foreground
                    ),

                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>  LibraryForm()),
                      );
                    },
                    child: const Text(
                      'Library Form',
                      style:
                      TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Styles.indexPurple, // background
                      onPrimary: Colors.white,
                      padding: const EdgeInsets.all(20.0),
                      fixedSize: const Size(640, 70),
                      // foreground
                    ),

                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>  SplashQuiceConfig()),
                      );
                    },
                    child: const Text(
                      'Score Page',
                      style:
                      TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Styles.indexPurple, // background
                      onPrimary: Colors.white,
                      padding: const EdgeInsets.all(20.0),
                      fixedSize: const Size(640, 70),
                      // foreground
                    ),

                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>  DropDown()),
                      );
                    },
                    child: const Text(
                      'Quiz configurationForm',
                      style:
                      TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
