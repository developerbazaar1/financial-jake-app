import 'package:financial_wellbeing/core/routes/route_constant.dart';
import 'package:financial_wellbeing/features/sign_up/controllers/signup_controller.dart';
import 'package:financial_wellbeing/features/sign_up/views/screen/signup_screen.dart';
import 'package:financial_wellbeing/features/signin/views/signin_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


import '../../features/navigation menu/view/screen/navigation_menu_screen.dart';
import '../../features/notification_setting/views/notification_setting_screen.dart';
import '../../features/onboarding/views/create_account.dart';
import '../../features/onboarding/views/onboarding_screen.dart';
import '../../features/splashScreen/view/splash_screen.dart';

class AppRouter {
  static GoRouter router = GoRouter(routes: [
    GoRoute(
      name: RouteConstants.initialRoute,
      path: AppRoutes.initialRoute,
      builder: (context, state) => SplashScreen(),
    ),
    GoRoute(
      name: RouteConstants.onboardingScreen,
      path: AppRoutes.onboardingScreen,
      builder: (context, state) => OnboardingScreen(),
    ),
    GoRoute(
      name: RouteConstants.createAccount,
      path: AppRoutes.createAccount,
      builder: (context, state) => CreateAccountScreen(),
    ),
    GoRoute(
      name: RouteConstants.signupScreen,
      path: AppRoutes.signupScreen,
      builder: (context, state) => SignUpScreen(),
    ),
    GoRoute(
      name: RouteConstants.signinScreen,
      path: AppRoutes.signinScreen,
      builder: (context, state) => SignInScreen(),
    ),

  ]);
}
