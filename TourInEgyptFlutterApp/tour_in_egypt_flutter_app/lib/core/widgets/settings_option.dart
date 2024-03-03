import 'package:flutter/material.dart';
import 'package:tour_in_egypt_flutter_app/constants.dart';

class SettingsOptions extends StatelessWidget {
  const SettingsOptions(
      {super.key,
      required this.option,
      required this.optionIcon,
      required this.button});

  final String option;
  final Widget optionIcon;
  final Widget button;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 1,
                child: optionIcon,
              ),
              Expanded(
                flex: 4,
                child: Text(
                  option,
                  style: const TextStyle(
                      fontSize: 16,
                      color: ConstColors.primaryBlueColor,
                      fontWeight: FontWeight.w600),
                ),
              ),
              button
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          const Divider(
            color: ConstColors.primaryBlueColor,
          ),
        ],
      ),
      onTap: () {
        /// ToDo Function of the button
      },
    );
  }
}
