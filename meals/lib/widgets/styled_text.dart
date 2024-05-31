import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StyledText extends StatelessWidget {
  const StyledText({super.key, required this.text, this.textSize = 16});
  const StyledText.title({super.key, required this.text, this.textSize = 24});
  final String text;
  final double textSize;

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: GoogleFonts.lato(
          color: textSize == 24
              ? Theme.of(context).colorScheme.onPrimaryContainer
              : Colors.white,
          fontSize: textSize,
          fontWeight: textSize == 24 ? FontWeight.bold : FontWeight.normal,
        ),
        textAlign: TextAlign.center);
  }
}
