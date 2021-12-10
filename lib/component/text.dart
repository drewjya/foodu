import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  final String text;
  final Paint? background;
  final Color? color;
  final Color? backgroundColor;
  final TextDecoration? decoration;
  final double fontSize;
  final FontWeight? fontWeight;
  const CustomText(
      {Key? key,
      required this.text,
      required this.fontSize,
      this.fontWeight,
      this.background,
      this.color,
      this.backgroundColor,
      this.decoration})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.lato(
        background: background,
        backgroundColor: backgroundColor,
        color: color,
        decoration: decoration,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}
