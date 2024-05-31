import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizapp/data/question.dart';
import 'package:quizapp/styled_text.dart';
import 'package:quizapp/summary_data.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    super.key,
    required this.choosenAnswers,
    required this.restart,
  });
  final List<String> choosenAnswers;
  final void Function() restart;
  List<Map<String, Object>> get toDisplay {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < choosenAnswers.length; i++) {
      summary.add(
        {
          'questions_index': i,
          //retrieved this mf as the questions instead of question and got fucked
          'question': questions[i]
              .question, // the question is the question that is stored as text in the model
          "correct_answer": questions[i].answers[0],
          "user_answer": choosenAnswers[i]
        },
      );
    }
    return summary;
  }

  @override
  Widget build(context) {
    final totalQuestions = questions.length;
    final totalCorrectAnswer = toDisplay
        .where((data) => data['correct_answer'] == data['user_answer'])
        .length;
    //won't work as this will return the int value rather than the boolean value
    // toDisplayFunction.where((data) {
    //   int count = 0;
    //   if (data['correct_answer'] == data['user_answer']) {
    //     count++;
    //   }
    //   return count;
    // });

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        StyledText(
            "You have $totalCorrectAnswer answers correct out of $totalQuestions answers!",
            20),
        const SizedBox(
          height: 30,
        ),
        SummaryData(
          summaryData: toDisplay,
        ),
        const SizedBox(
          height: 30,
        ),
        TextButton.icon(
          onPressed: restart,
          label: Text(
            "Restart Quiz!",
            style: GoogleFonts.lato(
              fontSize: 19,
              color: const Color.fromARGB(255, 190, 245, 193),
            ),
          ),
          icon: const Icon(Icons.restart_alt),
        ),
      ],
    );
  }
}
