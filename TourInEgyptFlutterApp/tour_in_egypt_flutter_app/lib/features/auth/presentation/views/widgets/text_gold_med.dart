import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tour_in_egypt_flutter_app/constants.dart';

class MedGoldText extends StatelessWidget {
  const MedGoldText({super.key, required this.text});

  final String? text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      style: GoogleFonts.roboto(
        fontSize: 16,
        color: ConstColors.primaryGoldColor,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
