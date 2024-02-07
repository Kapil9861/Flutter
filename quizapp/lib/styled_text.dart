import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StyledText extends StatelessWidget {
  const StyledText(this.text, this.size, {super.key});

  final String text;
  final double size;
  @override
  Widget build(context) {
    return Container(
      margin: const EdgeInsets.only(left: 30, right: 30),
      child: Center(
        child: Text(
          text,
          style: GoogleFonts.lato(
            color: Colors.white,
            fontSize: size,
          ),
        ),
      ),
    );
  }
}
//wrapping the center in a container and using it in the AnswerButton, the button will occcupy all the space,
//hence was avoided using it in the AnswerButton
