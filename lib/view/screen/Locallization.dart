import 'package:flutter/material.dart';
import 'package:untitled/core/my%20core/resources/color_manager.dart';
import 'package:untitled/view/widget/Language/languagebotom.dart';

class Language extends StatelessWidget {
  const Language({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Choose Language',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(
              height: 6,
            ),
            botom_language(
              language: 'Arabic',
              onPressed: () {},
            ),
            botom_language(
              language: 'English',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
