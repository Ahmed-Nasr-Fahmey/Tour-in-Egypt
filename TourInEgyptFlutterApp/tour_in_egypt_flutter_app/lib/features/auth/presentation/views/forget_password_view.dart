import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:tour_in_egypt_flutter_app/constants.dart';
import 'package:tour_in_egypt_flutter_app/core/utils/functions/show_snack_bar.dart';
import 'package:tour_in_egypt_flutter_app/core/utils/functions/unfocus_textfield.dart';
import 'package:tour_in_egypt_flutter_app/core/widgets/custom_main_app_bar.dart';
import 'package:tour_in_egypt_flutter_app/features/auth/presentation/manager/auth_cubit.dart';
import 'package:tour_in_egypt_flutter_app/features/auth/presentation/manager/auth_state.dart';
import 'package:tour_in_egypt_flutter_app/features/auth/presentation/views/verification_view.dart';
import 'package:tour_in_egypt_flutter_app/features/auth/presentation/views/widgets/forget_password_view_body.dart';
import 'package:tour_in_egypt_flutter_app/features/auth/presentation/views/widgets/text_gold_large.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  static const String routeName = "ForgetPasswordView";
  static final TextEditingController emailToVerifyController =
      TextEditingController();
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is ForgetPasswordLoadingState) {
          BlocProvider.of<AuthCubit>(context).isLoading = true;
        } else if (state is ForgetPasswordSuccessState) {
          BlocProvider.of<AuthCubit>(context).isLoading = false;
          PersistentNavBarNavigator.pushNewScreenWithRouteSettings(
            context,
            settings: const RouteSettings(name: VerificationView.routeName),
            screen:
                VerificationView(emailToVerify: emailToVerifyController.text),
            withNavBar: false,
            pageTransitionAnimation: PageTransitionAnimation.cupertino,
          );
        } else if (state is ForgetPasswordFailureState) {
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
                body: SizedBox(
                  child: SingleChildScrollView(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: screenHeight * 0.08,
                          ),
                          const Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: LargeGoldText(
                                  text: 'Forget Password',
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: screenHeight * 0.11,
                          ),
                          ForgetPasswordViewBody(
                            screenWidth: screenWidth,
                            screenHeight: screenHeight,
                            emailToVerifyController: emailToVerifyController,
                            formKey: _formKey,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
