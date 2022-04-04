import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/quiz.dart';
import '../screens/feedback_form.dart';
import '../screens/quiz_screen.dart';

class QuestionController extends GetxController
    with SingleGetTickerProviderMixin {
  late AnimationController _animationController;

  late Animation _animation;
  Animation get animation => this._animation;

  late PageController _pageController;
  PageController get pageController => this._pageController;

  bool _isAnswered = false;
  bool get isAnswered => this._isAnswered;

  late String _correctAns;
  String get correctAns => this._correctAns;

  late BuildContext context;

  int _noOfQuestions = 10;
  String _cattegory = '';

  int get noOfQuestions => this._noOfQuestions;

  late String _selectedAns;
  String get selectedAns => this._selectedAns;

  // for more about obs please check documentation
  RxInt _questionNumber = 1.obs;
  RxInt get questionNumber => this._questionNumber;

  // int _numOfCorrectAns = 0;
  // int get numOfCorrectAns => this._numOfCorrectAns;

  int _time = 10;

  List<int?>? valueSet;

  void setQuestionParameter(int No, int time, String category) {
    _noOfQuestions = No;
    _time = time;
    _cattegory = category;

    _animationController =
        AnimationController(duration: Duration(seconds: _time), vsync: this);
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController)
      ..addListener(() {
        // update like setState
        update();
      });
    print('calling2');
    _animationController.forward().whenComplete(nextQuestion);
    _pageController = PageController();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    print(_time);
    _animationController =
        AnimationController(duration: Duration(seconds: _time), vsync: this);
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController)
      ..addListener(() {
        // update like setState
        update();
      });

    // start our animation
    // Once 60s is completed go to the next qn
    print('calling');
    _animationController.forward().whenComplete(nextQuestion);
    _pageController = PageController();
  }

  @override
  void onClose() {
    super.onClose();
    _animationController.dispose();
    _pageController.dispose();
  }


  void saveContext(BuildContext buildContext) {
    print(buildContext);
    context = buildContext;
  }

  void checkAns(Question question, String selectedIndex) {
    // because once user press any option then it will run
    _isAnswered = true;
    _correctAns = question.answer!;
    _selectedAns = selectedIndex;

    // It will stop the counter
    _animationController.stop();
    update();

    // Once user select an ans after 3s it will go to the next qn
    Future.delayed(Duration(seconds: 3), () {
      print('calling3');
      nextQuestion();
    });
  }

  void nextQuestion() {
    _isAnswered = false;

    if (_questionNumber.value != _noOfQuestions) {
      _isAnswered = false;
      _pageController.nextPage(
          duration: Duration(milliseconds: 250), curve: Curves.ease);

      _animationController.reset();

      print('calling4');
      _animationController.forward().whenComplete(nextQuestion);
    } else {

      //Get.to(() => const FeedBackForm());
      _isAnswered = false;
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => const FeedBackForm()),
      );
    }
  }

  void updateTheQnNum(int index) {
    _questionNumber.value = index + 1;
  }

  void setQuizNumber() {
    _questionNumber.value = 1;
  }

  List<Object> getQuizDetails() {
    return [_noOfQuestions, _time, _cattegory];
  }

  void setisAnsweredFalse(){
    _isAnswered = false;
  }
}
