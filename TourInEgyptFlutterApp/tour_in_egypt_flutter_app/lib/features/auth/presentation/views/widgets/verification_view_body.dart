import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:tour_in_egypt_flutter_app/constants.dart';
import 'package:tour_in_egypt_flutter_app/core/widgets/custom_main_button.dart';
import 'package:tour_in_egypt_flutter_app/features/auth/presentation/manager/auth_cubit.dart';
import 'package:tour_in_egypt_flutter_app/features/auth/presentation/views/widgets/text_gold_large.dart';

class VerificationViewBody extends StatelessWidget {
  const VerificationViewBody({
    super.key,
    required this.emailToVerify,
  });
  final String emailToVerify;

  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
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
            text: 'Verification',
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.11,
        ),
        ClipRect(
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
                child: Form(
                  key: _formKey,
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
                            'Verification Code',
                            style: GoogleFonts.roboto(
                              fontSize: 22,
                              color: ConstColors.primaryGoldColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 70,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Enter ',
                            style: GoogleFonts.roboto(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Verification Code',
                            style: GoogleFonts.roboto(
                              fontSize: 16,
                              color: ConstColors.primaryGoldColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 60,
                      ),
                      PinCodeTextField(
                        appContext: context,
                        length: 4,
                        obscureText: false,
                        keyboardType: TextInputType.number,
                        pinTheme: PinTheme(
                          shape: PinCodeFieldShape.circle,
                          borderRadius: BorderRadius.circular(5),
                          fieldHeight: 50,
                          fieldWidth: 50,
                          activeFillColor: ConstColors.primaryGoldColor,
                          activeBorderWidth: 3,
                          activeColor: ConstColors.primaryGoldColor,
                          borderWidth: 3,
                          selectedBorderWidth: 3,
                          selectedFillColor: ConstColors.primaryGoldColor,
                          selectedColor: ConstColors.primaryGoldColor,
                          inactiveColor: ConstColors.primaryGoldColor,
                        ),
                        hintCharacter: "_",
                        hintStyle: const TextStyle(
                          color: ConstColors.primaryGoldColor,
                        ),
                        textStyle: GoogleFonts.roboto(
                          color: ConstColors.primaryGoldColor,
                          fontSize: 16,
                        ),
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        cursorColor: ConstColors.primaryGoldColor,
                        cursorHeight: 20,
                        cursorWidth: 2,
                        validator: (pin) {
                          if (pin!.length < 4) {
                            return "";
                          } else {
                            BlocProvider.of<AuthCubit>(context)
                                .vereficationOTP = pin;
                            return null;
                          }
                        },
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Do not sent code ?',
                            style: GoogleFonts.roboto(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          GestureDetector(
                            child: Text(
                              '\t \t \t \t \t \t Resend code',
                              style: GoogleFonts.roboto(
                                fontSize: 16,
                                color: ConstColors.primaryGoldColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            onTap: () async {
                              await BlocProvider.of<AuthCubit>(context)
                                  .sendConfirmationCode(
                                email: emailToVerify,
                              );
                            },
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 60,
                      ),
                      CustomMainButton(
                        text: "Verify",
                        onTap: () async {
                          if (_formKey.currentState!.validate()) {
                            await BlocProvider.of<AuthCubit>(context)
                                .verifyConfirmationCode(
                              email: emailToVerify,
                              confirmationCode:
                                  BlocProvider.of<AuthCubit>(context)
                                      .vereficationOTP,
                            );
                          }
                        },
                      )
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
