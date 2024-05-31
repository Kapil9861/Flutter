import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AnswerButton extends StatelessWidget {
  final String answer;
  final void Function() onclick;
  const AnswerButton({super.key, required this.answer, required this.onclick});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.indigo[900],
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 45,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            ),
            // style: ButtonStyle(
            //      backgroundColor: MaterialStateProperty.all(Colors.black),
            //     ),
            onPressed: onclick,
            child: Text(
              answer,
              style: GoogleFonts.lato(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
