import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:quiz_app/models/Questions.dart';

class QuestionController extends GetxController
    with SingleGetTickerProviderMixin {
  // lets animated our progress bar

  AnimationController _animationController;
  Animation _animation;

  Animation get animation => this._animation;

  List<Question> _questions = sample_data
      .map(
        (question) => Question(
            id: question['id'],
            question: question['question'],
            options: question['options'],
            answer: question['answer_index']),
      )
      .toList();
  List<Question> get questions => this._questions;

  bool _isAnswered = false;
  bool get isAnswered => this._isAnswered;

  int _correctAns;
  int get correctAns => this._correctAns;

  int _selectedAns;
  int get selectedAns => this._selectedAns;

  RxInt _questionNumber = 1.obs;
  RxInt get questionNumber => this._questionNumber;

  int _numOfCorrectAns = 0;
  int get numOfCorrectAns => this._numOfCorrectAns;

  @override
  void onInit() {
    // Our animation duration is 60s
    // so oir plan is to fill the progress bar within 60s
    _animationController =
        AnimationController(duration: Duration(seconds: 60), vsync: this);

    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController)
      ..addListener(() {
        update();
      });

    // start our animation
    _animationController.forward();

    super.onInit();
  }

  void checkAns(Question question, int selectedIndex) {
    _isAnswered = true;
    _correctAns = question.answer;
    _selectedAns = selectedIndex;
    print(question.answer);
    if (_correctAns == _selectedAns) _numOfCorrectAns++;

    _animationController.stop();
    update();
  }
}
