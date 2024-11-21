import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../../../core/routes/route_constant.dart';

class ForgetPasswordController extends GetxController {
  TextEditingController emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  RxBool isLoading = false.obs;
  void clickOnSubmit(BuildContext context) async {
    try {
      isLoading.value = true;

      // Check Internet connectivity
      // final isConnected = await NetworkManager.instance.isConnected();
      // if (!isConnected) {
      //   CM.showSnackBar(
      //     context: context,
      //     message: AppText.noInternetMessage,
      //   );
      //   // Remove Loader
      //   isLoading.value = false;
      //   return;
      // }

      // Form Validation
      if (!formKey.currentState!.validate()) {
        // Remove Loader
        isLoading.value = false;
        return;
      }

      // Signin user using Email & Password Authenticaton
      // await AuthRepository.instance.sendPasswordResetEmail(
      //   emailController.text.trim(),
      // );

      // Remove Loader
      isLoading.value = false;

      context.pushReplacementNamed(RouteConstants.resetPassword,
          extra: emailController.text);

      // CM.showSnackBar(
      //   context: context,
      //     message: "Password reset link has been sent to your email address");
      //     Get.toNamed(AppRoutes.forgetPassword, arguments: emailController.text.trim());
    } catch (e, stackTrace) {
      // Remove Loader
      isLoading.value = false;
      // Show some Generic Error to the user
      //   CM.showSnackBar(message: e.toString(), context: context);
      print('${e.toString()} $stackTrace');
    }
  }

  @override
  void dispose() {
    emailController.clear();

    super.dispose();
  }
}
