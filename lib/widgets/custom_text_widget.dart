import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextWidget extends StatelessWidget {
  CustomTextWidget({super.key, required this.text, this.color, this.fontSize, this.fontWeight, this.maxLines, this.overflow});
  String text;
  Color? color;
  double? fontSize;
  FontWeight? fontWeight;
  TextOverflow? overflow;
  int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: GoogleFonts.ubuntu(
          color: color,
          fontSize: fontSize,
          fontWeight: fontWeight,
        ),
        overflow: overflow,
        maxLines: maxLines,
        );
  }
}