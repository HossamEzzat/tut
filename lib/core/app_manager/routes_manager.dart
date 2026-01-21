import 'package:flutter/material.dart';
import 'package:tut/core/di/di.dart';

import '../../features/forget_password/presentation/pages/forget_password_screen.dart';
import '../../features/login/presentation/pages/login_screen.dart';
import '../../features/main/presentation/pages/main_screen.dart';
import '../../features/onboarding/presentation/pages/onboarding_screen.dart';
import '../../features/register/presentation/pages/register_screen.dart';
import '../../features/splash/presentation/pages/splash_page.dart';
import '../../features/store_details/presentation/pages/store_details_screen.dart';

class RoutesManager {
  static const String splashRoute = '/';
  static const String loginRoute = '/login';
  static const String registerRoute = '/register';
  static const String forgetPasswordRoute = '/forgetPassword';
  static const String mainRoute = '/mainRoute';
  static const String storeDetailsRoute = '/storeDetails';
  static const String onboardingRoute = '/onboarding';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesManager.splashRoute:
        initSplashModule();
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case RoutesManager.onboardingRoute:
        initOnboardingModule();
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());
      case RoutesManager.loginRoute:
        initLoginModule();
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case RoutesManager.registerRoute:
        initRegisterModule();
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      case RoutesManager.forgetPasswordRoute:
        initForgotPasswordModule();
        return MaterialPageRoute(builder: (_) => const ForgetPasswordScreen());
      case RoutesManager.mainRoute:
        initMainModule();
        return MaterialPageRoute(builder: (_) => const MainScreen());
      case RoutesManager.storeDetailsRoute:
        initStoreDetailsModule();
        return MaterialPageRoute(builder: (_) => const StoreDetailsScreen());
      default:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
    }
  }
}
