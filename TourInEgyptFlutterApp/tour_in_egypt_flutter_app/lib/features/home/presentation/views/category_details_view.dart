import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tour_in_egypt_flutter_app/constants.dart';
import 'package:tour_in_egypt_flutter_app/core/utils/functions/validation.dart';
import 'package:tour_in_egypt_flutter_app/core/widgets/custom_main_app_bar.dart';
import 'package:tour_in_egypt_flutter_app/core/widgets/custom_main_button.dart';
import 'package:tour_in_egypt_flutter_app/core/widgets/custom_main_tab_bar.dart';
import 'package:tour_in_egypt_flutter_app/core/widgets/custom_profile_text_form_field.dart';
import 'package:tour_in_egypt_flutter_app/features/auth/presentation/manager/display_filter_provider.dart';
import 'package:tour_in_egypt_flutter_app/features/auth/presentation/manager/static_category_data.dart';
import 'package:tour_in_egypt_flutter_app/features/home/presentation/views/widgets/category_header.dart';

class CategoryDetailsView extends StatelessWidget {
  const CategoryDetailsView({super.key});

  static const String routeName = "categoryDetailsView";

  @override
  Widget build(BuildContext context) {
    DisplayCategoryProvider display =
        Provider.of<DisplayCategoryProvider>(context);
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: CustomMainAppBar(
          title: "Restaurant",
          hasBackgroundColor: true,
          hasBackIcon: true,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                CategoryHeader(categoryModel: display.displayCategory[0]),
                const Padding(
                  padding: EdgeInsets.only(left: 15, top: 25),
                  child: Text(
                    "Description",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: ConstColors.primaryBlueColor),
                  ),
                ),
                const Padding(
                  padding:
                      EdgeInsets.only(left: 15, top: 15, right: 15, bottom: 5),
                  child: Text(
                    "Sayed Hanafy is an Egyptian company in the field of koshary industry.",
                    style: TextStyle(
                      fontSize: 14,
                      color: ConstColors.primaryBlueColor,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 15, left: 15, bottom: 15),
                  child: Divider(
                    color: ConstColors.primaryBlueColor,
                  ),
                ),
                Center(
                    child: CustomMainTabBar(
                        governorateModel: StaticCategoryData.governorateModel)),
                const Padding(
                  padding: EdgeInsets.only(right: 15, left: 15, top: 5),
                  child: Divider(
                    color: ConstColors.primaryBlueColor,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 15, top: 8),
                  child: Text(
                    "Location",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: ConstColors.primaryBlueColor),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: CustomProfileTextFormField(
                      hintText: "Enter Your Location",
                      suffixIcon: const Icon(Icons.my_location),
                      validator: Validation.emailValidation,
                      obscureText: false,
                      isPassword: false),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
                  child: CustomProfileTextFormField(
                      hintText: "Enter Your Destination",
                      suffixIcon: const Icon(Icons.my_location),
                      validator: Validation.emailValidation,
                      obscureText: false,
                      isPassword: false),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: SizedBox(
                    height: 300,
                    child: Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/map.png"),
                            fit: BoxFit.fill),
                      ),
                      alignment: Alignment.bottomRight,
                      child: ElevatedButton(
                        onPressed: () {
                          ///ToDo Location Option
                        },
                        child: const Icon(Icons.redo_outlined),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: CustomMainButton(
                      text: "Take Uber",
                      onTap: () {
                        ///ToDo Uber Func
                      }),
                ),
                const SizedBox(
                  height: 45,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 15, bottom: 20),
                  child: Text(
                    "Metro",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: ConstColors.primaryBlueColor),
                  ),
                ),
                const Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 13, right: 13),
                      child: Image(
                        image: AssetImage("assets/location.png"),
                        height: 60,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(top: 15, right: 15, bottom: 5),
                        child: Text(
                          "Sayed Hanafy is an Egyptian company in the field of koshary industry.",
                          style: TextStyle(
                              fontSize: 14,
                              color: ConstColors.primaryBlueColor),
                        ),
                      ),
                    ),
                  ],
                ),
                const Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 13, right: 13),
                      child: Image(
                        image: AssetImage("assets/location.png"),
                        height: 60,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(top: 15, right: 15, bottom: 5),
                        child: Text(
                          "Sayed Hanafy is an Egyptian company in the field of koshary industry.",
                          style: TextStyle(
                              fontSize: 14,
                              color: ConstColors.primaryBlueColor),
                        ),
                      ),
                    ),
                  ],
                ),
                const Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 13, right: 13),
                      child: Image(
                        image: AssetImage("assets/location.png"),
                        height: 60,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(top: 15, right: 15, bottom: 5),
                        child: Text(
                          "Sayed Hanafy is an Egyptian company in the field of koshary industry.",
                          style: TextStyle(
                              fontSize: 14,
                              color: ConstColors.primaryBlueColor),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 15, bottom: 20),
                  child: Text(
                    "Bus",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: ConstColors.primaryBlueColor),
                  ),
                ),
                const Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 13, right: 13),
                      child: Image(
                        image: AssetImage("assets/location.png"),
                        height: 60,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(top: 15, right: 15, bottom: 5),
                        child: Text(
                          "Sayed Hanafy is an Egyptian company in the field of koshary industry.",
                          style: TextStyle(
                              fontSize: 14,
                              color: ConstColors.primaryBlueColor),
                        ),
                      ),
                    ),
                  ],
                ),
                const Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 13, right: 13),
                      child: Image(
                        image: AssetImage("assets/location.png"),
                        height: 60,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(top: 15, right: 15, bottom: 5),
                        child: Text(
                          "Sayed Hanafy is an Egyptian company in the field of koshary industry.",
                          style: TextStyle(
                              fontSize: 14,
                              color: ConstColors.primaryBlueColor),
                        ),
                      ),
                    ),
                  ],
                ),
                const Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 13, right: 13),
                      child: Image(
                        image: AssetImage("assets/location.png"),
                        height: 60,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(top: 15, right: 15, bottom: 5),
                        child: Text(
                          "Sayed Hanafy is an Egyptian company in the field of koshary industry.",
                          style: TextStyle(
                              fontSize: 14,
                              color: ConstColors.primaryBlueColor),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 15, bottom: 20),
                  child: Text(
                    "Micro Bus",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: ConstColors.primaryBlueColor),
                  ),
                ),
                const Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 13, right: 13),
                      child: Image(
                        image: AssetImage("assets/location.png"),
                        height: 60,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(top: 15, right: 15, bottom: 5),
                        child: Text(
                          "Sayed Hanafy is an Egyptian company in the field of koshary industry.",
                          style: TextStyle(
                              fontSize: 14,
                              color: ConstColors.primaryBlueColor),
                        ),
                      ),
                    ),
                  ],
                ),
                const Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 13, right: 13),
                      child: Image(
                        image: AssetImage("assets/location.png"),
                        height: 60,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(top: 15, right: 15, bottom: 5),
                        child: Text(
                          "Sayed Hanafy is an Egyptian company in the field of koshary industry.",
                          style: TextStyle(
                              fontSize: 14,
                              color: ConstColors.primaryBlueColor),
                        ),
                      ),
                    ),
                  ],
                ),
                const Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 13, right: 13),
                      child: Image(
                        image: AssetImage("assets/location.png"),
                        height: 60,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(top: 15, right: 15, bottom: 5),
                        child: Text(
                          "Sayed Hanafy is an Egyptian company in the field of koshary industry.",
                          style: TextStyle(
                              fontSize: 14,
                              color: ConstColors.primaryBlueColor),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
