import 'package:flutter/material.dart';
import 'package:tour_in_egypt_flutter_app/features/profile/presentation/views/widgets/profile_screen_reel_card.dart';

class ProfileScreenReelsCardBuilder extends StatelessWidget {
  const ProfileScreenReelsCardBuilder({super.key});
  static List<String> reels = [
    'reel 1.png',
    'reel 2.png',
    'reel 3.png',
    'reel 4.png',
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: reels.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(
              bottom: 16,
              left: 16,
            ),
            child: ProfileScreenReelCard(imageUrl: reels[index]),
          );
        },
      ),
    );
  }
}
