import 'package:flutter/material.dart';
import 'package:flutter_quiz_application/Questions/Questions.dart';

import 'package:flutter_quiz_application/model/AnswerButton.dart';
import 'package:flutter_quiz_application/startscreen.dart';
// import 'package:flutter_quiz_application/quiz.dart';
// import 'package:flutter_quiz_application/startscreen.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:flutter_quiz_application/Questions/Questions.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage(this.changeScreen,
      {super.key, required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;

  final void Function() changeScreen;

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  var currentQuestionIndex = 0;

  void changeQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);

    if (questionsToDisplay.length == currentQuestionIndex-1) {
      
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => StartScreen(widget.changeScreen)));
    } else {
      setState(() {
        currentQuestionIndex++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questionsToDisplay[currentQuestionIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.question,
              style: GoogleFonts.lato(),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            ...currentQuestion.ShuffelTheList().map((ans) {
              return Container(
                margin: const EdgeInsets.only(top: 10, bottom: 10),
                child: AnswerButton(
                    answer: ans,
                    onTap: () {
                      changeQuestion(ans);
                    }),
              );
            }),
          ],
        ),
      ),
    );
  }
}
