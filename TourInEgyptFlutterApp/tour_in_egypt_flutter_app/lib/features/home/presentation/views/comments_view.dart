import 'package:flutter/material.dart';
import 'package:tour_in_egypt_flutter_app/constants.dart';
import 'package:tour_in_egypt_flutter_app/core/utils/functions/unfocus_textfield.dart';
import 'package:tour_in_egypt_flutter_app/core/widgets/comments_card_builder.dart';
import 'package:tour_in_egypt_flutter_app/core/widgets/custom_main_app_bar.dart';
import 'package:tour_in_egypt_flutter_app/core/widgets/custom_profile_text_form_field.dart';

class CommentsView extends StatelessWidget {
  const CommentsView({super.key});
  static const String routeName = 'CommentsView';
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => unFocusTextFieldsWhenClickOutSide(context),
      child: Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: CustomMainAppBar(
            title: 'Comments',
            hasBackgroundColor: true,
            hasBackIcon: true,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const CommentsCardBuilder(),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: CustomProfileTextFormField(
                  hintText: 'Write a Comment',
                  suffixIcon: ConstIcons.solidSendCommentIcon,
                  validator: (value) {
                    if (!value!.isNotEmpty) {
                      return 'Write a Comment';
                    } else {
                      return null;
                    }
                  },
                  obscureText: false,
                  isPassword: false,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
