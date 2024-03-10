import 'package:flutter/material.dart';
import 'package:untitled/data/datasourse/static/assets.dart';

class LogoAuth extends StatelessWidget {
  const LogoAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
        radius: 70,
        backgroundColor: Colors.red,
        child: Padding(
          padding: const EdgeInsets.all(0), // Border radius
          child: ClipOval(
            child: Image.asset(
              Assets.imagesLogo,
            ),
          ),
        ));
  }
}
