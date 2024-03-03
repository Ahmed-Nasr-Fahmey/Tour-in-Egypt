import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:tour_in_egypt_flutter_app/constants.dart';
import 'package:tour_in_egypt_flutter_app/core/widgets/custom_main_app_bar.dart';
import 'package:tour_in_egypt_flutter_app/core/widgets/custom_main_button.dart';
import 'package:tour_in_egypt_flutter_app/core/widgets/settings_option.dart';
import 'package:tour_in_egypt_flutter_app/features/auth/presentation/views/log_in_view.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  static const String routeName = "SettingsView";

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  bool languageOption = true;
  bool themeOption = false;
  bool isDark = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isDark
          ? ConstColors.backgroundDarkMode
          : ConstColors.backgroundLightMode,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: CustomMainAppBar(
          title: 'Settings',
          hasBackgroundColor: false,
          hasBackIcon: true,
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SettingsOptions(
              option: "Language",
              optionIcon: ConstIcons.solidAccessibilityIcon,
              button: SizedBox(
                height: 30,
                child: ToggleSwitch(
                  customWidths: const [35, 35],
                  cornerRadius: 20.0,
                  activeBgColors: const [
                    [ConstColors.primaryGoldColor],
                    [ConstColors.primaryGoldColor]
                  ],
                  activeFgColor: Colors.white,
                  inactiveBgColor: ConstColors.primaryBlueColor,
                  inactiveFgColor: Colors.white,
                  totalSwitches: 2,
                  labels: const ["EN", "AR"],
                  fontSize: 10,
                  onToggle: (index) {
                    // debugPrint('switched to: $index');
                  },
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SettingsOptions(
              option: "Dark Mode",
              optionIcon: ConstIcons.solidMoodIcon,
              button: SizedBox(
                height: 30,
                child: CupertinoSwitch(
                  value: themeOption,
                  onChanged: (value) {
                    themeOption = value;
                    setState(() {
                      isDark = !isDark;
                    });
                  },
                  activeColor: ConstColors.primaryGoldColor,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Stack(
              children: [
                CustomMainButton(
                  text: 'Logout',
                  onTap: () {
                    Navigator.of(context).pushAndRemoveUntil(
                      CupertinoPageRoute(
                        builder: (BuildContext context) {
                          return const LogInView();
                        },
                      ),
                      (_) => false,
                    );
                  },
                ),
                const Positioned(
                  right: 16,
                  top: 10,
                  child: Icon(
                    Icons.logout,
                    color: ConstColors.primaryGoldColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
