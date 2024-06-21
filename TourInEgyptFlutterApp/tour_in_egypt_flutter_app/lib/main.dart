import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:tour_in_egypt_flutter_app/core/utils/manager/user_cubit.dart';
import 'package:tour_in_egypt_flutter_app/features/auth/presentation/manager/auth_cubit.dart';
import 'package:tour_in_egypt_flutter_app/features/auth/presentation/manager/display_filter_provider.dart';
import 'package:tour_in_egypt_flutter_app/features/auth/presentation/views/splash_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");

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

// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   void initState() {
//     super.initState();
//   }

//   Future<void> searchPlace(String query) async {
//     try {
//       List<SearchInfo> suggestions = await addressSuggestion(
//           "address"); // Handle the result, e.g., show a list of suggestions
//       log(suggestions
//           .toString()); // For demonstration purposes, we're just printing the result
//     } catch (e) {
//       log("Error searching for places: $e");
//     }
//   }

//   // void pickLocation() async {
//   //   try {
//   //     var location = await osmPlugin.pickLocation();
//   //     if (location != null) {
//   //       // Handle the selected location, e.g., display it on a map
//   //       print(
//   //           location); // For demonstration purposes, we're just printing the location
//   //     }
//   //   } catch (e) {
//   //     print("Error picking location: $e");
//   //   }
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Search and Pick Location'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             IconButton(
//               onPressed: () async {
//                 List<SearchInfo> suggestions = await addressSuggestion("");
//                 for (var suggestion in suggestions) {
//                   log(suggestion.address.toString());
//                   log(suggestion.point.toString());
//                 }
//               },
//               icon: Icon(Icons.location_searching),
//             ),
//             // Add other widgets for displaying search results or selected location
//           ],
//         ),
//       ),
//     );
//   }
// }
