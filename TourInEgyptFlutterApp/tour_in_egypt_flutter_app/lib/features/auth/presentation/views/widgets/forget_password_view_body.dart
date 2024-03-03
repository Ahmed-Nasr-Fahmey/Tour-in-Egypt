import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tour_in_egypt_flutter_app/constants.dart';
import 'package:tour_in_egypt_flutter_app/core/utils/functions/validation.dart';
import 'package:tour_in_egypt_flutter_app/core/utils/manager/user_cubit.dart';
import 'package:tour_in_egypt_flutter_app/core/widgets/custom_main_button.dart';
import 'package:tour_in_egypt_flutter_app/core/widgets/custom_text_form_field.dart';
import 'package:tour_in_egypt_flutter_app/features/auth/presentation/manager/auth_cubit.dart';
import 'package:tour_in_egypt_flutter_app/features/auth/presentation/views/widgets/text_gold_med.dart';
import 'package:tour_in_egypt_flutter_app/features/auth/presentation/views/widgets/text_white_small.dart';

class ForgetPasswordViewBody extends StatelessWidget {
  const ForgetPasswordViewBody({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
    required this.emailToVerifyController,
    required GlobalKey<FormState> formKey,
  }) : _formKey = formKey;

  final double screenWidth;
  final double screenHeight;
  final TextEditingController emailToVerifyController;
  final GlobalKey<FormState> _formKey;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: ConstColors.grediantBackgroundColors,
            ),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(50),
              topRight: Radius.circular(50),
            ),
          ),
          child: ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
              child: Container(
                color: Colors.transparent,
                width: screenWidth,
                child: Padding(
                  padding: const EdgeInsets.only(top: 80),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Verification Code',
                            style: GoogleFonts.roboto(
                              fontSize: 22,
                              color: ConstColors.primaryGoldColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: screenHeight * 0.2,
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 20),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SmallWhiteText(text: "We Will send you a"),
                                MedGoldText(text: 'Verification'),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                MedGoldText(text: 'Code '),
                                SmallWhiteText(text: "on this "),
                                MedGoldText(text: 'Email'),
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                          left: 24,
                          bottom: 10,
                        ),
                        child: Text(
                          "Email",
                          style: GoogleFonts.roboto(
                            fontSize: 16,
                            color: ConstColors.primaryGoldColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: CustomTextFormField(
                          obscureText: false,
                          isPassword: false,
                          suffixIcon: ConstIcons.emailIcon,
                          hintText: "Enter your Email",
                          controller: emailToVerifyController,
                          validator: (value) {
                            //user.userEmail = value;
                            return Validation.emailValidation(value);
                          },
                          onChanged: (value) {
                            BlocProvider.of<UserCubit>(context)
                                .userModel
                                .userEmail = value;
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: CustomMainButton(
                          text: "Send Code",
                          onTap: () async{
                            if (_formKey.currentState!.validate()) {
                              await BlocProvider.of<AuthCubit>(context)
                                  .sendConfirmationCode(
                                email: emailToVerifyController.text,
                              );
                            }
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 70,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
