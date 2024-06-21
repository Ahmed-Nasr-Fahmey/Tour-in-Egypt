import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:tour_in_egypt_flutter_app/constants.dart';
import 'package:tour_in_egypt_flutter_app/core/models/city_category_model.dart';
import 'package:tour_in_egypt_flutter_app/core/models/governorate_model.dart';
import 'package:tour_in_egypt_flutter_app/core/utils/functions/unfocus_textfield.dart';
import 'package:tour_in_egypt_flutter_app/core/utils/functions/validation.dart';
import 'package:tour_in_egypt_flutter_app/core/widgets/comment_card.dart';
import 'package:tour_in_egypt_flutter_app/core/widgets/custom_main_app_bar.dart';
import 'package:tour_in_egypt_flutter_app/core/widgets/custom_main_button.dart';
import 'package:tour_in_egypt_flutter_app/core/widgets/custom_main_tab_bar_options.dart';
import 'package:tour_in_egypt_flutter_app/core/widgets/custom_profile_text_form_field.dart';
import 'package:tour_in_egypt_flutter_app/features/home/presentation/views/comments_view.dart';
import 'package:tour_in_egypt_flutter_app/features/home/presentation/views/widgets/category_header.dart';
import 'package:tour_in_egypt_flutter_app/features/profile/presentation/views/widgets/profile_screen_reels_card_builder.dart';

class CategoryDetailsView extends StatefulWidget {
  const CategoryDetailsView({super.key, required this.categoryModel});

  static const String routeName = "categoryDetailsView";
  final CityCategoryModel categoryModel;

  @override
  State<CategoryDetailsView> createState() => _CategoryDetailsViewState();
}

