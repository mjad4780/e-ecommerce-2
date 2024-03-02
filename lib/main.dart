import 'package:flutter/material.dart';
import 'package:untitled/core/databases/cache/cache_helper.dart';
import 'package:untitled/core/get_it/get_it.dart';

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
    return MaterialApp(home: Scaffold());
  }
}
