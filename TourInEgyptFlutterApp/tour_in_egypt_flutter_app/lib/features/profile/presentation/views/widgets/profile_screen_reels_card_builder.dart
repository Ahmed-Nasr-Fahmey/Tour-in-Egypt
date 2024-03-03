import 'package:flutter/material.dart';
import 'package:tour_in_egypt_flutter_app/features/profile/presentation/views/widgets/profile_screen_reel_card.dart';

class ProfileScreenReelsCardBuilder extends StatelessWidget {
  const ProfileScreenReelsCardBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsets.only(
              bottom: 16,
              left: 16,
            ),
            child: ProfileScreenReelCard(),
          );
        },
      ),
    );
  }
}
