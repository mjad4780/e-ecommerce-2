import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

/// Determine the current position of the device.
///
/// When the location services are not enabled or permissions
/// are denied the `Future` will return an error.

class _TestState extends State<Test> {
  late bool serviceEnabled;
  late LocationPermission permission;
  Future<Position> _determinePosition() async {
    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    // if (serviceEnabled == false) {
    //   print('object');
    // }
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }

  hhh() async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(52.2165157, 6.9437819);
    print('rafgdxgx${placemarks[1].country}');
  }

  dfgfg() async {
    bool serviceEnabled1;
    LocationPermission permission1;
    Position position;
    // serviceEnabled1 = await Geolocator.isLocationServiceEnabled();
    // permission1 = await Geolocator.checkPermission();
    position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    print(position.latitude);
    print(position.longitude);
    print(position.timestamp);

    print('object');
    // print(permission1);
  }

  @override
  void initState() {
    _determinePosition();
    // dfgfg();
    super.initState();
    // hhh();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
        ),
        body: const Text('data')
        //  FlutterMap(
        //   options: const MapOptions(
        //     initialZoom: 9.2,
        //   ),
        //   children: [
        //     TileLayer(
        //       urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
        //       userAgentPackageName: 'com.example.app',
        //     ),
        //     const RichAttributionWidget(
        //       attributions: [
        //         // TextSourceAttribution(
        //         //   'OpenStreetMap contributors',
        //         //   onTap: () => launchUrl(
        //         //       Uri.parse('https://openstreetmap.org/copyright')),
        //         // ),
        //       ],
        //     ),
        //   ],
        // ));
        );
  }
}
