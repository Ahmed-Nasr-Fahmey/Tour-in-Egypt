import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:tour_in_egypt_flutter_app/constants.dart';
import 'package:tour_in_egypt_flutter_app/core/utils/functions/show_snack_bar.dart';
import 'package:tour_in_egypt_flutter_app/core/utils/functions/unfocus_textfield.dart';
import 'package:tour_in_egypt_flutter_app/core/widgets/bottom_navigation_bar.dart';
import 'package:tour_in_egypt_flutter_app/features/auth/presentation/manager/auth_cubit.dart';
import 'package:tour_in_egypt_flutter_app/features/auth/presentation/manager/auth_state.dart';
import 'package:tour_in_egypt_flutter_app/features/auth/presentation/views/widgets/login_view_body.dart';

class LogInView extends StatelessWidget {
  const LogInView({super.key});
  static const String routeName = "LogInView";

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is LoginLoadingState) {
          BlocProvider.of<AuthCubit>(context).isLoading = true;
        } else if (state is LoginSuccessState) {
          BlocProvider.of<AuthCubit>(context).isLoading = false;
          Navigator.of(context).pushAndRemoveUntil(
            CupertinoPageRoute(
              builder: (BuildContext context) {
                return const CustomBottomNavigationBar();
              },
            ),
            (_) => false,
          );
        } else if (state is LoginFaliureState) {
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
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: GestureDetector(
              onTap: () {
                unFocusTextFieldsWhenClickOutSide(context);
              },
              child: const Scaffold(
                backgroundColor: Colors.transparent,
                body: LoginViewBody(),
              ),
            ),
          ),
        );
      },
    );
  }
}
