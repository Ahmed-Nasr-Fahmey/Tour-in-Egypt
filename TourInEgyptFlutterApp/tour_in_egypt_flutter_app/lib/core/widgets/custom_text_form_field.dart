import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tour_in_egypt_flutter_app/constants.dart';

// ignore: must_be_immutable
class CustomTextFormField extends StatefulWidget {
  CustomTextFormField({
    super.key,
    required this.hintText,
    required this.suffixIcon,
    required this.validator,
    required this.obscureText,
    required this.isPassword,
    this.onChanged,
    this.controller,
  });
  String? hintText;
  Widget? suffixIcon;
  String? Function(String?)? validator;
  Function(String)? onChanged;
  bool obscureText;
  bool isPassword;
  TextEditingController? controller;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: widget.onChanged,
      obscureText: widget.obscureText,
      style: GoogleFonts.roboto(
        color: ConstColors.onBoardingIconsAndHintColor,
        fontSize: 12,
        fontWeight: FontWeight.w600,
      ),
      cursorColor: ConstColors.primaryGoldColor,
      decoration: InputDecoration(
        filled: true,
        fillColor: ConstColors.textFieldBackgroundColor,
        hintText: widget.hintText,
        hintStyle: GoogleFonts.roboto(
          color: ConstColors.onBoardingIconsAndHintColor,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            color: ConstColors.textFieldBackgroundColor,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            color: ConstColors.primaryGoldColor,
            width: 1,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            color: ConstColors.primaryGoldColor,
            width: 1,
          ),
        ),
        suffixIcon: Padding(
          padding: const EdgeInsets.all(14),
          child: !widget.isPassword
              ? widget.suffixIcon
              : GestureDetector(
                  onTap: () {
                    setState(
                      () {
                        widget.obscureText = !widget.obscureText;
                        if (widget.obscureText) {
                          widget.suffixIcon = ConstIcons.solidEyeSlashIcon;
                        } else {
                          widget.suffixIcon = ConstIcons.solidEyeIcon;
                        }
                      },
                    );
                  },
                  child: widget.suffixIcon,
                ),
        ),
      ),
      validator: widget.validator,
      controller: widget.controller,
    );
  }
}
