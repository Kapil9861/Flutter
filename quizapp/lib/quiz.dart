import 'package:flutter/material.dart';
import 'package:quizapp/data/question.dart';
import 'package:quizapp/gradient_container.dart';
import 'package:quizapp/homepage.dart';
import 'package:quizapp/questions_screen.dart';
import 'package:quizapp/results_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  //I don't know but using the late keyword I don't have to use the initState() method but still the use of the late is to instantiate
  //a non- nullable variable hence it is done and even if the Parent widget was Container we could still use the Widget? type
  // but here we can't
  late Widget currentScreen = HomePage(changeScreen);
  List<String> selectedAnswer = [];

//didn't had to use!
  // @override
  // void initState() {
  //   super.initState();
  //   currentScreen= HomePage(changeScreen);
  // }

  void changeScreen() {
    setState(() {
      currentScreen = QuestionsScreen(
        onSelectAnswer: chooseAnswer,
      );
    });
  }

  void restart() {
    setState(() {
      selectedAnswer = [];
      currentScreen = HomePage(changeScreen);
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswer.add(answer);
    setState(() {
      if (selectedAnswer.length == questions.length) {
        currentScreen = ResultsScreen(
          choosenAnswers: selectedAnswer,
          restart: restart,
        );
      }
    });
  }

  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            const GradientContainer(
              Color.fromARGB(255, 81, 4, 88),
              Color.fromARGB(255, 37, 3, 82),
            ),
            currentScreen,
          ],
        ),
      ),
    );
  }
}

//Another Approach
// import 'package:flutter/material.dart';
// import 'package:quizapp/gradient_container.dart';
// import 'package:quizapp/homepage.dart';
// import 'package:quizapp/questions_screen.dart';

// class Quiz extends StatefulWidget {
//   const Quiz({super.key});

//   @override
//   State<Quiz> createState() {
//     return _QuizState();
//   }
// }

// class _QuizState extends State<Quiz> {
//   //I don't know but using the late keyword I don't have to use the initState() method but still the use of the late is to instantiate
//   //a non- nullable variable hence it is done and even if the Parent widget was Container we could still use the Widget? type
//   // but here we can't
//   Widget? currentScreen;

//   @override
//   void initState() {
//     super.initState();
//     currentScreen= HomePage(changeScreen);
//   }

//   void changeScreen() {
//     setState(() {
//       currentScreen = const QuestionsScreen();
//     });
//   }

//   @override
//   Widget build(context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: Container(
//           decoration: const BoxDecoration(
//             gradient: LinearGradient(
//               colors: [
//                 Color.fromARGB(255, 81, 4, 88),
//                 Color.fromARGB(255, 37, 3, 82),
//               ],
//               begin: Alignment.topLeft,
//               end: Alignment.bottomRight,
//             ),
//           ),
//           child: currentScreen,
//         ),
//       ),
//     );
//   }
// }


