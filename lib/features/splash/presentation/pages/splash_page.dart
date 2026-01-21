import 'package:flutter/material.dart';
import 'package:tut/core/app_manager/assets_manager.dart';
import 'package:tut/core/app_manager/colors_manager.dart';
import 'package:tut/core/app_manager/routes_manager.dart';
import 'package:tut/core/di/di.dart';
import 'package:tut/features/splash/presentation/manager/splash_viewmodel.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final SplashViewModel _viewModel = instance<SplashViewModel>();

  void _goNext() {
    Navigator.pushReplacementNamed(context, RoutesManager.onboardingRoute);
  }

  @override
  void initState() {
    super.initState();
    _viewModel.startDelay(_goNext);
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.primaryColor,
      body: Center(child: Image.asset(AssetsManager.splashLogo)),
    );
  }
}
