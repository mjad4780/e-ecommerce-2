import 'package:flutter/material.dart';
import 'package:untitled/core/constans/Color.dart';
import 'package:untitled/core/function/ListColor.dart';

class SubitemsList extends StatelessWidget {
  const SubitemsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ...List.generate(
          subitems.length,
          (index) => GestureDetector(
            onTap: () {},
            child: Container(
              margin: const EdgeInsets.only(right: 10),
              alignment: Alignment.center,
              padding: const EdgeInsets.only(bottom: 5),
              height: 60,
              width: 90,
              decoration: BoxDecoration(
                  color: subitems[index]['active'] == "1"
                      ? AppColor.primaryColor
                      : Colors.white,
                  border: Border.all(color: AppColor.primaryColor),
                  borderRadius: BorderRadius.circular(10)),
              child: Text(subitems[index]['name'],
                  style: TextStyle(
                      color: subitems[index]['active'] == "1"
                          ? Colors.white
                          : AppColor.primaryColor,
                      fontWeight: FontWeight.bold)),
            ),
          ),
        )
      ],
    );
  }
}
