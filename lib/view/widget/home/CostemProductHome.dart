import 'package:flutter/material.dart';
import 'package:untitled/core/constans/Color.dart';

class CostemProductHome extends StatelessWidget {
  const CostemProductHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        itemCount: 3,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Stack(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 11),
                child: Image.asset(
                  'assets/images/three.PNG',
                  width: 150,
                  height: 100,
                  fit: BoxFit.fill,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: AppColor.black.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(22)),
                width: 160,
                height: 120,
              ),
              const Positioned(
                  top: 9,
                  left: 4,
                  child: Text(
                    'Laptop surface Go 2',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ))
            ],
          );
        },
      ),
    );
  }
}
