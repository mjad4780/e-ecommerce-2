import 'package:flutter/material.dart';
import 'package:untitled/my%20core/resources/color_manager.dart';

class botom_language extends StatelessWidget {
  const botom_language({
    super.key,
    required this.language,
    required this.onPressed,
  });
  final String language;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 100),
        child: MaterialButton(
          onPressed: onPressed,
          color: ColorManager.primaryColor,
          child: Text(
            language,
          ),
        ),
      ),
    );
  }
}
