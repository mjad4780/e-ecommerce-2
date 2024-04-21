import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:untitled/controller/cubit_Adress/adress_cubit.dart';
import 'package:untitled/core/constans/Color.dart';
import 'package:untitled/my%20core/Navigator/Navigator.dart';

class AddressAddMaps extends StatelessWidget {
  const AddressAddMaps({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('add new address'),
        ),
        body: BlocConsumer<AdressCubit, AdressState>(
          listener: (context, state) {},
          builder: (context, state) {
            final cubit = BlocProvider.of<AdressCubit>(context);
            return Stack(
              alignment: Alignment.center,
              children: [
                if (cubit.latLng != null)
                  FlutterMap(
                    options: MapOptions(
                      onTap: (tapPosition, point) {
                        cubit.addmarker(point);
                      },
                      initialCenter: cubit.latLng!,
                      initialZoom: 9.2,
                    ),
                    children: [
                      TileLayer(
                        urlTemplate:
                            'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                        userAgentPackageName: 'com.example.app',
                      ),
                      MarkerLayer(markers: cubit.markers)
                    ],
                  ),
                Positioned(
                  bottom: 10,
                  child: Container(
                    child: MaterialButton(
                      minWidth: 200,
                      onPressed: () {
                        pushpushReplacement(context, '/AddressAddDetails');
                      },
                      color: AppColor.primaryColor,
                      textColor: Colors.white,
                      child:
                          const Text("اكمال", style: TextStyle(fontSize: 18)),
                    ),
                  ),
                )
              ],
            );
          },
        ));
  }
}
