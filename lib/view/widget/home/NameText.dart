import 'package:flutter/material.dart';
import 'package:untitled/core/constans/Color.dart';

class NameText extends StatelessWidget {
  const NameText({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 2, bottom: 11),
      child: Text(
        text,
        style: const TextStyle(
            fontSize: 22,
            color: AppColor.primaryColor,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
