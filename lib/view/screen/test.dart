// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:flutter_map/flutter_map.dart';
// import 'package:geocoding/geocoding.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:latlong2/latlong.dart';
// import 'package:url_launcher/url_launcher.dart';

// class Test extends StatefulWidget {
//   const Test({super.key});

//   @override
//   State<Test> createState() => _TestState();
// }

// /// Determine the current position of the device.
// ///
// /// When the location services are not enabled or permissions
// /// are denied the `Future` will return an error.

// class _TestState extends State<Test> {
//   hhh() async {
//     List<Placemark> placemarks =
//         await placemarkFromCoordinates(52.2165157, 6.9437819);
//     print('rafgdxgx${placemarks[1].country}');
//   }

//   dfgfg() async {
//     bool serviceEnabled1;
//     LocationPermission permission1;
//     Position position;
//     // serviceEnabled1 = await Geolocator.isLocationServiceEnabled();
//     // permission1 = await Geolocator.checkPermission();
//     position = await Geolocator.getCurrentPosition(
//         desiredAccuracy: LocationAccuracy.high);
//     print(position.latitude);
//     print(position.longitude);
//     print(position.timestamp);

//     print('object');
//     // print(permission1);
//   }

//   @override
//   void initState() {
//     // dfgfg();
//     super.initState();
//     // hhh();
//   }

// // LatLng initialCenter =  LatLng(50.5, 30.51);
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.red,
//         ),
//         body: FlutterMap(
//           options: const MapOptions(
//             initialCenter: LatLng(51.509364, -0.128928),
//             initialZoom: 9.2,
//           ),
//           children: [
//             TileLayer(
//               tms: true,
//               urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
//               userAgentPackageName: 'com.example.app',
//             ),
//             RichAttributionWidget(
//               attributions: [
//                 TextSourceAttribution(
//                   'OpenStreetMap contributors',
//                   onTap: () => launchUrl(
//                       Uri.parse('https://openstreetmap.org/copyright')),
//                 ),
//               ],
//             ),
//           ],
//         ));
//   }
// }
