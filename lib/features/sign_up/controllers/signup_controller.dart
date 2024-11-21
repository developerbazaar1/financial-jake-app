import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:go_router/go_router.dart';

import '../../../core/routes/route_constant.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();
  RxBool isPasswordVisible = false.obs;
  RxBool isPasswordIconVisible = false.obs;
  RxBool isLoading = false.obs;
  final form_Key = GlobalKey<FormState>();
  //final userRepository = Get.put(UserRepository());
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lasttNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController dobController = TextEditingController();

  void clickOnSignUp(BuildContext context) async {
    try {
      // Start Loading
      isLoading.value = true;

      // Check Internet connectivity
      // final isConnected = await NetworkManager.instance.isConnected();
      // if (!isConnected) {
      //   //SnackBar(content: Text(AppText.noInternetMessage),);
      //
      //  // Remove Loader
      //   isLoading.value = false;
      //   return;
      // }

      // Form Validation

      if (!form_Key.currentState!.validate()) {
        // Remove Loader
        context.pushReplacementNamed(RouteConstants.signupScreen);
        // SnackBar(content: Text(AppText.noInternetMessage),);
        //   showSnackBar(context, "Accept Privacy Policy & Terms of Use", isError: true);
        isLoading.value = false;
        return;
      }

      // // Privacy Policy Check
      // if (!isChecked.value) {
      //   // Remove Loader
      //   showSnackBar(context, "Accept Privacy Policy & Terms of Use", isError: true);
      //
      //   isLoading.value = false;
      //   // CM.showSnackBar(message: "Accept Privacy Policy & Terms of Use");
      //   return;
      // }

      // Register user in the Firebase Authentication & Save user data in the Firebase
      // final userCredential =
      // await AuthRepository.instance.registerWithEmailAndPassword(
      //
      //   emailController.text.trim(),
      //   passwordController.text.trim(),
      // );
      //
      // User? user = userCredential.user;
      // // // Create User Model
      // final newUser = UserModal(
      //   status: true,
      //   userData: UserData(
      //     userId: userCredential.user!.uid.toString(),
      //     name: userNameController.text.trim(),
      //     email: emailController.text.trim(),
      //     phone: 0,
      //     userImage: '',
      //     address: '',
      //     createdAt: DateTime.now(),
      //
      //
      //   ),
      //
      //   deviceToken: <String>[],
      //
      // );
      //
      //
      //
      // // Log User Model
      // // newUser.toString().log("User Model -> onSignup");
      //
      // // Save Authenticated user data in the Firebase Firestore
      // await userRepository.saveUserRecord(newUser);
      //
      // await _db.collection("Users").doc(newUser.userData.userId).set(
      //     newUser.toJson());
      // print(5);
      // notificationService.storeDeviceToken(userCredential.user!.uid.toString());

      //  AuthRepository.instance.screenRedirect();

      // await sendEmailVerification(userCredential.user!);
      //
      // context.pushNamed(RouteConstants.emailVerificationScreen,
      //     extra:emailController.text );
      //
      //
      // Get.toNamed(AppRoutes.emailVerification, arguments: {
      //   'email': emailController.text.trim(),
      // });
      // if (user != null) {
      //   //await sendOtp();
      //   // await sendEmailVerification(user);
      //   // Get.toNamed(AppRoutes.emailVerification, arguments: {
      //   //   'email': emailController.text.trim(),
      //   // });
      // }

      // Remove Loader
      isLoading.value = false;

      // Show Success Message
      SnackBar(
        content: Text('Please verify your email address.'),
      );

      // Move to Verify Email Screen
      // Get.to(() => VerifyEmailScreen(email: emailController.text.trim()));
    } catch (e, stacktrace) {
      // Remove Loaders
      isLoading.value = false;
      // Show some Generic Error to the user'
      //CM.showSnackBar(message: e.toString());
      print(e.toString());
      print("Stacktrace: $stacktrace");
      SnackBar(
        content: Text(e.toString()),
      );
      //  showSnackBar(context, e.toString(), isError: true);

      throw Exception(e.toString());
    }
  }
}
