import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';

import 'package:quiz/constant.dart';
import 'package:quiz/models/question_model.dart';
import 'package:quiz/views/score_screen.dart';

class QuizController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final List<QuestionModel> _questionList = islamicData
      .map((question) => QuestionModel(
          id: question['id'],
          answerIndex: question['answer_index'],
          question: question['question'],
          options: question['options']))
      .toList();

  List<QuestionModel> get questionList => _questionList;
  late PageController _pageController;
  PageController get pageController => _pageController;

  late Animation _animation;
  Animation get animation => _animation;
  late AnimationController _animationController;

  int? _correctAns;
  int? get correctAns => _correctAns;

  bool _isAnswered = false;
  bool get isAnswered => _isAnswered;

  int? _selectedAns;
  int? get selectedAns => _selectedAns;
  RxInt _quesNum = 1.obs;
  RxInt get quesNum => _quesNum;
  int _result = 0;
  int get result => _result;

  checkAnswer(QuestionModel ques, int selectedIndex) {
    _isAnswered = true;
    _correctAns = ques.answerIndex;
    _selectedAns = selectedIndex;
    if (_selectedAns == _correctAns) _result++;
    _animationController.stop();
    update();

    Future.delayed(const Duration(seconds: 3), () {
      nextQuestion();
    });
  }

  nextQuestion() {
    if (_quesNum.value != _questionList.length) {
      _isAnswered = false;
      _pageController.nextPage(
          duration: const Duration(microseconds: 250), curve: Curves.ease);
      _animationController.reset();
      _animationController.forward().whenComplete(() => nextQuestion());
    } else {
      Get.to(const ScoreScreen());
    }
  }

  @override
  void onInit() {
    _animationController =
        AnimationController(duration: const Duration(seconds: 60), vsync: this);
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController)
      ..addListener(() {
        update();
      });

    _animationController.forward().whenComplete(() => nextQuestion());
    _pageController = PageController();
    super.onInit();
  }

  updateQuestionNum(int index) {
    _quesNum.value = index + 1;
  }

  @override
  void onClose() {
    super.onClose();
    _animationController.dispose();
    _pageController.dispose();
  }
}
