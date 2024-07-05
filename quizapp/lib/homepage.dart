import "package:flutter/material.dart";

class HomePage extends StatelessWidget {
  const HomePage(this.startQuiz, {super.key});

  final void Function() startQuiz;

  final String imageLocation = "assets/images/quiz-logo.png";

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            imageLocation,
            width: 350,
            color: const Color.fromARGB(168, 255, 255, 255),
          ),
          // Opacity(
          //   opacity: 0.7,
          //   child: Image.asset(
          //     imageLocation,
          //     width: 350,
          //   ),
          // ),
          const SizedBox(
            height: 100,
          ),
          const Text(
            "First Quiz Application!",
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          const SizedBox(
            height: 20,
          ),
          OutlinedButton.icon(
            icon: const Icon(Icons.arrow_right_alt),
            onPressed: startQuiz
            //Or can be done the same by using anonymous function too!
            // () {
            //   startQuiz();
            // }
            ,
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
              textStyle: const TextStyle(fontSize: 16),
            ),
            label: const Text("Start Quiz"),
          )
        ],
      ),
    );
  }
}
