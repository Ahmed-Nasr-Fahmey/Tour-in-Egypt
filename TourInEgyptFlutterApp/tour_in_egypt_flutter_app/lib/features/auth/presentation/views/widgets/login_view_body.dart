import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:tour_in_egypt_flutter_app/constants.dart';
import 'package:tour_in_egypt_flutter_app/core/utils/functions/validation.dart';
import 'package:tour_in_egypt_flutter_app/core/utils/manager/user_cubit.dart';
import 'package:tour_in_egypt_flutter_app/core/widgets/custom_main_button.dart';
import 'package:tour_in_egypt_flutter_app/core/widgets/custom_text_form_field.dart';
import 'package:tour_in_egypt_flutter_app/features/auth/presentation/manager/auth_cubit.dart';
import 'package:tour_in_egypt_flutter_app/features/auth/presentation/views/forget_password_view.dart';
import 'package:tour_in_egypt_flutter_app/features/auth/presentation/views/sign_up_view.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({
    super.key,
  });

  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
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
            'Login',
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
          key: LoginViewBody._formKey,
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
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 24,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                        onChanged: (data) {
                          BlocProvider.of<UserCubit>(context)
                              .userModel
                              .userEmail = data;
                        },
                        hintText: 'Enter your Email',
                        suffixIcon: ConstIcons.emailIcon,
                        isPassword: false,
                        obscureText: false,
                        validator: (value) {
                          return Validation.emailValidation(value);
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
                        onChanged: (data) {
                          BlocProvider.of<UserCubit>(context)
                              .userModel
                              .userPassword = data;
                        },
                        hintText: 'Enter your Password',
                        suffixIcon: ConstIcons.solidEyeSlashIcon,
                        isPassword: true,
                        obscureText: true,
                        validator: (value) {
                          return Validation.passwordValidation(value);
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {
                              PersistentNavBarNavigator
                                  .pushNewScreenWithRouteSettings(
                                context,
                                settings: const RouteSettings(
                                    name: ForgetPasswordView.routeName),
                                screen: const ForgetPasswordView(),
                                withNavBar: false,
                                pageTransitionAnimation:
                                    PageTransitionAnimation.cupertino,
                              );
                            },
                            child: Text(
                              'Forget Password?',
                              style: GoogleFonts.roboto(
                                color: ConstColors.primaryGoldColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 35,
                      ),
                      CustomMainButton(
                        text: 'Login',
                        onTap: () async {
                          if (LoginViewBody._formKey.currentState!.validate()) {
                            //DeleteIt

                            await BlocProvider.of<AuthCubit>(context).signIn(
                              context: context,
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
                      const SizedBox(
                        height: 20,
                      ),
                      Stack(
                        children: [
                          GestureDetector(
                            onTap: () async {
                              // await BlocProvider.of<AuthCubit>(context)
                              //     .signInWithGoogle();
                            },
                            child: Container(
                              width: double.infinity,
                              height: 40,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: ConstColors.primaryGoldColor),
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Center(
                                child: Text(
                                  'Continue with Google',
                                  style: GoogleFonts.roboto(
                                    color: ConstColors.primaryGoldColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const Positioned(
                            top: 10,
                            left: 20,
                            child: ConstIcons.googleIcon,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Don’t have an account?',
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
                                    return const SignUpView();
                                  },
                                ),
                                (_) => false,
                              );
                            },
                            child: Text(
                              'Sign Up',
                              style: GoogleFonts.roboto(
                                color: ConstColors.primaryGoldColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),

                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: [
                      //     const Spacer(
                      //       flex: 2,
                      //     ),
                      //     GestureDetector(
                      //       onTap: () {},
                      //       child: Image.asset(
                      //         ConstIcons.facebookIconPath,
                      //         height: 48,
                      //       ),
                      //     ),
                      //     const Spacer(
                      //       flex: 1,
                      //     ),
                      //     GestureDetector(
                      //       onTap: () async {
                      // await BlocProvider.of<AuthCubit>(
                      //         context)
                      //     .signInWithGoogle();
                      //       },
                      //       child: Image.asset(
                      //         ConstIcons.googleIconPath,
                      //         height: 48,
                      //       ),
                      //     ),
                      //     const Spacer(
                      //       flex: 1,
                      //     ),
                      //     GestureDetector(
                      //       onTap: () {},
                      //       child: Image.asset(
                      //         ConstIcons.appleIconPath,
                      //         height: 48,
                      //       ),
                      //     ),
                      //     const Spacer(
                      //       flex: 2,
                      //     ),
                      //   ],
                      // )
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
