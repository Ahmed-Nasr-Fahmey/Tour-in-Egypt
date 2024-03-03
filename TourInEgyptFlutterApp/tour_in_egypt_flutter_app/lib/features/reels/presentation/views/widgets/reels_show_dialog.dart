
import 'package:flutter/material.dart';
import 'package:tour_in_egypt_flutter_app/constants.dart';

class ReelsShowDialog extends StatelessWidget {
  const ReelsShowDialog({
    super.key,
    required this.icon,
  });
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder(
        future: Future.delayed(const Duration(seconds: 1)),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return Icon(
              icon,
              size: 110,
              color: ConstColors.primaryGoldColor,
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
