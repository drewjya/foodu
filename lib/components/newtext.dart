import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NewText extends StatelessWidget {
  final String text;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextDecoration? decoration;
  final TextAlign? textAlign;
  const NewText(
    this.text, {
    Key? key,
    this.textAlign,
    this.color,
    this.fontSize,
    this.fontWeight,
    this.decoration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.lato(
        color: color,
        fontSize: fontSize,
        decoration: decoration,
        fontWeight: fontWeight,
      ),
      textAlign: textAlign,
      // maxLines: 3,
    );
  }
}

getSize(context) {
  return MediaQuery.of(context).size;
}
