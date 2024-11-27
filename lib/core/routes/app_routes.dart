import 'package:financial_wellbeing/core/routes/route_constant.dart';
import 'package:financial_wellbeing/features/equity/views/equity_screen.dart';
import 'package:financial_wellbeing/features/equity_details/views/equity_details_screen.dart';
import 'package:financial_wellbeing/features/financial_education/controllers/financial_education_screen.dart';
import 'package:financial_wellbeing/features/mortgage_assesstment/views/mortgage_assessment_screen.dart';
import 'package:financial_wellbeing/features/mortgage_details/controllers/mortgage_details_controller.dart';
import 'package:financial_wellbeing/features/mortgage_details/views/screen/mortgage_details_screen.dart';
import 'package:financial_wellbeing/features/mortgage_form/views/screen/mortgage_form_screen.dart';
import 'package:financial_wellbeing/features/my_product_details/views/my_product_details_screen.dart';
import 'package:financial_wellbeing/features/notification_screen/controllers/notification_controller.dart';
import 'package:financial_wellbeing/features/notification_screen/views/notification_screen.dart';
import 'package:financial_wellbeing/features/privacypolicy/views/privacypolicy_screen.dart';
import 'package:financial_wellbeing/features/product_details/views/screen/product_details_screen.dart';
import 'package:financial_wellbeing/features/reset_password/view/reset_password_screen.dart';
import 'package:financial_wellbeing/features/sign_up/controllers/signup_controller.dart';
import 'package:financial_wellbeing/features/sign_up/views/screen/signup_screen.dart';
import 'package:financial_wellbeing/features/signin/views/screen/signin_screen.dart';
import 'package:financial_wellbeing/features/terrms&condition/views/terms_condition_screen.dart';
import 'package:financial_wellbeing/features/tracking/views/screens/tracking_screen.dart';
import 'package:financial_wellbeing/features/upload_document/views/upload_document_screen.dart';
import 'package:financial_wellbeing/features/videos/views/videos_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../features/articles/views/articles_screen.dart';
import '../../features/customer_support/views/customer_support.dart';

import '../../features/edit_profile/view/edit_profile_screen.dart';
import '../../features/financial_education/views/financial_education_screen.dart';
import '../../features/history/views/history_screen.dart';
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
      builder: (context, state) => const CreateAccountScreen(),
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
      builder: (context, state) {
        // Extract arguments from `state`

        final bool? value = state.extra as bool?;
        return ResetPasswordScreen(
          isUserLogined: value,
        );
      },
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
      name: RouteConstants.mortgageDetailsScreen,
      path: AppRoutes.mortgageDetailsScreen,
      builder: (context, state) => MortgageDetailsScreen(),
    ),
    GoRoute(
      name: RouteConstants.mortgageAssessmentScreen,
      path: AppRoutes.mortgageAssessmentScreen,
      builder: (context, state) => MortgageAssessmentScreen(),
    ),
    GoRoute(
        name: RouteConstants.productDetailsScreen,
        path: AppRoutes.productDetailsScreen,
        builder: (context, state) {
          // Extract arguments from `state`

          final int? index = state.extra as int?; // Optional extra argument
          return ProductDetailsScreen(
            index: index,
          );
        }),

    GoRoute(
      name: RouteConstants.myProductDetailsScreen,
      path: AppRoutes.myProductDetailsScreen,
      builder: (context, state) => MyProductDetailsScreen(),
    ),

    GoRoute(
      name: RouteConstants.equityDetailsScreen,
      path: AppRoutes.equityDetailsScreen,
      builder: (context, state) => EquityScreen(),
    ),

    //-------------
    GoRoute(
      path: AppRoutes.editProfileScreen,
      name: RouteConstants.editProfileScreen,
      builder: (context, state) => EditProfileScreen(),
    ),
    GoRoute(
      path: AppRoutes.historyScreen,
      name: RouteConstants.historyScreen,
      builder: (context, state) => HistoryScreen(),
    ),
    GoRoute(
      path: AppRoutes.customerSupport,
      name: RouteConstants.customerSupport,
      builder: (context, state) => CustomerSupport(),
    ),

    GoRoute(
      path: AppRoutes.privacyPolicy,
      name: RouteConstants.privacyPolicy,
      builder: (context, state) => PrivacyPolicyScreen(),
    ),
    GoRoute(
      path: AppRoutes.termsCondtition,
      name: RouteConstants.termsCondtition,
      builder: (context, state) => TermsConditionScreen(),
    ),
    GoRoute(
      path: AppRoutes.uploadDocumentScreen,
      name: RouteConstants.uploadDocumentScreen,
      builder: (context, state) => UploadDocumentScreen(),
    ),
    GoRoute(
      path: AppRoutes.financialEducationScreen,
      name: RouteConstants.financialEducationScreen,
      builder: (context, state) => FinancialEducationScreen(),
    ),
    GoRoute(
      path: AppRoutes.articlesScreen,
      name: RouteConstants.articlesScreen,
      builder: (context, state) => ArticleScreen(),
    ),
    GoRoute(
      path: AppRoutes.videosScreen,
      name: RouteConstants.videosScreen,
      builder: (context, state) => VideosScreen(),
    ),
  ]);
}
