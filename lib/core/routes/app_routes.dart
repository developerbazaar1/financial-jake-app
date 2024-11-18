import 'package:financial_wellbeing/core/routes/route_constant.dart';
import 'package:financial_wellbeing/features/reset_password/view/reset_password_screen.dart';
import 'package:financial_wellbeing/features/sign_up/controllers/signup_controller.dart';
import 'package:financial_wellbeing/features/sign_up/views/screen/signup_screen.dart';
import 'package:financial_wellbeing/features/signin/views/screen/signin_screen.dart';
import 'package:financial_wellbeing/features/tracking/views/screens/tracking_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


import '../../features/home_screen/views/home_screen.dart';
import '../../features/navigation menu/view/screen/navigation_menu_screen.dart';
import '../../features/notification_setting/views/notification_setting_screen.dart';
import '../../features/onboarding/views/create_account.dart';
import '../../features/onboarding/views/onboarding_screen.dart';
import '../../features/otp/view/otp_screen.dart';
import '../../features/splashScreen/view/splash_screen.dart';
import '../../features/tracking/views/screens/authenticate_screen.dart';
import '../../features/tracking/views/screens/notification_permission_screen.dart';

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
    GoRoute(
      name: RouteConstants.otp,
      path: AppRoutes.otp,
      builder: (context, state) => OtpScreen(),
    ),
    GoRoute(
      name: RouteConstants.resetPassword,
      path: AppRoutes.resetPassword,
      builder: (context, state) => ResetPasswordScreen(),
    ),
    GoRoute(
      name: RouteConstants.trackingScreen,
      path: AppRoutes.trackingScreen,
      builder: (context, state) => const ActivityTrackingScreen(),
    ),
    GoRoute(
      name: RouteConstants.notificationPermissionScreen,
      path: AppRoutes.notificationPermissionScreen,
      builder: (context, state) => const NotificationPermissionScreen(),
    ),
    GoRoute(
      name: RouteConstants.authenticateScreen,
      path: AppRoutes.authenticateScreen,
      builder: (context, state) => const AuthenticateScreen(),
    ),
    GoRoute(
      name: RouteConstants.homescreen,
      path: AppRoutes.homescreen,
      builder: (context, state) => Homescreen(),
    ),

  ]);
}
