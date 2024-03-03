import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tour_in_egypt_flutter_app/constants.dart';

class CustomSeeAllRow extends StatelessWidget {
  const CustomSeeAllRow({
    super.key,
    required this.text,
    this.onPressed,
  });
  final String text;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: GoogleFonts.roboto(
              color: ConstColors.primaryBlueColor,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          TextButton(
            onPressed: onPressed,
            child: Text(
              'See All',
              style: GoogleFonts.roboto(
                color: ConstColors.primaryBlueColor,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          )
        ],
      ),
    );
  }
}
