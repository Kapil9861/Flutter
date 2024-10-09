import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StyledText extends StatelessWidget {
  const StyledText({
    super.key,
    required this.text,
    this.fontWeight = FontWeight.normal,
    this.fontColor = Colors.black,
    this.fontSize = 15,
  });
  final String text;
  final FontWeight fontWeight;
  final Color fontColor;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.poppins(
        color: fontColor,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}
