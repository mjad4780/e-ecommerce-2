import 'package:untitled/data/datasourse/static/assets.dart';

class onboiding {
  final String path;
  final String title;
  final String des;

  onboiding({required this.path, required this.title, required this.des});
}

List<onboiding> onboidin = [
  onboiding(
      path: Assets.imagesIllustration,
      title: 'This Font Software is licensed ',
      des:
          ' The goals of the Open Font License (OFL) are to stimulate worldwide/ndevelopment of collaborative font projects, to support the font creation'),
  onboiding(
      path: Assets.imagesIllustration2,
      title: 'SIL Open Font License',
      des:
          ' The goals of the Open Font License (OFL) are to stimulate worldwide/ndevelopment of collaborative font projects, to support the font creation'),
  onboiding(
      path: Assets.imagesIllustration3,
      title: 'licensed fonts to be used',
      des:
          ' The goals of the Open Font License (OFL) are to stimulate worldwide/ndevelopment of collaborative font projects, to support the font creation'),
];
