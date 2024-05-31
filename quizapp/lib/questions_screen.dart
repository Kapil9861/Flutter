import "package:flutter/material.dart";
import "package:quizapp/answer_button.dart";
import "package:quizapp/data/question.dart";
import "package:quizapp/styled_text.dart";

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelectAnswer});
  final void Function(String selectedAnswer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionsScreen> {
  int index = 0;
  void questionAnswer(String answer) {
    widget.onSelectAnswer(answer);
    setState(() {
      //This could be better only if this class had the logic of switching between the screens and would complare
      // the length of the question and the selected answer but as it is done in the quiz we should compare it there
      // if (index < questions.length - 1) {
      //   index++;
      // }hence,
      index++;
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[index];
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          StyledText(currentQuestion.question, 20),
          const SizedBox(height: 30),
          ...currentQuestion.shuffledAnswers().map(
                (answer) => AnswerButton(
                    answer: answer,
                    onclick: () {
                      questionAnswer(answer);
                    }),
              ),
          //Alternatively!
          // ...currentQuestion.answers.map(
          //   (answer) {
          //     return AnswerButton(answer: answer, onclick: test);
          //   },
          // ),
        ],
      ),
    );
  }
}
