import 'package:flutter/material.dart';
import 'package:untitled/core/constans/Color.dart';

class CostemBottomNavigation extends StatelessWidget {
  const CostemBottomNavigation(
      {super.key,
      required this.iconData,
      required this.text,
      required this.onPressed,
      required this.active});
  final Function()? onPressed;
  final IconData iconData;
  final String text;
  final bool? active;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            iconData,
            color: active == true ? AppColor.primaryColor : Colors.black,
          ),
          Text(text)
        ],
      ),
    );
  }
}
