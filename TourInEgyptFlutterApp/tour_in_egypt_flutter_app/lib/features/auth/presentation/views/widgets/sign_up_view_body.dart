import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tour_in_egypt_flutter_app/constants.dart';
import 'package:tour_in_egypt_flutter_app/core/utils/functions/validation.dart';
import 'package:tour_in_egypt_flutter_app/core/utils/manager/user_cubit.dart';
import 'package:tour_in_egypt_flutter_app/core/widgets/custom_main_button.dart';
import 'package:tour_in_egypt_flutter_app/core/widgets/custom_text_form_field.dart';
import 'package:tour_in_egypt_flutter_app/features/auth/presentation/manager/auth_cubit.dart';
import 'package:tour_in_egypt_flutter_app/features/auth/presentation/views/log_in_view.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({
    super.key,
  });

  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(
          height: 120,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Text(
            'Sign Up',
            style: GoogleFonts.roboto(
              color: ConstColors.primaryGoldColor,
              fontSize: 26,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(
          height: 80,
        ),
        Form(
          key: SignUpViewBody._formKey,
          autovalidateMode: autovalidateMode,
          child: ClipRRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 3,
                sigmaY: 3,
              ),
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
                  padding: const EdgeInsets.only(
                    right: 16,
                    left: 16,
                    top: 24,
                    bottom: 70,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Name',
                        style: GoogleFonts.roboto(
                          color: ConstColors.primaryGoldColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      CustomTextFormField(
                        hintText: 'Enter your Name',
                        suffixIcon: ConstIcons.userNameIcon,
                        isPassword: false,
                        obscureText: false,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Name mustn\'t be empty';
                          } else {
                            return null;
                          }
                        },
                        onChanged: (data) {
                          BlocProvider.of<UserCubit>(context)
                              .userModel
                              .userName = data;
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Email',
                        style: GoogleFonts.roboto(
                          color: ConstColors.primaryGoldColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      CustomTextFormField(
                        hintText: 'Enter your Email',
                        suffixIcon: ConstIcons.emailIcon,
                        isPassword: false,
                        obscureText: false,
                        validator: (value) {
                          return Validation.emailValidation(value);
                        },
                        onChanged: (data) {
                          BlocProvider.of<UserCubit>(context)
                              .userModel
                              .userEmail = data;
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Password',
                        style: GoogleFonts.roboto(
                          color: ConstColors.primaryGoldColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      CustomTextFormField(
                        hintText: 'Enter your Password',
                        suffixIcon: ConstIcons.solidEyeSlashIcon,
                        isPassword: true,
                        obscureText: true,
                        validator: (value) {
                          return Validation.passwordValidation(value);
                        },
                        onChanged: (data) {
                          BlocProvider.of<UserCubit>(context)
                              .userModel
                              .userPassword = data;
                        },
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      CustomMainButton(
                        text: 'Sign Up',
                        onTap: () async {
                          if (SignUpViewBody._formKey.currentState!
                              .validate()) {
                            await BlocProvider.of<AuthCubit>(context)
                                .signUp(context);
                          } else {
                            setState(
                              () {
                                autovalidateMode = AutovalidateMode.always;
                              },
                            );
                          }
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Already have an account?',
                            style: GoogleFonts.roboto(
                              color: ConstColors.backgroundLightMode,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pushAndRemoveUntil(
                                CupertinoPageRoute(
                                  builder: (BuildContext context) {
                                    return const LogInView();
                                  },
                                ),
                                (_) => false,
                              );
                            },
                            child: Text(
                              'Sign In',
                              style: GoogleFonts.roboto(
                                color: ConstColors.primaryGoldColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          )
                        ],
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
