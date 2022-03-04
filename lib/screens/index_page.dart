import 'package:ctse_assignment_1/screens/movie_single.dart';
import 'package:ctse_assignment_1/screens/movie_wiki.dart';
import 'package:ctse_assignment_1/screens/quiz_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../styles.dart';

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
                    child: Text(
                      'Movie Wiki Page',
                      style: const TextStyle(
                          fontSize: 25, fontWeight: FontWeight.bold),
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
                            builder: (context) =>  SingleMoviePage()),
                      );
                    },
                    child: Text(
                      'Single Movie Page',
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
                            builder: (context) =>  QuizScreen()),
                      );
                    },
                    child: Text(
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
                    onPressed: () {},
                    child: Text(
                      'Movie Wiki Page',
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
                    onPressed: () {},
                    child: Text(
                      'Movie Wiki Page',
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
                    onPressed: () {},
                    child: Text(
                      'Movie Wiki Page',
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
                    onPressed: () {},
                    child: Text(
                      'Movie Wiki Page',
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
                    onPressed: () {},
                    child: Text(
                      'Movie Wiki Page',
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
                    onPressed: () {},
                    child: Text(
                      'Movie Wiki Page',
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
                    onPressed: () {},
                    child: Text(
                      'Movie Wiki Page',
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
                    onPressed: () {},
                    child: Text(
                      'Movie Wiki Page',
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
                    onPressed: () {},
                    child: Text(
                      'Movie Wiki Page',
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
                    onPressed: () {},
                    child: Text(
                      'Movie Wiki Page',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 15,
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
