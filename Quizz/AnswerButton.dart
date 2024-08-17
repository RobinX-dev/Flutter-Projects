import 'package:flutter/material.dart';
// import 'package:flutter_quiz_application/QuestionScreen.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({
    super.key,
    required this.answer,
    required this.onTap,
  });

  final String answer;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white, backgroundColor: Colors.amber),
      onPressed: onTap,
      child: Text(
        answer,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
