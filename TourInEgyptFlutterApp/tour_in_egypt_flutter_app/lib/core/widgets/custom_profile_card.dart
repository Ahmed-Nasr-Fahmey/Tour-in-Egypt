import 'package:flutter/material.dart';
import 'package:tour_in_egypt_flutter_app/constants.dart';

class CustomProfileCard extends StatelessWidget {
  const CustomProfileCard(
      {super.key,
      required this.usageText,
      required this.userName,
      required this.onPressed});
  final String userName;
  final void Function()? onPressed;
  final String usageText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircleAvatar(
            backgroundColor: ConstColors.primaryGoldColor,
            radius: 65,
            child: CircleAvatar(
              radius: 62,
              backgroundImage: NetworkImage(
                  "https://img.freepik.com/free-photo/old-black-background-grunge-texture-dark-wallpaper-blackboard-chalkboard-room-wall_1258-28312.jpg?w=1480&t=st=1698250073~exp=1698250673~hmac=5d72e0c6d479410469813b2d7cb69d1a772fbcd7edd9ea59e7624e38dff220b0"),
            ),
          ),
          const Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                userName,
                style: const TextStyle(
                    color: ConstColors.primaryBlueColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 40,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ConstColors.primaryBlueColor,
                  ),
                  onPressed: onPressed,
                  child: Row(
                    children: [
                      Text(
                        usageText,
                        style: const TextStyle(color: Colors.white),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      const Icon(
                        Icons.edit,
                        size: 18,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
