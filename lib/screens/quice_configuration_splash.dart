import 'package:ctse_assignment_1/screens/quiz_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../util/Quiz_Result/quiz_result_crud_model.dart';
import '../util/User/UserCRUDModel.dart';
import '../util/userAuth/userauthentication.dart';

class SplashQuiceConfig extends StatefulWidget {

  final int time, questions;
  final String cattegory;

  const SplashQuiceConfig({Key? key, required this.questions, required this.cattegory, required this.time}) : super(key: key);

  @override
  _SplashQuiceConfigState createState() => _SplashQuiceConfigState();
}

class _SplashQuiceConfigState extends State<SplashQuiceConfig> {
  final LocalStorage storage = new LocalStorage('localstorage_app');
  String uid = '';

  @override
  void initState() {
    super.initState();
    Stream<User?> val = Provider.of<UserAuthentication>(context, listen: false).authStateChanges;

    val.listen((event) {
      print(event?.uid);
      setState(() {
        uid = event!.uid.toString();
      });
    });


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        elevation: 0,
        toolbarHeight: 10,
      ),
      body: Container(
        color: Colors.black,
        child: Container(
          margin: EdgeInsets.only(top: 60.0),
          child: Column(
            children: [
              // Center(
                Lottie.asset("assets/images/cute-girl.json"),
                SizedBox(height: 80),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(90, 45),
                    textStyle: TextStyle(fontSize: 15),
                    primary: Colors.teal,
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10.0),
                    ),
                  ),
                  child: Text('START'),
                  onPressed: (){
                    Provider.of<QuizResultCrudModel>(context, listen: false)
                        .insertQuizData(widget.questions,
                        uid) // here no of quizes are entered, userID are entered
                        .then((value) {
                      storage.setItem('QuizID', value.toString());
                    });
                    Provider.of<QuizResultCrudModel>(context, listen: false).setdefultValues();

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => QuizScreen(
                            noOfQuestions: widget.questions,
                            time: widget.time,
                            cattegory: widget.cattegory,
                          )),
                    );

                    // Navigator.push(
                        // context, MaterialPageRoute(builder: (context) => QuizeList()));
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
