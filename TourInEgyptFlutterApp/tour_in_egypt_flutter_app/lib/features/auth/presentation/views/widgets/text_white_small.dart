import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SmallWhiteText extends StatelessWidget {
  const SmallWhiteText({super.key, required this.text, this.clr});

  final String? text;
  final Color? clr;

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      style: GoogleFonts.roboto(
        fontSize: 14,
        color: clr ?? Colors.white,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
