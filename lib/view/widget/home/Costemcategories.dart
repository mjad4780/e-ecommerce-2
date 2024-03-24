import 'package:flutter/material.dart';
import 'package:untitled/core/constans/Color.dart';

class CostemCategories extends StatelessWidget {
  const CostemCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: ListView.builder(
        itemCount: 5,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: AppColor.thirdColor,
                      borderRadius: BorderRadius.circular(20)),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  height: 70,
                  width: 70,
                  child: Image.asset(
                    "assets/images/logoapp.png",
                  ),
                ),
                const Text(
                  "laptop",
                  style: TextStyle(fontSize: 13, color: AppColor.black),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
