import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../../../core/routes/route_constant.dart';
import '../../forget_password/controller/forget_password_controller.dart';

class ResetPasswordController extends GetxController {
  RxBool isPasswordIconVisible = false.obs;

  RxBool isConfirmPasswordIconVisible = false.obs;
  final form_key = GlobalKey<FormState>();
  RxBool isLoading = false.obs;
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void clickOnResetPassword(BuildContext context) {
    isLoading.value = true;
    if (!form_key.currentState!.validate()) {
      // Remove Loader

      // SnackBar(content: Text(AppText.noInternetMessage),);
      //   showSnackBar(context, "Accept Privacy Policy & Terms of Use", isError: true);
      isLoading.value = false;
      return;
    }
    isLoading.value = false;
    passwordController.text = '';
    confirmPasswordController.text = '';
    GoRouter.of(context).pushReplacementNamed(RouteConstants.signinScreen);
    FocusScope.of(context).unfocus();
  }
  @override
  void dispose() {
 form_key.currentContext?.pop();
 passwordController.clear();
 confirmPasswordController.clear();
    super.dispose();
  }
}
