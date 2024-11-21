import 'package:flutter/material.dart';
import 'core/routes/app_routes.dart';
import 'theme/theme_helper.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // // FirebaseMessaging messaging = FirebaseMessaging.instance;
  //
  // await GetStorage.init();
  //
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  //   DeviceOrientation.portraitDown,
  // ]);

  // Get.put(LocationController());

  /// -- Initialize Firebase & Autheantication Repository
  // await Firebase.initializeApp(
  //   ///options: DefaultFirebaseOptions.currentPlatform
  // ).then((FirebaseApp value) {
  //   Get.put(AuthRepository());
  // });
  // WidgetsFlutterBinding.ensureInitialized();
  //.then((FirebaseApp value) => Get.put(AuthRepository()));
  //
  // await FirebaseAppCheck.instance.activate(
  //   androidProvider: AndroidProvider.debug,
  //   appleProvider: AppleProvider.appAttest,
  //   webProvider: ReCaptchaV3Provider('recaptcha-v3-site-key'),  );
  // Request permission to receive notifications
  // NotificationSettings settings = await messaging.requestPermission(
  //   alert: true,
  //   announcement: false,
  //   badge: true,
  //   carPlay: false,
  //   criticalAlert: false,
  //   provisional: false,
  //   sound: true,
  // );

  // if (settings.authorizationStatus == AuthorizationStatus.authorized) {
  //   print('User granted permission');
  //
  //   // Get the token
  //   String? token = await messaging.getToken();
  //   print('FCM Token: $token');
  // } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
  //   print('User granted provisional permission');
  // } else {
  //   print('User declined or has not accepted permission');
  // }

  /// -- Initialize Crashlytics
  // Pass all uncaught "fatal" errors from the framework to Crashlytics
  // FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  // FlutterError.onError = (errorDetails) {
  //   FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  // };
  // // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
  // PlatformDispatcher.instance.onError = (error, stack) {
  //   FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
  //   return true;
  // };

//  await Future.delayed(const Duration(milliseconds: 300));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routeInformationParser: AppRouter.router.routeInformationParser,
      routerDelegate: AppRouter.router.routerDelegate,
      routeInformationProvider: AppRouter.router.routeInformationProvider,
      title: 'Financial Wellbeing App',
      theme: theme,
    );
  }
}
