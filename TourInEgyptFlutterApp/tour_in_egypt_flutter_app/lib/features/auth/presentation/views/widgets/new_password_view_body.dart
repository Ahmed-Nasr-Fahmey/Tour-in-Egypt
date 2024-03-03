import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tour_in_egypt_flutter_app/constants.dart';
import 'package:tour_in_egypt_flutter_app/core/utils/functions/validation.dart';
import 'package:tour_in_egypt_flutter_app/core/widgets/custom_main_button.dart';
import 'package:tour_in_egypt_flutter_app/core/widgets/custom_text_form_field.dart';
import 'package:tour_in_egypt_flutter_app/features/auth/presentation/manager/auth_cubit.dart';
import 'package:tour_in_egypt_flutter_app/features/auth/presentation/views/widgets/text_gold_large.dart';

class NewPasswordViewBody extends StatefulWidget {
  const NewPasswordViewBody({
    super.key,
    required this.email,
  });
  final String email;

  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  State<NewPasswordViewBody> createState() => _NewPasswordViewBodyState();
}

class _NewPasswordViewBodyState extends State<NewPasswordViewBody> {
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.08,
        ),
        const Padding(
          padding: EdgeInsets.only(left: 10),
          child: LargeGoldText(
            text: "New Password",
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.11,
        ),
        Form(
          key: NewPasswordViewBody._formKey,
          autovalidateMode: autovalidateMode,
          child: ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
              child: Container(
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
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Update Password",
                            style: GoogleFonts.roboto(
                              fontSize: 22,
                              color: ConstColors.primaryGoldColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Text(
                        "Password",
                        style: GoogleFonts.roboto(
                          fontSize: 16,
                          color: ConstColors.primaryGoldColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextFormField(
                        obscureText: true,
                        isPassword: true,
                        suffixIcon: ConstIcons.solidEyeSlashIcon,
                        hintText: "Enter your Password",
                        validator: (pass) {
                          String? validation =
                              Validation.passwordValidation(pass);
                          if (validation == null) {
                            BlocProvider.of<AuthCubit>(context).password = pass;
                            return null;
                          } else {
                            return validation;
                          }
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Confirm Password",
                        style: GoogleFonts.roboto(
                          fontSize: 16,
                          color: ConstColors.primaryGoldColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextFormField(
                        obscureText: true,
                        isPassword: true,
                        suffixIcon: ConstIcons.solidEyeSlashIcon,
                        hintText: "Confirm your Password",
                        validator: (confirmPass) {
                          if (confirmPass!.isEmpty) {
                            return "Enter Confirmation Password";
                          } else {
                            if (confirmPass.length < 8) {
                              return "At least 8 characters";
                            } else {
                              if (confirmPass !=
                                  BlocProvider.of<AuthCubit>(context)
                                      .password) {
                                return "Confirm Password does not match the first one";
                              } else {
                                BlocProvider.of<AuthCubit>(context).check =
                                    true;
                              }
                            }
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 70,
                      ),
                      CustomMainButton(
                        text: "Submit",
                        onTap: () async {
                          if (NewPasswordViewBody._formKey.currentState!
                                  .validate() &&
                              BlocProvider.of<AuthCubit>(context).check ==
                                  true) {
                            await BlocProvider.of<AuthCubit>(context)
                                .updatePassword(
                              email: widget.email,
                              newPassword:
                                  BlocProvider.of<AuthCubit>(context).password!,
                            );
                          } else {
                            setState(
                              () {
                                autovalidateMode = AutovalidateMode.always;
                              },
                            );
                          }
                        },
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
