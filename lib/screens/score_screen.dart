import 'dart:math';

import 'package:ctse_assignment_1/components/scorepage/background.dart';
import 'package:ctse_assignment_1/models/quize_list_model.dart';
import 'package:ctse_assignment_1/models/result_quiz.dart';
import 'package:ctse_assignment_1/screens/index_page.dart';
import 'package:ctse_assignment_1/screens/movie_wiki.dart';
import 'package:ctse_assignment_1/screens/quiz_screen.dart';
import 'package:ctse_assignment_1/screens/quize_list.dart';
import 'package:ctse_assignment_1/screens/register_screen.dart';
import 'package:ctse_assignment_1/util/Quiz_Result/quiz_result_crud_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:localstorage/localstorage.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import '../Controllers/QuestionController.dart';
import '../styles.dart';
import '../util/Quizes/quiz_crud_model.dart';
import '../util/userAuth/userauthentication.dart';
import 'leader_board.dart';

class ScorePage extends StatefulWidget {
  const ScorePage({Key? key}) : super(key: key);
  @override
  _ScorePageState createState() => _ScorePageState();
}

class _ScorePageState extends State<ScorePage> with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation colorAnimation;
  late Animation sizeAnimation;
  late QuestionController _questionController;
  List<Object>? quizList;

  LocalStorage storage = new LocalStorage('localstorage_app');
  List<ResultQuiz> docs = [];

  bool isBack = true;
  double angle = 0;

  void _flip() {
    setState(() {
      angle = (angle + pi) % (2 * pi);
    });
  }

  var alertStyle = AlertStyle(
    overlayColor: const Color.fromARGB(196, 151, 151, 163),
    animationType: AnimationType.grow,
    isCloseButton: false,
    isOverlayTapDismiss: false,
    descStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
    animationDuration: Duration(milliseconds: 400),
    alertBorder: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(50.0),
      side: BorderSide(
        color: Colors.grey,
      ),
    ),
    titleStyle: const TextStyle(
      color: Color.fromRGBO(91, 55, 185, 1.0),
      //fontSize: 10
    ),
  );

  @override
  void initState() {
    super.initState();
    String QuizID1 = storage.getItem('QuizID');
    Provider.of<QuizResultCrudModel>(context, listen: false)
        .readQuizResultsByID(QuizID1)
        .then((value) => {
              print(value),
              setState(() {
                docs = value;
              }),

              // docs1 = value
            });

    // Defining controller with animation duration of two seconds
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));

    // Defining both color and size animations
    colorAnimation =
        ColorTween(begin: Colors.blue, end: Colors.yellow).animate(controller);
    sizeAnimation = Tween<double>(begin: 100.0, end: 180.0).animate(controller);

    // Rebuilding the screen when animation goes ahead
    controller.addListener(() {
      setState(() {});
    });

    // Repeat the animation after finish
    controller.repeat();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  void loginValidation() {
    Stream<User?> val = Provider.of<UserAuthentication>(context, listen: false).authStateChanges;
    val.listen((event) {
      if(event == null){
        //if the user object is null. will forward to Register page
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => RegisterScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    //loginValidation();
    String QuizID = storage.getItem('QuizID');
    QuestionController _questionController = Get.put(QuestionController());
    quizList = _questionController.getQuizDetails();

    void onPress() {
      Alert(
        context: context,
        style: alertStyle,
        type: AlertType.error,
        title: "Are you sure?",
        desc: "Do you want to delete the record?",
        buttons: [
          DialogButton(
            child: const Text(
              "Yes",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () {
              Provider.of<QuizResultCrudModel>(context, listen: false)
                  .deleteQuizResult(QuizID);
              Provider.of<QuizResultCrudModel>(context, listen: false)
                  .setdefultValues();
              _questionController.setQuizNumber();
              //Navigator.pop(context);
              Navigator.of(context, rootNavigator: true).pop();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => QuizeList()),
              );
              // MaterialPageRoute(builder: (context) => const ScorePage());
            },
            color: Color.fromRGBO(91, 55, 185, 1.0),
            radius: BorderRadius.circular(10.0),
          ),
          DialogButton(
            child: const Text(
              "Cancel",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () {
              //Navigator.pop(context);
              Navigator.of(context, rootNavigator: true).pop();
            },
            color: Color.fromRGBO(91, 55, 185, 1.0),
            radius: BorderRadius.circular(10.0),
          ),
        ],
      ).show();
    }

    void onPress1() {
      Alert(
        context: context,
        style: alertStyle,
        type: AlertType.info,
        title: "Are you sure?",
        desc: "Do you want to retry quiz?",
        buttons: [
          DialogButton(
            child: const Text(
              "Yes",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () {
              print(quizList);
              _questionController.setisAnsweredFalse();
              Provider.of<QuizResultCrudModel>(context, listen: false)
                  .setdefultValues();
              Provider.of<QuizResultCrudModel>(context, listen: false)
                  .ReAttemptQuizResult(QuizID);
              _questionController.setQuizNumber();
              //Navigator.pop(context);
              Navigator.of(context, rootNavigator: true).pop();
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => QuizScreen(
                        time: int.parse(quizList![1].toString()),
                        noOfQuestions: int.parse(quizList![0].toString()),
                        cattegory: quizList![2].toString())),
              );
            },
            color: Color.fromRGBO(91, 55, 185, 1.0),
            radius: BorderRadius.circular(10.0),
          ),
          DialogButton(
            child: const Text(
              "Cancel",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () {
              // Navigator.pop(context);
              Navigator.of(context, rootNavigator: true).pop();
            },
            color: Color.fromRGBO(91, 55, 185, 1.0),
            radius: BorderRadius.circular(10.0),
          ),
        ],
      ).show();
    }

    void stopAnimation() {
      controller.stop();
    }

    void startAnimation() {
      controller.repeat();
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        elevation: 0,
        toolbarHeight: 10,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 10,
              ),
              Text("Score Page", style: Styles.textSectionHeader),
              SizedBox(height: 30),
              GestureDetector(
                onTap: stopAnimation,
                onDoubleTap: startAnimation,
                child: Container(
                  height: sizeAnimation.value,
                  width: sizeAnimation.value,
                  margin: EdgeInsets.all(1),
                  // color: Colors.blue,
                  child: Image.asset('assets/images/trophy.png',
                      fit: BoxFit.cover),
                ),
              ),
              SizedBox(height: 20),
              Stack(children: [
                Container(
                  height: 150,
                  width: 300,
                  //color: Colors.black12,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color.fromARGB(235, 0, 255, 255),
                          Color.fromARGB(255, 1, 168, 140),
                        ],
                      )),
                  child: Center(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (docs[0]?.correct_answer == 0) ...[
                        Center(
                            child: Row(
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                image: DecorationImage(
                                  image: AssetImage("assets/images/sad.png"),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Text.rich(
                              TextSpan(
                                  text: "${docs[0].correct_answer * 10}",
                                  //text: "${question.id}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline4
                                      ?.copyWith(color: Colors.white),
                                  children: [
                                    TextSpan(
                                      text: "/${docs[0].no_questions * 10}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline4
                                          ?.copyWith(color: Colors.white),
                                    )
                                  ]),
                            ),
                          ],
                        )),
                      ] else if (docs[0]?.correct_answer ==
                          docs[0]?.no_questions) ...[
                        const Text.rich(
                          TextSpan(
                              text: "🎊 Congratulations",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                        ),
                        const SizedBox(height: 20),
                        Center(
                            child: Row(
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                image: DecorationImage(
                                  image: AssetImage("assets/images/happy.png"),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text.rich(
                              TextSpan(
                                  text: "${docs[0].correct_answer * 10}",
                                  //text: "${question.id}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6
                                      ?.copyWith(color: Colors.white),
                                  children: [
                                    TextSpan(
                                      text: "/${docs[0].no_questions * 10}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline6
                                          ?.copyWith(color: Colors.white),
                                    )
                                  ]),
                            ),
                          ],
                        )),
                      ] else ...[
                        const Text.rich(
                          TextSpan(
                              text: "🎊 Congratulations",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                        ),
                        const SizedBox(height: 20),
                        Center(
                            child: Row(
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                image: DecorationImage(
                                  image:
                                      AssetImage("assets/images/clapping.png"),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text.rich(
                              TextSpan(
                                  text: "${docs[0].correct_answer * 10}",
                                  //text: "${question.id}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6
                                      ?.copyWith(color: Colors.white),
                                  children: [
                                    TextSpan(
                                      text: "/${docs[0].no_questions * 10}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline6
                                          ?.copyWith(color: Colors.white),
                                    )
                                  ]),
                            ),
                          ],
                        )),
                      ],
                    ],
                  )),
                ),
              ]),
              SizedBox(height: 20),
              Container(
                height: 100,
                width: 400,
                // color: Colors.black12,
                child: Center(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(100, 40),
                          textStyle: TextStyle(fontSize: 15),
                          primary: Colors.blueGrey,
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(10.0),
                          ),
                        ),
                        child: Text('Retry'),
                        onPressed: onPress1),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(100, 40),
                          textStyle: TextStyle(fontSize: 15),
                          primary: Colors.blue,
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(10.0),
                          ),
                        ),
                        child: Text('OK'),
                        onPressed: () {
                          _questionController.setisAnsweredFalse();
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MovieWiki()),
                          );
                        }),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(100, 40),
                          textStyle: const TextStyle(fontSize: 15),
                          primary: Colors.pink,
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(10.0),
                          ),
                        ),
                        child: Text('Delete'),
                        onPressed: onPress)
                  ],
                )),
              )
            ],
          ),
        ),
      ),
    );
    ;
  }
}
