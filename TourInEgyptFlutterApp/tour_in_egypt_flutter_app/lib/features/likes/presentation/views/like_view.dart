import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tour_in_egypt_flutter_app/constants.dart';
import 'package:tour_in_egypt_flutter_app/core/widgets/custom_main_app_bar.dart';
import 'package:tour_in_egypt_flutter_app/features/likes/presentation/views/widgets/likes_categoris_card_builder.dart';

class LikesView extends StatefulWidget {
  const LikesView({super.key});

  static const String routeName = 'LikesView';

  @override
  State<LikesView> createState() => _LikesViewState();
}

class _LikesViewState extends State<LikesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: CustomMainAppBar(
          title: 'Likes',
          hasBackgroundColor: true,
          hasBackIcon: false,
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                'Find your likes here !',
                style: GoogleFonts.roboto(
                  color: ConstColors.primaryBlueColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const LikesCategoriesCardBuilder(),
            const SizedBox(
              height: 80,
            )
          ],
        ),
      ),
    );
  }
}
