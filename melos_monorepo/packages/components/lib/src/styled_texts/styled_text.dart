import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StyledText extends StatelessWidget {
  StyledText({
    super.key,
    required this.text,
    this.fontWeight = FontWeight.normal,
    this.textColor = Colors.black,
    this.fontSize = 15,
  });
  final String text;
  final FontWeight fontWeight;
  final Color textColor;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.poppins(
        color: textColor,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}
