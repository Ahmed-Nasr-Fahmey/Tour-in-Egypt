import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:tour_in_egypt_flutter_app/constants.dart';
import 'package:tour_in_egypt_flutter_app/core/utils/api_service.dart';
import 'package:tour_in_egypt_flutter_app/core/utils/manager/user_cubit.dart';
import 'package:tour_in_egypt_flutter_app/core/widgets/custom_main_button.dart';
import 'package:tour_in_egypt_flutter_app/core/widgets/custom_see_all_row.dart';
import 'package:tour_in_egypt_flutter_app/features/home/presentation/views/image_view.dart';
import 'package:tour_in_egypt_flutter_app/features/home/presentation/views/widgets/post_card_builder.dart';
import 'package:tour_in_egypt_flutter_app/features/profile/presentation/views/widgets/profile_screen_reels_card_builder.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        PersistentNavBarNavigator
                            .pushNewScreenWithRouteSettings(
                          context,
                          settings:
                              const RouteSettings(name: ImageView.routeName),
                          screen: ImageView(
                            imageUrl: BlocProvider.of<UserCubit>(context)
                                .userModel
                                .picture!,
                          ),
                          withNavBar: false,
                          pageTransitionAnimation: PageTransitionAnimation.fade,
                        );
                      },
                      child: CircleAvatar(
                        backgroundColor: ConstColors.primaryGoldColor,
                        radius: 40,
                        child: CircleAvatar(
                          radius: 37,
                          child: ClipRRect(
                            borderRadius: BorderRadiusDirectional.circular(50),
                            child: CachedNetworkImage(
                              imageUrl: ApiService.imagesBaseUrl +
                                  BlocProvider.of<UserCubit>(context)
                                      .userModel
                                      .picture!,
                              imageBuilder: (context, imageProvider) =>
                                  Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: imageProvider,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              placeholder: (context, url) => const SizedBox(),
                              errorWidget: (context, url, error) => const Icon(
                                Icons.error,
                                color: ConstColors.primaryGoldColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      BlocProvider.of<UserCubit>(context).userModel.userName!,
                      style: GoogleFonts.roboto(
                        color: ConstColors.primaryBlueColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const Spacer(
                  flex: 1,
                ),
                Column(
                  children: [
                    Text(
                      '14',
                      style: GoogleFonts.roboto(
                        color: ConstColors.primaryBlueColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Following',
                      style: GoogleFonts.roboto(
                        color: ConstColors.primaryGoldColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 35,
                  child: VerticalDivider(
                    width: 40,
                    color: ConstColors.primaryGoldColor,
                    thickness: 2,
                    // indent: 60,
                    // endIndent: 60,
                  ),
                ),
                Column(
                  children: [
                    Text(
                      '1.4 K',
                      style: GoogleFonts.roboto(
                        color: ConstColors.primaryBlueColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Followers',
                      style: GoogleFonts.roboto(
                        color: ConstColors.primaryGoldColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 35,
                  child: VerticalDivider(
                    width: 40,
                    color: ConstColors.primaryGoldColor,
                    thickness: 2,
                    // indent: 60,
                    // endIndent: 60,
                  ),
                ),
                Column(
                  children: [
                    Text(
                      '46 K',
                      style: GoogleFonts.roboto(
                        color: ConstColors.primaryBlueColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Likes',
                      style: GoogleFonts.roboto(
                        color: ConstColors.primaryGoldColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 25,
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Stack(
              children: [
                CustomMainButton(
                  text: 'Add Place',
                  onTap: () {},
                ),
                const Positioned(
                  right: 16,
                  top: 10,
                  child: ConstIcons.solidLocationIcon,
                ),
              ],
            ),
          ),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 20,
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Stack(
              children: [
                CustomMainButton(
                  text: 'Saved Postes & Places',
                  onTap: () {},
                ),
                const Positioned(
                  right: 16,
                  top: 10,
                  child: ConstIcons.solidSaveIcon,
                ),
              ],
            ),
          ),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 20,
          ),
        ),
        const SliverToBoxAdapter(
          child: CustomSeeAllRow(text: 'Reels'),
        ),
        const SliverToBoxAdapter(child: ProfileScreenReelsCardBuilder()),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Text(
              'Postes',
              style: GoogleFonts.roboto(
                color: ConstColors.primaryBlueColor,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        const PostCardBuilder(),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 65,
          ),
        ),
      ],
    );
  }
}
