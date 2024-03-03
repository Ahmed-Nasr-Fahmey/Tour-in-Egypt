import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:tour_in_egypt_flutter_app/constants.dart';
import 'package:tour_in_egypt_flutter_app/core/utils/functions/show_snack_bar.dart';
import 'package:tour_in_egypt_flutter_app/core/utils/functions/unfocus_textfield.dart';
import 'package:tour_in_egypt_flutter_app/core/widgets/custom_main_app_bar.dart';
import 'package:tour_in_egypt_flutter_app/features/auth/presentation/manager/auth_cubit.dart';
import 'package:tour_in_egypt_flutter_app/features/auth/presentation/manager/auth_state.dart';
import 'package:tour_in_egypt_flutter_app/features/auth/presentation/views/new_password_view.dart';
import 'package:tour_in_egypt_flutter_app/features/auth/presentation/views/widgets/verification_view_body.dart';

class VerificationView extends StatelessWidget {
  const VerificationView({super.key, required this.emailToVerify});
  final String emailToVerify;

  static const String routeName = "VerificationView";

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => unFocusTextFieldsWhenClickOutSide(context),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is VerificationLoadingState) {
            BlocProvider.of<AuthCubit>(context).isLoading = true;
          } else if (state is VerificationSuccessState) {
            BlocProvider.of<AuthCubit>(context).isLoading = false;
            PersistentNavBarNavigator.pushNewScreenWithRouteSettings(
              context,
              settings: const RouteSettings(name: NewPasswordView.routeName),
              screen:  NewPasswordView(email: emailToVerify),
              withNavBar: false,
              pageTransitionAnimation: PageTransitionAnimation.cupertino,
            );
          } else if (state is VerificationFailureState) {
            showSnackBar(context, state.erorrMessage);
            BlocProvider.of<AuthCubit>(context).isLoading = false;
          }
        },
        builder: (context, state) {
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
              child: Scaffold(
                backgroundColor: Colors.transparent,
                appBar: const PreferredSize(
                  preferredSize: Size.fromHeight(60),
                  child: CustomMainAppBar(
                    hasBackgroundColor: false,
                    hasBackIcon: true,
                  ),
                ),
                body: VerificationViewBody(emailToVerify: emailToVerify),
              ),
            ),
          );
        },
      ),
    );
  }
}
