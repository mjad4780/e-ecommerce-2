import 'package:flutter/material.dart';

class Favorite extends StatelessWidget {
  const Favorite({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Center(child: Text('favorete'))],
      ),
    );
  }
}
