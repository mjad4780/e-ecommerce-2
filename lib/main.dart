import 'package:flutter/material.dart';
import 'package:untitled/core/my core/databases/cache/cache_helper.dart';
import 'package:untitled/core/my core/get_it/get_it.dart';
import 'package:untitled/core/my%20core/Navigator/Navigator.dart';
import 'package:untitled/view/screen/Onboadind.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupServise();
  await getIt<CacheHelper>().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(routerConfig: router);
  }
}

class name extends StatelessWidget {
  const name({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 100,
        width: double.infinity,
        child: Image.asset('assets/images/illustration2.png'));
  }
}
