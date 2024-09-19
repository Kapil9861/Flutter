import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// [StyledText] is a widget that displays a text with a custom style.
/// It uses the Google Fonts package to apply the Poppins font.
class StyledText extends StatelessWidget {
  /// The text to be displayed.
  final String text;

  /// The size of the font.
  final double fontSize;

  /// The weight of the font. Defaults to [FontWeight.w400].
  final FontWeight fontWeight;

  /// The color of the text. Defaults to a dark gray color.
  final Color fontColor;

  /// Creates a [StyledText] widget.
  ///
  /// The [text] and [fontSize] parameters are required.
  /// [fontWeight] and [fontColor] have default values but can be overridden.
  const StyledText({
    super.key,
    required this.fontSize,
    this.fontWeight = FontWeight.w400,
    this.fontColor = const Color(0xFF4E4B66),
    required this.text,
  });
  // Setting the Google fonts poppins as the Text style
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.poppins(
        fontSize: fontSize, // Sets the font size of the text
        fontWeight: fontWeight, // Sets the font weight of the text
        color: fontColor, // Sets the color of the text
      ),
    );
  }
}
