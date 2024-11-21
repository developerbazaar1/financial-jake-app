import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:go_router/go_router.dart';

import '../../../core/routes/route_constant.dart';

class SplashController extends GetxController {
  final deviceStorage = GetStorage();
  // RegistrationController userController = Get.put(RegistrationController());

  @override
  void onInit() {
    super.onInit();
    print("on session");
  }

  @override
  void onReady() {
    // Delay to simulate splash screen delay
    Future.delayed(const Duration(milliseconds: 3000), () {
      // Call manageSession once the splash delay is over
      // manageSession will be called with the router passed in from the widget
    });
    super.onReady();
  }

  // Pass GoRouter to this function instead of using context directly
  Future<void> manageSession(GoRouter router) async {
    await Future.delayed(const Duration(seconds: 2)); // optional delay

    //final user = FirebaseAuth.instance.currentUser;

    // if (user != null) {
    //   FirebaseAuth.instance.authStateChanges().listen((User? user) {
    //     if (user != null && !user.emailVerified) {
    //       AuthRepository.instance.sendEmailVerification();
    //     }
    //   });
    //
    //   if (user.emailVerified) {
    //     await userController.fetchUserData();
    //     bool? status = userController.user.value.status;
    //
    //     if (status == true) {
    //       if (deviceStorage.read("isFirstTime") == false) {
    //         await AppLocalStorage.init(user.uid);
    //       }
    //       router.goNamed(RouteConstants.bottomNavigation);
    //     }
    //   } else {
    //     AuthRepository.instance.sendEmailVerification();
    //     await FirebaseAuth.instance.signOut();
    //  router.pushReplacementNamed(RouteConstants.login);
    //   }
    // } else {
    //   bool isFirstTime = deviceStorage.read("isFirstTime") ?? true;
    //
    //   if (isFirstTime) {
    router.pushReplacementNamed(RouteConstants.onboardingScreen);
    //   } else {
    //     router.pushReplacementNamed(RouteConstants.login);
    //   }

    deviceStorage.writeIfNull("isFirstTime", true);
    //}
  }
}
