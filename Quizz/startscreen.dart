import 'package:flutter/material.dart';
// import 'package:flutter_quiz_application/questions.dart';
// import 'package:flutter_quiz_application/QuestionScreen.dart';

// ignore: must_be_immutable
class StartScreen extends StatelessWidget {
  // final void Function() startQuiz;
  // ignore: non_constant_identifier_names
  void Function() ChangeScreen;

  // ignore: non_constant_identifier_names
  StartScreen(this.ChangeScreen, {super.key});
  // const StartScreen(this.startQuiz, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            height: 300,
          ),
          const Text('Welocme to quiz application',
              style: TextStyle(color: Color.fromARGB(255, 255, 255, 255))),
          OutlinedButton.icon(
              onPressed: ChangeScreen,
              style: OutlinedButton.styleFrom(foregroundColor: Colors.amber),
              label: const Text(
                'Start quiz',
              ),
              icon: const Icon(Icons.arrow_forward_ios_outlined)),
        ],
      ),
    );
  }
}
