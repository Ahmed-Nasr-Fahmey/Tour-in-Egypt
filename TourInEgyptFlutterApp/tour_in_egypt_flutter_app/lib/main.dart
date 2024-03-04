import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:tour_in_egypt_flutter_app/core/utils/manager/user_cubit.dart';
import 'package:tour_in_egypt_flutter_app/features/auth/presentation/manager/auth_cubit.dart';
import 'package:tour_in_egypt_flutter_app/features/auth/presentation/manager/display_filter_provider.dart';
import 'package:tour_in_egypt_flutter_app/features/auth/presentation/views/splash_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
        BlocProvider(
          create: (context) => UserCubit(),
        ),
      ],
      child: const TourinEgypt(),
    ),
  );
}

class TourinEgypt extends StatelessWidget {
  const TourinEgypt({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DisplayCategoryProvider>(
      create: (context) => DisplayCategoryProvider(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashView(),
        // initialRoute: CustomBottomNavigationBar.routeName,
        // onGenerateRoute: Routes.generateRoute,
      ),
    );
  }
}
