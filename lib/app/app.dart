import 'package:flutter/material.dart';
import 'package:tut/core/app_manager/routes_manager.dart';

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
      onGenerateRoute: RouteGenerator.getRoute,
      initialRoute: RoutesManager.splashRoute,
      debugShowCheckedModeBanner: false,
      theme: getThemeMode(),
    );
  }
}
