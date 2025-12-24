import 'package:flutter/material.dart';

import '../../../../core/app_manager/assest_manager.dart';
import '../../../../core/app_manager/colos_manager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColosManager.primaryColor,
      body: Center(child: Image.asset(AssetsManager.splashLogo)),
    );
  }
}
