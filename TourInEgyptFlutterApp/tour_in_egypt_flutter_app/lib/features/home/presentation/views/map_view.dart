// ignore_for_file: deprecated_member_use


import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:tour_in_egypt_flutter_app/constants.dart';
import 'package:tour_in_egypt_flutter_app/core/widgets/custom_main_app_bar.dart';

class ShowMapView extends StatefulWidget {
  const ShowMapView({Key? key, this.latLng}) : super(key: key);
  static const String routeName = 'MapView';
  // final PostModel postModel;
  final LatLng? latLng;

  @override
  State<ShowMapView> createState() => _ShowMapViewState();
}

class _ShowMapViewState extends State<ShowMapView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: CustomMainAppBar(
          title: 'View Location',
          hasBackgroundColor: true,
          hasBackIcon: true,
        ),
      ),
      body: FlutterMap(
        options: MapOptions(
          keepAlive: true,
          center: widget.latLng,
          zoom: 15,
          maxZoom: 18.0,
          minZoom: 5.0,
          interactiveFlags: InteractiveFlag.all,
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'com.example.app',
          ),
          MarkerLayer(
            markers: [
              Marker(
                width: 80.0,
                height: 80.0,
                point: widget.latLng!,
                child: const Icon(
                  Icons.location_on,
                  color: Colors.red,
                  size: 40.0,
                ),
              ),
            ],
          ),
          CircleLayer(
            circles: [
              CircleMarker(
                point: widget.latLng!,
                radius: 40.0,
                color: ConstColors.primaryGoldColor.withOpacity(0.3),
                borderStrokeWidth: 2.0,
                borderColor: ConstColors.primaryGoldColor,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
