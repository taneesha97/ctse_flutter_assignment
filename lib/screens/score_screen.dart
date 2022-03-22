import 'package:ctse_assignment_1/models/result_quiz.dart';
import 'package:ctse_assignment_1/screens/index_page.dart';
import 'package:ctse_assignment_1/util/Quiz_Result/quiz_result_crud_model.dart';
import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import '../util/Quizes/quiz_crud_model.dart';
import 'leader_board.dart';

class ScorePage extends StatefulWidget {
  const ScorePage({Key? key}) : super(key: key);
  @override
  _ScorePageState createState() => _ScorePageState();
}

class _ScorePageState extends State<ScorePage> {

  LocalStorage storage = new LocalStorage('localstorage_app');
  List<ResultQuiz> docs = [];

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
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    String QuizID = storage.getItem('QuizID');

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
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>  const IndexPage()),
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
              Navigator.pop(context);

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
              Provider.of<QuizResultCrudModel>(context, listen: false).ReAttemptQuizResult(QuizID);
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>  const IndexPage()),
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
              Navigator.pop(context);

            },
            color: Color.fromRGBO(91, 55, 185, 1.0),
            radius: BorderRadius.circular(10.0),
          ),
        ],
      ).show();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Score Page ",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 100,
              width: 100,
              margin: EdgeInsets.all(1),
              // color: Colors.blue,
              child: Image.asset('assets/images/trophy.png', fit: BoxFit.cover),
            ),
            SizedBox(height: 20),
            Container(
              height: 200,
              width: 300,
              color: Colors.black12,
              child: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text.rich(
                    TextSpan(
                        text: "Congratulations",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                  const SizedBox(height: 20),
                  Center(
                      child: Row(
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text.rich(
                        TextSpan(
                            text: "10",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text.rich(
                        TextSpan(
                            text: "${docs[0].correct_answer}",
                            //text: "${question.id}",
                            style: Theme.of(context).textTheme.headline6,
                            children: [
                              TextSpan(
                                text: "/${docs[0].no_questions}",
                                style: Theme.of(context).textTheme.headline6,
                              )
                            ]),
                      ),
                    ],
                  )),
                ],
              )),
            ),
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>  const LeaderBoard()),
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
    );
    ;
  }
}
