import 'package:flutter/material.dart';
import 'package:tour_in_egypt_flutter_app/core/widgets/custom_main_app_bar.dart';
import 'package:tour_in_egypt_flutter_app/features/profile/presentation/views/widgets/edit_profile_view_body.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  static const String routeName = 'EditProfileView';
  static final formKey = GlobalKey<FormState>();
  static final TextEditingController userNameController =
      TextEditingController();
  static final TextEditingController userEmailController =
      TextEditingController();
  static final TextEditingController userPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: CustomMainAppBar(
          title: 'Edit Profile',
          hasBackgroundColor: true,
          hasBackIcon: true,
        ),
      ),
      body: EditProfileViewBody(
          formKey: formKey,
          userNameController: userNameController,
          userEmailController: userEmailController,
          userPasswordController: userPasswordController),
    );
  }
}
