import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tour_in_egypt_flutter_app/constants.dart';


class TextFieldLabel extends StatelessWidget {
  const TextFieldLabel({super.key, required this.text});

  final String? text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      style: GoogleFonts.roboto(
        color: ConstColors.primaryGoldColor,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
