import 'package:flutter/material.dart';
import 'package:untitled/core/my%20core/resources/color_manager.dart';

class CustomButtomAuth extends StatelessWidget {
  final String text;
  final double? width;
  final double? haigh;
  final void Function()? onPressed;
  const CustomButtomAuth(
      {super.key, required this.text, this.onPressed, this.width, this.haigh});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: MaterialButton(
        height: haigh,
        minWidth: width,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        padding: const EdgeInsets.symmetric(vertical: 13),
        onPressed: onPressed,
        color: ColorManager.primaryColor,
        textColor: Colors.white,
        child: Text(text,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
      ),
    );
  }
}
