import 'package:flutter/material.dart';
import 'package:tour_in_egypt_flutter_app/constants.dart';

// ignore: must_be_immutable
class CustomProfileTextFormField extends StatefulWidget {
  CustomProfileTextFormField({
    super.key,
    required this.hintText,
    required this.suffixIcon,
    required this.validator,
    required this.obscureText,
    required this.isPassword,
    this.onChanged,
    this.controller,
  });

  final String? hintText;
  Widget? suffixIcon;
  String? Function(String?)? validator;
  Function(String)? onChanged;
  bool obscureText;
  bool isPassword;
  TextEditingController? controller;

  @override
  State<CustomProfileTextFormField> createState() =>
      _CustomProfileTextFormFieldState();
}

class _CustomProfileTextFormFieldState
    extends State<CustomProfileTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(
        color: ConstColors.profileTextColor,
        fontSize: 12,
      ),
      decoration: InputDecoration(
        suffixIcon: Padding(
          padding: const EdgeInsets.all(12),
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
        filled: true,
        fillColor: ConstColors.profileFilledTextField,
        hintText: widget.hintText,
        hintStyle: const TextStyle(
          color: ConstColors.profileTextColor,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            width: 1,
            color: ConstColors.profileFilledTextField,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            color: ConstColors.primaryGoldColor,
            width: 1,
          ),
        ),
      ),
      validator: widget.validator,
      onChanged: widget.onChanged,
      obscureText: widget.obscureText,
      controller: widget.controller,
    );
  }
}
