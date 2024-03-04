import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:tour_in_egypt_flutter_app/constants.dart';
import 'package:tour_in_egypt_flutter_app/core/utils/functions/unfocus_textfield.dart';
import 'package:tour_in_egypt_flutter_app/core/utils/functions/validation.dart';
import 'package:tour_in_egypt_flutter_app/core/widgets/custom_main_button.dart';
import 'package:tour_in_egypt_flutter_app/core/widgets/custom_profile_text_form_field.dart';
import 'package:tour_in_egypt_flutter_app/features/home/presentation/views/image_view.dart';

class EditProfileViewBody extends StatelessWidget {
  const EditProfileViewBody({
    super.key,
    required this.formKey,
    required this.userNameController,
    required this.userEmailController,
    required this.userPasswordController,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController userNameController;
  final TextEditingController userEmailController;
  final TextEditingController userPasswordController;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        unFocusTextFieldsWhenClickOutSide(context);
      },
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        PersistentNavBarNavigator
                            .pushNewScreenWithRouteSettings(
                          context,
                          settings:
                              const RouteSettings(name: ImageView.routeName),
                          screen: ImageView(
                              imageUrl: ConstLists
                                  .categoriesList[0].categoryImageUrl),
                          withNavBar: false,
                          pageTransitionAnimation: PageTransitionAnimation.fade,
                        );
                      },
                      child: CircleAvatar(
                        backgroundColor: ConstColors.primaryGoldColor,
                        radius: 65,
                        child: CircleAvatar(
                          radius: 62,
                          backgroundImage: AssetImage(
                              ConstLists.categoriesList[0].categoryImageUrl),
                        ),
                      ),
                    ),
                    const Spacer(),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Row(
                          children: [
                            Text(
                              "Ahmed Nasr",
                              style: TextStyle(
                                  color: ConstColors.primaryBlueColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              height: 50,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: ConstColors.primaryBlueColor,
                                ),
                                onPressed: () {},
                                child: const Row(
                                  children: [
                                    Text(
                                      "Change Photo",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Icon(Icons.edit),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Spacer(),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  "Name ",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: ConstColors.primaryBlueColor,
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: CustomProfileTextFormField(
                  hintText: "Enter your Name",
                  suffixIcon: ConstIcons.solidProfileGoldIcon,
                  validator: (name) {
                    if (name!.isEmpty) {
                      return "Enter Your Name";
                    } else {
                      return null;
                    }
                  },
                  obscureText: false,
                  isPassword: false,
                  controller: userNameController,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  "E-maill ",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: ConstColors.primaryBlueColor,
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: CustomProfileTextFormField(
                    hintText: "Enter your Email",
                    suffixIcon: const FaIcon(
                      FontAwesomeIcons.solidEnvelope,
                      size: 20,
                      color: ConstColors.primaryGoldColor,
                    ),
                    controller: userEmailController,
                    validator: (email) {
                      return Validation.emailValidation(email!);
                    },
                    obscureText: false,
                    isPassword: false),
              ),
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  "Password ",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: ConstColors.primaryBlueColor,
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: CustomProfileTextFormField(
                  hintText: "Enter your Password",
                  suffixIcon: const FaIcon(
                    FontAwesomeIcons.solidEyeSlash,
                    size: 20,
                    color: ConstColors.primaryGoldColor,
                  ),
                  validator: (pass) {
                    return Validation.passwordValidation(pass);
                  },
                  obscureText: false,
                  isPassword: false,
                  controller: userPasswordController,
                ),
              ),
              const SizedBox(
                height: 70,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: CustomMainButton(text: "Save Changes", onTap: () {}),
              )
            ],
          ),
        ),
      ),
    );
  }
}
