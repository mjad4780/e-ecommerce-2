import 'package:flutter/material.dart';
import 'package:untitled/core/constans/Color.dart';

class CostemNavigation extends StatelessWidget {
  const CostemNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        height: 40,
        child: MaterialButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
            color: AppColor.secondColor,
            onPressed: () {},
            child: const Text(
              "Go To Cart",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            )));
  }
}
