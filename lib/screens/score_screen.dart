import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../util/Quizes/quiz_crud_model.dart';
import 'leader_board.dart';

class ScorePage extends StatefulWidget {
  const ScorePage({Key? key}) : super(key: key);
  @override
  _ScorePageState createState() => _ScorePageState();
}

class _ScorePageState extends State<ScorePage> {
  @override
  Widget build(BuildContext context) {
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
                      const Text.rich(
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
                            text: "10",
                            //text: "${question.id}",
                            style: Theme.of(context).textTheme.headline6,
                            children: [
                              TextSpan(
                                text: "/10",
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
                      onPressed: () {}),
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
                        MaterialPageRoute(builder: (context) => const LeaderBoard(id: '',));
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
                      onPressed: () {
                        Provider.of<QuizCrudModel>(context, listen: false)
                            .deleteQuizResult('38DurlnqnDUveidHsniS');
                      })
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
