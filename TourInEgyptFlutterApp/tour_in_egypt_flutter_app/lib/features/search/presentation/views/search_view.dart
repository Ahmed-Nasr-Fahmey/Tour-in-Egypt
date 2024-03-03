import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:tour_in_egypt_flutter_app/constants.dart';
import 'package:tour_in_egypt_flutter_app/core/utils/functions/unfocus_textfield.dart';
import 'package:tour_in_egypt_flutter_app/core/widgets/custom_main_app_bar.dart';
import 'package:tour_in_egypt_flutter_app/core/widgets/custom_profile_text_form_field.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});
  static const String routeName = 'SearchView';

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  var text = 'Hold the button and start Speaking...';
  SpeechToText speechToText = SpeechToText();
  var isListening = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => unFocusTextFieldsWhenClickOutSide(context),
      child: Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: CustomMainAppBar(
            title: 'Search',
            hasBackgroundColor: true,
            hasBackIcon: false,
          ),
        ),
        body: SingleChildScrollView(
          reverse: true,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                const SizedBox(
                  height: 24,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 5,
                      child: CustomProfileTextFormField(
                        hintText: 'Search',
                        suffixIcon: ConstIcons.solidSearchGoldIcon,
                        validator: (valu) {
                          if (valu!.isNotEmpty) {
                            return null;
                          } else {
                            return 'Feild is required';
                          }
                        },
                        obscureText: false,
                        isPassword: false,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTapDown: (details) async {
                          if (!isListening) {
                            var available = await speechToText.initialize();
                            if (available) {
                              setState(() {
                                isListening = true;
                                speechToText.listen(
                                  onResult: (result) {
                                    setState(() {
                                      text = result.recognizedWords;
                                    });
                                  },
                                );
                              });
                            }
                          }
                        },
                        onTapUp: (details) {
                          setState(() {
                            isListening = false;
                          });
                          speechToText.stop();
                        },
                        child: AvatarGlow(
                          endRadius: 33,
                          animate: isListening,
                          duration: const Duration(milliseconds: 2000),
                          glowColor: ConstColors.primaryGoldColor,
                          repeatPauseDuration:
                              const Duration(milliseconds: 100),
                          showTwoGlows: true,
                          child: const CircleAvatar(
                            backgroundColor: Colors.transparent,
                            radius: 100,
                            child: ConstIcons.solidMicrophoneIcon,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.width * 0.25,
                  child: Text(
                    text,
                    style: GoogleFonts.roboto(
                      color: ConstColors.primaryBlueColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.85,
                      height: MediaQuery.of(context).size.width * 0.85,
                      decoration: const ShapeDecoration(
                        color: ConstColors.primaryBlueColor,
                        shape: OvalBorder(),
                      ),
                    ),
                    AnimatedPositioned(
                      duration: const Duration(milliseconds: 500),
                      right: MediaQuery.of(context).size.width *
                          (isListening ? 0.1 : 0.2),
                      left: MediaQuery.of(context).size.width *
                          (isListening ? 0.1 : 0.2),
                      top: MediaQuery.of(context).size.width *
                          (isListening ? 0.1 : 0.2),
                      bottom: MediaQuery.of(context).size.width *
                          (isListening ? 0.1 : 0.2),
                      child: Container(
                        decoration: const ShapeDecoration(
                          color: ConstColors.primaryBlueColor,
                          shape: OvalBorder(),
                          shadows: [
                            BoxShadow(
                              color: Color(0xFF000000),
                              blurRadius: 100,
                              offset: Offset(0, 0),
                              spreadRadius: 4,
                            )
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      right: MediaQuery.of(context).size.width * 0.3,
                      left: MediaQuery.of(context).size.width * 0.3,
                      top: MediaQuery.of(context).size.width * 0.3,
                      bottom: MediaQuery.of(context).size.width * 0.3,
                      child: Container(
                        width: 116,
                        height: 116,
                        decoration: const ShapeDecoration(
                          color: ConstColors.primaryBlueColor,
                          shape: OvalBorder(),
                          shadows: [
                            BoxShadow(
                              color: Color(0xFF000000),
                              blurRadius: 80,
                              offset: Offset(0, 0),
                              spreadRadius: 2,
                            )
                          ],
                        ),
                        child: const Center(
                            child: Icon(
                          Icons.mic,
                          color: ConstColors.backgroundLightMode,
                          size: 42,
                        )),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
