import 'package:financial_wellbeing/core/routes/route_constant.dart';
import 'package:financial_wellbeing/features/mortgage_form/views/mortgage_form_screen.dart';
import 'package:financial_wellbeing/features/notification_screen/views/notification_screen.dart';
import 'package:financial_wellbeing/features/reset_password/view/reset_password_screen.dart';
import 'package:financial_wellbeing/features/sign_up/views/screen/signup_screen.dart';
import 'package:financial_wellbeing/features/signin/views/screen/signin_screen.dart';
import 'package:financial_wellbeing/features/tracking/views/screens/tracking_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../features/customer_support/views/customer_support.dart';
import '../../features/edit_profile/view/edit_profile_screen.dart';
import '../../features/history/views/history_screen.dart';
import '../../features/home_screen/views/home_screen.dart';
import '../../features/navigation menu/view/screen/navigation_menu_screen.dart';
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
    GoRoute(
      path: '/',
      redirect: (context, state) => '/home_screen',
    ),
    GoRoute(
      path: '/home_screen',
      name: RouteConstants.bottomNavigation,
      pageBuilder: (context, state) {
        // Extract the tab index from query parameters (default to 0 if not present)
        final tabIndex = int.parse(
            state.uri.queryParameters['index'] ?? '0'); // Corrected spelling
        return MaterialPage(
          child: NavigationMenuScreen(initialTabIndex: tabIndex),
        );
      },
    ),
    GoRoute(
      name: RouteConstants.mortgageFormScreen,
      path: AppRoutes.mortgageFormScreen,
      builder: (context, state) => MortgageFormScreen(),
    ),
    GoRoute(
      path: AppRoutes.notificationscreen,
      name: RouteConstants.notificationscreen,
      builder: (context, state) => NotificationScreen(),
    ),
    GoRoute(
      path: AppRoutes.editprofilescreen,
      name: RouteConstants.editprofilescreen,
      builder: (context, state) => EditProfileScreen(),
    ),
    GoRoute(
      path: AppRoutes.historyscreen,
      name: RouteConstants.historyscreen,
      builder: (context, state) => HistoryScreen(),
    ),
    GoRoute(
      path: AppRoutes.customersupport,
      name: RouteConstants.customersupport,
      builder: (context, state) => CustomerSupport(),
    ),
  ]);
}
