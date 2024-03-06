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
      title: 'hi',
      des:
          'تأكد من كتابة الكلمات بشكل صحيحجرّب كلمات مختلفةجرّب استخدام كلمات أكثر شيوعًا'),
  onboiding(
      path: Assets.imagesIllustration2,
      title: 'hello',
      des:
          'لم ينجح بحثك عن rror detected in pubspec.yaml: Unexpected child "flutter_assets" found under "flutter ... في إظهار أي نتائج.'),
  onboiding(
      path: Assets.imagesIllustration3,
      title: 'welcome',
      des:
          'لم ينجح بحثك عن rror detected in pubspec.yaml: Unexpected child "flutter_assets" found under "flutter ... في إظهار أي نتائج.')
];
