import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:tour_in_egypt_flutter_app/constants.dart';
import 'package:tour_in_egypt_flutter_app/core/utils/functions/show_snack_bar.dart';
import 'package:tour_in_egypt_flutter_app/core/utils/functions/unfocus_textfield.dart';
import 'package:tour_in_egypt_flutter_app/core/widgets/custom_main_app_bar.dart';
import 'package:tour_in_egypt_flutter_app/features/auth/presentation/manager/auth_cubit.dart';
import 'package:tour_in_egypt_flutter_app/features/auth/presentation/manager/auth_state.dart';
import 'package:tour_in_egypt_flutter_app/features/auth/presentation/views/log_in_view.dart';
import 'package:tour_in_egypt_flutter_app/features/auth/presentation/views/widgets/new_password_view_body.dart';

class NewPasswordView extends StatelessWidget {
  const NewPasswordView({super.key, required this.email});

  static const String routeName = "NewPasswordView";
  final String email;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(listener: (context, state) {
      if (state is NewPasswordLoadingState) {
        BlocProvider.of<AuthCubit>(context).isLoading = true;
      } else if (state is NewPasswordSuccessState) {
        BlocProvider.of<AuthCubit>(context).isLoading = false;
        Navigator.of(context).pushAndRemoveUntil(
          CupertinoPageRoute(
            builder: (BuildContext context) {
              return const LogInView();
            },
          ),
          (_) => false,
        );
      } else if (state is NewPasswordFailureState) {
        showSnackBar(context, state.erorrMessage);
        BlocProvider.of<AuthCubit>(context).isLoading = false;
      }
    }, builder: (context, state) {
      return ModalProgressHUD(
        color: Colors.black,
        opacity: 0.4,
        progressIndicator: const CircularProgressIndicator(
          color: ConstColors.primaryGoldColor,
          backgroundColor: ConstColors.primaryBlueColor,
        ),
        inAsyncCall: BlocProvider.of<AuthCubit>(context).isLoading,
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(ConstIcons.backgroundImage),
            ),
          ),
          child: GestureDetector(
            onTap: () {
              unFocusTextFieldsWhenClickOutSide(context);
            },
            child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: const PreferredSize(
                preferredSize: Size.fromHeight(60),
                child: CustomMainAppBar(
                  hasBackgroundColor: false,
                  hasBackIcon: true,
                ),
              ),
              body: NewPasswordViewBody(email: email),
            ),
          ),
        ),
      );
    });
  }
}