class _CategoryDetailsViewState extends State<CategoryDetailsView> {
  List<String> options = [
    "How to go ?!",
    "Reviews",
    "Booking",
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => unFocusTextFieldsWhenClickOutSide(context),
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: CustomMainAppBar(
            title: widget.categoryModel.name,
            hasBackgroundColor: true,
            hasBackIcon: true,
          ),
        ),
        body: ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CategoryHeader(categoryModel: widget.categoryModel),
            const Padding(
              padding: EdgeInsets.only(left: 15, top: 25),
              child: Text(
                "Description",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: ConstColors.primaryBlueColor),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15, top: 15, right: 15, bottom: 5),
              child: Text(
                widget.categoryModel.description!,
                style: const TextStyle(
                  fontSize: 14,
                  color: ConstColors.primaryBlueColor,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(right: 15, left: 15, bottom: 15),
              child: Divider(
                color: ConstColors.primaryBlueColor,
              ),
            ),
            DefaultTabController(
              initialIndex: selectedIndex,
              length: options.length,
              child: TabBar(
                onTap: (index) {
                  setState(
                    () {
                      selectedIndex = index;
                      if (selectedIndex == 0) {
                      } else if (selectedIndex == 1) {
                      } else {}
                    },
                  );
                },
                indicator: const BoxDecoration(),
                isScrollable: false,
                tabs: options.map((e) {
                  return CustomMainTabBarOptions(
                    name: e,
                    index: selectedIndex == options.indexOf(e)
                        ? selectedIndex
                        : -1,
                  );
                }).toList(),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(right: 15, left: 15, top: 15),
              child: Divider(
                color: ConstColors.primaryBlueColor,
              ),
            ),
            ListView.builder(
              itemCount: 1,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (index, contextt) => selectedIndex == 0
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 15, top: 8),
                          child: Text(
                            "Location",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: ConstColors.primaryBlueColor),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: CustomProfileTextFormField(
                              hintText: "Enter Your Location",
                              suffixIcon: const Icon(Icons.my_location),
                              validator: Validation.emailValidation,
                              obscureText: false,
                              isPassword: false),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 15, right: 15, top: 15),
                          child: CustomProfileTextFormField(
                              hintText: "Enter Your Destination",
                              suffixIcon: const Icon(Icons.my_location),
                              validator: Validation.emailValidation,
                              obscureText: false,
                              isPassword: false),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: SizedBox(
                            height: 300,
                            child: Container(
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage("assets/map.png"),
                                    fit: BoxFit.fill),
                              ),
                              alignment: Alignment.bottomRight,
                              child: ElevatedButton(
                                onPressed: () {
                                  ///ToDo Location Option
                                },
                                child: const Icon(Icons.redo_outlined),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: CustomMainButton(
                              text: "Take Uber",
                              onTap: () {
                                ///ToDo Uber Func
                              }),
                        ),
                        const SizedBox(
                          height: 45,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 15, bottom: 20),
                          child: Text(
                            "Metro",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: ConstColors.primaryBlueColor),
                          ),
                        ),
                        const Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 13, right: 13),
                              child: Image(
                                image: AssetImage("assets/location.png"),
                                height: 60,
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: 15, top: 15, right: 15, bottom: 5),
                                child: Text(
                                  "Sayed Hanafy is an Egyptian company in the field of koshary industry.",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: ConstColors.primaryBlueColor),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 13, right: 13),
                              child: Image(
                                image: AssetImage("assets/location.png"),
                                height: 60,
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: 15, top: 15, right: 15, bottom: 5),
                                child: Text(
                                  "Sayed Hanafy is an Egyptian company in the field of koshary industry.",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: ConstColors.primaryBlueColor),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 13, right: 13),
                              child: Image(
                                image: AssetImage("assets/location.png"),
                                height: 60,
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: 15, top: 15, right: 15, bottom: 5),
                                child: Text(
                                  "Sayed Hanafy is an Egyptian company in the field of koshary industry.",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: ConstColors.primaryBlueColor),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 15, bottom: 20),
                          child: Text(
                            "Bus",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: ConstColors.primaryBlueColor),
                          ),
                        ),
                        const Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 13, right: 13),
                              child: Image(
                                image: AssetImage("assets/location.png"),
                                height: 60,
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: 15, top: 15, right: 15, bottom: 5),
                                child: Text(
                                  "Sayed Hanafy is an Egyptian company in the field of koshary industry.",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: ConstColors.primaryBlueColor),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 13, right: 13),
                              child: Image(
                                image: AssetImage("assets/location.png"),
                                height: 60,
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: 15, top: 15, right: 15, bottom: 5),
                                child: Text(
                                  "Sayed Hanafy is an Egyptian company in the field of koshary industry.",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: ConstColors.primaryBlueColor),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 13, right: 13),
                              child: Image(
                                image: AssetImage("assets/location.png"),
                                height: 60,
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: 15, top: 15, right: 15, bottom: 5),
                                child: Text(
                                  "Sayed Hanafy is an Egyptian company in the field of koshary industry.",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: ConstColors.primaryBlueColor),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 15, bottom: 20),
                          child: Text(
                            "Micro Bus",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: ConstColors.primaryBlueColor),
                          ),
                        ),
                        const Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 13, right: 13),
                              child: Image(
                                image: AssetImage("assets/location.png"),
                                height: 60,
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: 15, top: 15, right: 15, bottom: 5),
                                child: Text(
                                  "Sayed Hanafy is an Egyptian company in the field of koshary industry.",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: ConstColors.primaryBlueColor),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 13, right: 13),
                              child: Image(
                                image: AssetImage("assets/location.png"),
                                height: 60,
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: 15, top: 15, right: 15, bottom: 5),
                                child: Text(
                                  "Sayed Hanafy is an Egyptian company in the field of koshary industry.",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: ConstColors.primaryBlueColor),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 13, right: 13),
                              child: Image(
                                image: AssetImage("assets/location.png"),
                                height: 60,
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: 15, top: 15, right: 15, bottom: 5),
                                child: Text(
                                  "Sayed Hanafy is an Egyptian company in the field of koshary industry.",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: ConstColors.primaryBlueColor),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    )
                  : (selectedIndex == 1
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(16),
                              child: Text(
                                "Comments",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: ConstColors.primaryBlueColor),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 15, right: 15),
                              child: CommentCard(),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 15, right: 15),
                              child: CustomProfileTextFormField(
                                  hintText: "Write a comment",
                                  suffixIcon: ConstIcons.solidSendCommentIcon,
                                  validator: Validation.emailValidation,
                                  obscureText: false,
                                  isPassword: false),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 15, right: 15),
                              child: CustomMainButton(
                                  text: "More Comments",
                                  onTap: () {
                                    /// To Do Implement more comments
                                    PersistentNavBarNavigator
                                        .pushNewScreenWithRouteSettings(
                                      context,
                                      settings: const RouteSettings(
                                          name: CommentsView.routeName),
                                      screen: const CommentsView(),
                                      withNavBar: false,
                                      pageTransitionAnimation:
                                          PageTransitionAnimation.slideUp,
                                    );
                                  }),
                            ),
                            const SizedBox(height: 25),
                            const Padding(
                              padding: EdgeInsets.only(left: 15, right: 15),
                              child: Row(
                                children: [
                                  Text(
                                    "Reels",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        color: ConstColors.primaryBlueColor),
                                  ),
                                ],
                              ),
                            ),

                            ///TO DO Reels Cards in a row
                            const ProfileScreenReelsCardBuilder(),
                          ],
                        )
                      : const Center(
                          child: Text(
                            "Comming Soon ...",
                            style: TextStyle(
                                color: Colors.indigo,
                                fontSize: 18,
                                fontWeight: FontWeight.w600),
                          ),
                        )),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomePlaceTabBar extends StatefulWidget {
  const CustomePlaceTabBar({super.key, required this.governorateModel});
  final GovernorateModel governorateModel;
  @override
  State<CustomePlaceTabBar> createState() => _CustomePlaceTabBarState();
}

class _CustomePlaceTabBarState extends State<CustomePlaceTabBar> {
  List<String> options = [
    "How to go ?!",
    "Reviews",
    "Booking",
    "Try Something"
  ];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: selectedIndex,
      length: options.length,
      child: TabBar(
        onTap: (index) {
          setState(
            () {
              selectedIndex = index;
              if (selectedIndex == 0) {
              } else if (selectedIndex == 1) {
                const Center(
                  child: Text("Second Selected"),
                );
              } else {
                const Center(
                  child: Text("Third Selected"),
                );
              }
            },
          );
        },
        indicator: const BoxDecoration(),
        isScrollable: true,
        tabs: options.map((e) {
          return CustomMainTabBarOptions(
            name: e,
            index: selectedIndex == options.indexOf(e) ? selectedIndex : -1,
          );
        }).toList(),
      ),
    );
  }
}
