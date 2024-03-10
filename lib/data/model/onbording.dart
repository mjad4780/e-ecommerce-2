import 'package:untitled/data/datasourse/static/assets.dart';

class onboiding {
  final String path;
  final String title;
  final String des;

  onboiding({required this.path, required this.title, required this.des});
}

List<onboiding> onboidin = [
  onboiding(
      path: Assets.imagesOne,
      title: 'Choose Product ',
      des:
          'We Have a 100k Product , Choose \n Your Product From  Our \n E-commerce Shop'),
  onboiding(
      path: Assets.imagesTwo,
      title: 'Easy And Safe Paymnet',
      des: ' You can pay in cash \n or through payment gateways'),
  onboiding(
      path: Assets.imagesThree,
      title: 'Track Your Order',
      des: ' Track Your Order'),
];
