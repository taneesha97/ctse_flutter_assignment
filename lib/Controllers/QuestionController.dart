import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/quiz.dart';

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

  late int _noOfQuestions;
  int get noOfQuestions => this._noOfQuestions;

  late String _selectedAns;
  String get selectedAns => this._selectedAns;

  // for more about obs please check documentation
  RxInt _questionNumber = 1.obs;
  RxInt get questionNumber => this._questionNumber;

  int _numOfCorrectAns = 0;
  int get numOfCorrectAns => this._numOfCorrectAns;

  late int _time;
  int get time => this._time;

  List<int?>? valueSet;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    _animationController =
        AnimationController(duration: Duration(seconds: 10), vsync: this);
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController)
      ..addListener(() {
        // update like setState
        update();
      });

    // start our animation
    // Once 60s is completed go to the next qn
    _animationController.forward().whenComplete(nextQuestion);
    _pageController = PageController();
  }

  @override
  void onClose() {
    super.onClose();
    _animationController.dispose();
    _pageController.dispose();
  }

  List<int?>? checkCorrectWrongAnswers(Question question, String selectedIndex) {

    int noCorrectAnswers = 0;
    int AnsweredQuestions = 0;
    int noWrongAnswers = 0;
    if(question.answer! == selectedIndex){
      noCorrectAnswers++;
      AnsweredQuestions++;
    }else if(question.answer! != selectedIndex){
      noWrongAnswers++;
      AnsweredQuestions++;
    }
    valueSet?.add(AnsweredQuestions);
    valueSet?.add(noCorrectAnswers);
    valueSet?.add(noWrongAnswers);
    return valueSet;
  }

  void setQuestionParameter(int No, int time) {
    _noOfQuestions = No;
    _time = time;
  }

  void checkAns(Question question, String selectedIndex) {
    // because once user press any option then it will run
    print(question.answer!);
    print(selectedIndex);
    print('checkAns');
    _isAnswered = true;
    _correctAns = question.answer!;
    _selectedAns = selectedIndex;

    if (_correctAns == _selectedAns) _numOfCorrectAns++;

    // It will stop the counter
    _animationController.stop();
    update();

    // Once user select an ans after 3s it will go to the next qn
    Future.delayed(Duration(seconds: 3), () {
      nextQuestion();
    });
  }

  void nextQuestion() {
    if (_questionNumber.value != _noOfQuestions) {
      _isAnswered = false;
      _pageController.nextPage(
          duration: Duration(milliseconds: 250), curve: Curves.ease);

      // Reset the counter
      _animationController.reset();

      // Then start it again
      // Once timer is finish go to the next qn
      _animationController.forward().whenComplete(nextQuestion);
    } else {
      // Get package provide us simple way to naviigate another page
      //Get.to(ScoreScreen());
    }
  }

  void updateTheQnNum(int index) {
    _questionNumber.value = index + 1;
  }
}
