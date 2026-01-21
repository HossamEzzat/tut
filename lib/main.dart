import 'package:flutter/material.dart';
import 'package:tut/app/app.dart';
import 'package:tut/core/di/di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initAppModule();
  runApp(MyApp.instance);
}
