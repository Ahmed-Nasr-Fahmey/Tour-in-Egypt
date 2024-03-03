import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tour_in_egypt_flutter_app/constants.dart';

class CustomMainAppBar extends StatelessWidget {
  const CustomMainAppBar({
    super.key,
    this.title,
    this.actions,
    required this.hasBackgroundColor,
    required this.hasBackIcon,
  });
  final String? title;
  final List<Widget>? actions;
  final bool hasBackgroundColor;
  final bool hasBackIcon;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: hasBackIcon
          ? IconButton(
              icon: ConstIcons.solidBakeIcon,
              onPressed: () {
                Navigator.pop(context);
              },
            )
          : const SizedBox(),
      elevation: hasBackgroundColor ? 1 : 0,
      backgroundColor: hasBackgroundColor
          ? ConstColors.backgroundLightMode
          : Colors.transparent,
      centerTitle: true,
      title: title != null
          ? Text(
              title!,
              style: GoogleFonts.roboto(
                color: ConstColors.primaryBlueColor,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            )
          : null,
      actions: actions,
    );
  }
}
