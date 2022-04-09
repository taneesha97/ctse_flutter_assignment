import 'package:ctse_assignment_1/components/quiz/body.dart';
import 'package:ctse_assignment_1/screens/register_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../Controllers/QuestionController.dart';
import '../util/userAuth/userauthentication.dart';

class QuizScreen extends StatefulWidget {

  int time, noOfQuestions;
  String cattegory;
  QuizScreen({Key? key, required this.time, required this.noOfQuestions, required this.cattegory})
      : super(key: key);

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {

  @override
  void initState() {
    super.initState();
    QuestionController _controller = Get.put(QuestionController());
    _controller.saveContext(context);
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        elevation: 0,
        toolbarHeight: 10,
      ),
      body: Body(time: widget.time, noOfQuestions: widget.noOfQuestions, category: widget.cattegory ),
    );
  }
}
