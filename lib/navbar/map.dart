import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Mapg extends StatelessWidget {
  const Mapg({Key? key}) : super(key: key);
  static const LatLng _mainLocation =
      LatLng(33.58147339196901, -7.633638045146829);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: GoogleMap(
              initialCameraPosition: CameraPosition(
                target: _mainLocation,
                zoom: 15.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
