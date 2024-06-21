import 'package:flutter/material.dart';
import 'package:tour_in_egypt_flutter_app/constants.dart';

class CustomMainTabBarOptions extends StatefulWidget {
  const CustomMainTabBarOptions(
      {super.key, required this.name, required this.index});
  final int index;
  final String name;

  @override
  State<CustomMainTabBarOptions> createState() =>
      _CustomMainTabBarOptionsState();
}

class _CustomMainTabBarOptionsState extends State<CustomMainTabBarOptions> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 34,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: widget.index != -1 ? ConstColors.primaryBlueColor : Colors.white,
        border: Border.all(width: 2, color: ConstColors.primaryBlueColor),
      ),
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          minWidth: 100,
        ),
        child: Center(
          child: Text(
            widget.name,
            style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: widget.index != -1
                    ? Colors.white
                    : ConstColors.primaryBlueColor),
          ),
        ),
      ),
    );
  }
}
