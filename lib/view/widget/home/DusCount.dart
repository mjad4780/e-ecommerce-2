import 'package:flutter/material.dart';
import 'package:untitled/my%20core/resources/color_manager.dart';

class DisCount extends StatelessWidget {
  const DisCount({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      child: Stack(children: [
        Container(
          alignment: Alignment.center,
          height: 150,
          decoration: BoxDecoration(
              color: ColorManager.primaryColor,
              borderRadius: BorderRadius.circular(20)),
          child: const ListTile(
            title: Text("A summer surprise",
                style: TextStyle(color: Colors.white, fontSize: 20)),
            subtitle: Text("Cashback 20%",
                style: TextStyle(color: Colors.white, fontSize: 30)),
          ),
        ),
        Positioned(
          top: -20,
          right: -20,
          child: Container(
            height: 160,
            width: 160,
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 184, 69, 60),
                borderRadius: BorderRadius.circular(160)),
          ),
        )
      ]),
    );
  }
}
