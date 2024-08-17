import 'package:flutter/material.dart';
import 'package:flutter_quiz_application/QuestionScreen.dart';
// import 'package:flutter_quiz_application/QuestionScreen.dart';
import 'package:flutter_quiz_application/StartScreen.dart';
// import 'package:flutter_quiz_application/startscreen.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  // ignore: non_constant_identifier_names
  List<String> selectedAnswers = [];
  Widget? CurrentScreen;

  void ChooseAnswer(String answer) {
    selectedAnswers.add(answer);
  }

  @override
  void initState() {
    CurrentScreen = StartScreen(ChangeScreen);
    super.initState();
  }

  void ChangeScreen() {
    setState(() {
      CurrentScreen = QuestionPage(
        ChangeScreen,
        onSelectAnswer: ChooseAnswer,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CurrentScreen,
    );
  }
}
