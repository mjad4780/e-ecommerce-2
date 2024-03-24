import 'package:flutter/material.dart';
import 'package:untitled/core/constans/Color.dart';
import 'package:untitled/my%20core/resources/color_manager.dart';
import 'package:untitled/view/widget/home/CostemProductHome.dart';
import 'package:untitled/view/widget/home/Costemcategories.dart';
import 'package:untitled/view/widget/home/DusCount.dart';
import 'package:untitled/view/widget/home/NameText.dart';
import 'package:untitled/view/widget/home/SearchAndNotifications.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: ListView(children: const [
        SearchAndNotifications(),
        DisCount(),
        NameText(text: 'Categories'),
        CostemCategories(),
        NameText(text: 'Product for you'),
        CostemProductHome()
      ]),
    );
  }
}
