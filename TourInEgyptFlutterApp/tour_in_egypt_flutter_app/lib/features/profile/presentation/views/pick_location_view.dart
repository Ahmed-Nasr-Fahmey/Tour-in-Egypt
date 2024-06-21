import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_street_map_search_and_pick/open_street_map_search_and_pick.dart';
import 'package:tour_in_egypt_flutter_app/constants.dart';
import 'package:tour_in_egypt_flutter_app/core/utils/manager/user_cubit.dart';
import 'package:tour_in_egypt_flutter_app/core/widgets/custom_main_app_bar.dart';

class PickLocationView extends StatefulWidget {
  const PickLocationView({Key? key}) : super(key: key);
  static const String routeName = 'PickLocationView';

  @override
  State<PickLocationView> createState() => _PickLocationViewState();
}

class _PickLocationViewState extends State<PickLocationView> {
  String? _address;
  double? _latitude;
  double? _longitude;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: CustomMainAppBar(
          title: 'Pick Location',
          hasBackgroundColor: true,
          hasBackIcon: true,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: OpenStreetMapSearchAndPick(
              locationPinTextStyle: const TextStyle(
                color: ConstColors.primaryBlueColor,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
              locationPinIconColor: ConstColors.primaryGoldColor,
              locationPinText: 'Drag to pick location',
              buttonTextStyle: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              buttonColor: ConstColors.primaryBlueColor,
              buttonText: 'Set Picked Location',
              onPicked: (pickedData) {
                setState(() {
                  _latitude = pickedData.latLong.latitude;
                  _longitude = pickedData.latLong.longitude;
                  _address = pickedData.addressName;
                });

                // Update the UserCubit with the picked data
                BlocProvider.of<UserCubit>(context).postModel.latitude =
                    pickedData.latLong.latitude.toString();
                BlocProvider.of<UserCubit>(context).postModel.longitude =
                    pickedData.latLong.longitude.toString();
                BlocProvider.of<UserCubit>(context).postModel.location =
                    pickedData.addressName;

                // Navigate back or show a success message
                Navigator.pop(context);
              },
            ),
          ),
          if (_address != null)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const Text(
                    'Picked Location:',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    _address!,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[700],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Latitude: $_latitude, Longitude: $_longitude',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[700],
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
