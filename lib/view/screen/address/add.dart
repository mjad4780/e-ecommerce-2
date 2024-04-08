import 'package:flutter/material.dart';
import 'package:untitled/core/constans/Color.dart';

class AddressAdd extends StatelessWidget {
  const AddressAdd({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('add new address'),
        ),
        body: Container(
            child: Column(children: [
          // if (controllerpage.kGooglePlex != null)
          Expanded(
              child: Stack(
            alignment: Alignment.center,
            children: [
              // GoogleMap(
              //   mapType: MapType.normal,
              //   markers: controllerpage.markers.toSet(),
              //   onTap: (latlong) {
              //     controllerpage.addMarkers(latlong);
              //   },
              //   initialCameraPosition: controllerpage.kGooglePlex!,
              //   onMapCreated: (GoogleMapController controllermap) {
              //     controllerpage.completercontroller!
              //         .complete(controllermap);
              //   },
              // ),
              Positioned(
                bottom: 10,
                child: Container(
                  child: MaterialButton(
                    minWidth: 200,
                    onPressed: () {
                      // controllerpage.goToPageAddDetailsAddress();
                    },
                    color: AppColor.primaryColor,
                    textColor: Colors.white,
                    child: const Text("اكمال", style: TextStyle(fontSize: 18)),
                  ),
                ),
              )
            ],
          ))
        ])));
  }
}
