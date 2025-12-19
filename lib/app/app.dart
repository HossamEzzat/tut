import 'package:flutter/material.dart';

import '../core/app_manager/theme_manager.dart';

class MyApp extends StatefulWidget {
  const MyApp._internal();

  static final MyApp instance = MyApp._internal();

  factory MyApp() => instance;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: getThemeMode(),
    );
  }
}
