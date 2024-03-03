import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tour_in_egypt_flutter_app/constants.dart';

class CityCard extends StatelessWidget {
  const CityCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 240,
      width: double.infinity,
      child: Card(
        margin: const EdgeInsets.all(0),
        elevation: 10,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
              child: Image.network(
                'https://upload.wikimedia.org/wikipedia/commons/thumb/c/cb/%D9%82%D9%84%D8%B9%D9%87_%D8%B5%D9%84%D8%A7%D8%AD_%D8%A7%D9%84%D8%AF%D9%8A%D9%86_%D8%A7%D9%84%D8%A3%D9%8A%D9%88%D8%A8%D9%8A_23.jpg/1200px-%D9%82%D9%84%D8%B9%D9%87_%D8%B5%D9%84%D8%A7%D8%AD_%D8%A7%D9%84%D8%AF%D9%8A%D9%86_%D8%A7%D9%84%D8%A3%D9%8A%D9%88%D8%A8%D9%8A_23.jpg',
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withOpacity(1),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 80,
              bottom: 0,
              left: 16,
              child: Row(
                children: [
                  ConstIcons.solidLocationIcon,
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    'Cairo',
                    style: GoogleFonts.roboto(
                      color: ConstColors.backgroundLightMode,
                      fontSize: 26,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.52,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 30,
              left: 16,
              child: Text(
                'Salah al-den’s castle',
                style: GoogleFonts.roboto(
                  color: ConstColors.backgroundLightMode,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Positioned(
              right: 16,
              bottom: 30,
              child: Text(
                '30°C',
                style: GoogleFonts.roboto(
                  color: ConstColors.primaryGoldColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
