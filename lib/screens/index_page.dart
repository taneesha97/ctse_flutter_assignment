import 'package:ctse_assignment_1/components/movie/moviecard/long_library_movie_card.dart';
import 'package:ctse_assignment_1/components/movie/moviecategory/long_movie_category.dart';

import 'package:ctse_assignment_1/screens/Sample%20Screen/sampleScreen.dart';

import 'package:ctse_assignment_1/screens/leader_board.dart';
import 'package:ctse_assignment_1/screens/feedback_form.dart';

import 'package:ctse_assignment_1/screens/movie_library_list.dart';
import 'package:ctse_assignment_1/screens/Sample%20Screen/sampleScreen.dart';

import 'package:ctse_assignment_1/screens/movie_multi_select.dart';
import 'package:ctse_assignment_1/screens/movie_single.dart';
import 'package:ctse_assignment_1/screens/movie_wiki.dart';
import 'package:ctse_assignment_1/screens/navigation_screen.dart';
import 'package:ctse_assignment_1/screens/quice_configuration_screen.dart';
import 'package:ctse_assignment_1/screens/quice_configuration_splash.dart';
import 'package:ctse_assignment_1/screens/quiz_screen.dart';
import 'package:ctse_assignment_1/screens/quize_list.dart';
import 'package:ctse_assignment_1/screens/score_screen.dart';
import 'package:ctse_assignment_1/util/Quiz_Result/quiz_result_crud_model.dart';
import 'package:ctse_assignment_1/util/crud_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:localstorage/localstorage.dart';
import 'package:provider/provider.dart';

import '../Controllers/QuestionController.dart';
import '../styles.dart';
import '../util/Quizes/quiz_crud_model.dart';
import 'movie_all.dart';
import 'movie_library_form.dart';

class IndexPage extends StatefulWidget {

  const IndexPage({Key? key}) : super(key: key);

  @override
  _IndexPageState createState() => _IndexPageState();
}
class _IndexPageState extends State<IndexPage> {
  final LocalStorage storage = new LocalStorage('localstorage_app');
  late String QuizID = "";
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
                            builder: (context) => FeedBackForm()),
                      );
                    },
                    child: const Text(
                      'FeedBack Form',
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
                            builder: (context) => MovieWiki()),
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
                      Provider.of<QuizResultCrudModel>(context, listen: false)
                          .insertQuizData(4, 'U001') // here no of quizes are entered, userID are entered
                          .then((value) {
                            //Provider.of<QuizCrudModel>(context, listen: false).saveQuizID(value.toString()).;
                            storage.setItem('QuizID', value.toString());
                      });

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>  QuizScreen(noOfQuestions: 4, time: 20, cattegory: 'Horror',)),
                      );
                    },
                    child: const Text(
                      'Audio Quiz',
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
                            builder: (context) =>  MovieMultiSelect(libraryId: "pWcw0R9HoJSg2QHpj6jU",)),
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
                            builder: (context) =>  ScorePage()),
                      );
                    },
                    child: const Text(
                      'Score page',
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
                            builder: (context) =>  LibraryForm(functionValue: 0,libraryId: '-',libraryName: "-",)),
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
                            builder: (context) =>  QuizeList()),
                      );
                    },
                    child: const Text(
                      'Quiz List',
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
                            builder: (context) =>  LeaderBoard()),
                      );
                    },
                    child: const Text(
                      'LeaderBoard',
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
                            builder: (context) =>  NavigationScreen()),
                      );
                    },
                    child: const Text(
                      'Navigation Screen',
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
