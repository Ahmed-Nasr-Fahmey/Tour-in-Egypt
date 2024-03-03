import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tour_in_egypt_flutter_app/constants.dart';
class CommentCard extends StatelessWidget {
  const CommentCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 300,
      width: double.infinity,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        color: Colors.white,
      ),
      child: Card(
        elevation: 8,
        shape: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          borderSide: BorderSide(
            color: ConstColors.primaryGoldColor,
            width: 2,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              child: Row(
                children: [
                  Stack(
                    children: [
                      const CircleAvatar(
                        backgroundColor: ConstColors.primaryGoldColor,
                        radius: 28,
                        child: CircleAvatar(
                          radius: 25,
                          backgroundImage: NetworkImage(
                              'https://scontent.fcai22-1.fna.fbcdn.net/v/t39.30808-6/351356037_1121650665225980_8313024570362431221_n.jpg?_nc_cat=103&ccb=1-7&_nc_sid=5f2048&_nc_ohc=EPUGsdMetM4AX9b3pxB&_nc_ht=scontent.fcai22-1.fna&oh=00_AfDGDDyagVT_dTsBt6OjSG36tJdKYijhdbMo5Uvkp2IUgw&oe=6536B2AA'),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          width: 15,
                          height: 15,
                          color: ConstColors.backgroundLightMode,
                        ),
                      ),
                      const Positioned(
                        bottom: 0,
                        right: 0,
                        child: ConstIcons.solidCorrectIcon,
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Ahmed Nasr',
                        style: GoogleFonts.roboto(
                          color: ConstColors.primaryBlueColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        '17 Feb 2002    7:30 Am',
                        style: GoogleFonts.roboto(
                          color: ConstColors.primaryBlueColor,
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  ConstIcons.solidFollowIcon,
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Text(
                'Koshary is very tasty and I recommend it.Koshary is very tasty and I recommend it.',
                style: GoogleFonts.roboto(
                  color: ConstColors.primaryBlueColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    children: [
                      ConstIcons.solidSharIcon,
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Share',
                        style: GoogleFonts.roboto(
                          color: ConstColors.primaryBlueColor,
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    width: 25,
                  ),
                  Column(
                    children: [
                      ConstIcons.solidLoveGoldIcon,
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        '120 K',
                        style: GoogleFonts.roboto(
                          color: ConstColors.primaryBlueColor,
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
