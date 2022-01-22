// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Map extends StatelessWidget {
  const Map({Key? key}) : super(key: key);
  static const LatLng _mainLocation =
      LatLng(33.58147339196901, -7.633638045146829);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: const GoogleMap(
            myLocationButtonEnabled: true,
            initialCameraPosition: const CameraPosition(
              target: _mainLocation,
              zoom: 15.0,
            ),
          ),
        ),
        const Positioned(
          top: 40,
          left: 20,
          right: 20,
          child: const locationsearchbox(),
        ),
        Positioned(
          bottom: 25,
          left: 20,
          right: 20,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 70.0),
            child: ElevatedButton(
              
              child: const Text('Submit order'),
              onPressed: () {},
            ),
          ),
        ),
      ],
    )
//old code
        //  Column(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: <Widget>[
        //     Expanded(
        //       child: GoogleMap(
        //         myLocationButtonEnabled: true,
        //         initialCameraPosition: CameraPosition(
        //           target: _mainLocation,
        //           zoom: 15.0,
        //         ),
        //       ),

        //     ),
        //   ],
        // ),
        );
  }
}

class locationsearchbox extends StatelessWidget {
  const locationsearchbox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: 'Entre a location',
          suffixIcon: const Icon(Icons.search),
          contentPadding: const EdgeInsets.only(left: 20, bottom: 5, right: 5),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.white),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
