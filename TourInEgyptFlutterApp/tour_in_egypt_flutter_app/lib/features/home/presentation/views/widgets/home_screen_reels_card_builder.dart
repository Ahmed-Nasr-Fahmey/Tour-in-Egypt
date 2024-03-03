import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tour_in_egypt_flutter_app/constants.dart';
import 'package:tour_in_egypt_flutter_app/core/utils/manager/user_cubit.dart';
import '../widgets/home_screen_reels_card.dart';

class HomeScreenReelsCardBuilder extends StatelessWidget {
  const HomeScreenReelsCardBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: BlocProvider.of<UserCubit>(context).stories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(
              top: 16,
              bottom: 16,
              left: 16,
            ),
            child: index != 0
                ? HomeScreenReelCard(
                    userModel:
                        BlocProvider.of<UserCubit>(context).stories[index],
                  )
                : Stack(
                    children: [
                      HomeScreenReelCard(
                        userModel:
                            BlocProvider.of<UserCubit>(context).stories[index],
                      ),
                      Positioned(
                        top: 42,
                        left: 42,
                        child: Stack(
                          children: [
                            Positioned(
                              top: 5,
                              left: 5,
                              child: Container(
                                width: 15,
                                height: 15,
                                color: ConstColors.backgroundLightMode,
                              ),
                            ),
                            ConstIcons.solidPlusIcon,
                          ],
                        ),
                      ),
                    ],
                  ),
          );
        },
      ),
    );
  }
}
