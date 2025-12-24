import 'dart:async';

import 'package:flutter/material.dart';

import '../../../../core/app_manager/assest_manager.dart';
import '../../../../core/app_manager/colos_manager.dart';
import '../../../../core/app_manager/constants_manager.dart';
import '../../../../core/app_manager/routes_manager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? timer;

  startDelay() {
    timer = Timer(const Duration(seconds: ConstantsManager.timerDelay), () {
      Navigator.pushReplacementNamed(context, RoutesManager.onboardingRoute);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startDelay();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColosManager.primaryColor,
      body: Center(child: Image.asset(AssetsManager.splashLogo)),
    );
  }
}
