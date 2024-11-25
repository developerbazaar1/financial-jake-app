import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import '../../../core/routes/route_constant.dart';

class ResetPasswordController extends GetxController {
  RxBool iscurretPasswordIconVisible = false.obs;
  RxBool isPasswordIconVisible = false.obs;
  RxBool isConfirmPasswordIconVisible = false.obs;
  final form_key = GlobalKey<FormState>();
  RxBool isLoading = false.obs;
  final TextEditingController currentPasswordController =
      TextEditingController();
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
    currentPasswordController.text = '';
    passwordController.text = '';
    confirmPasswordController.text = '';
    GoRouter.of(context).pushReplacementNamed(RouteConstants.signinScreen);
    FocusScope.of(context).unfocus();
  }

  @override
  void dispose() {
    form_key.currentContext?.pop();
    currentPasswordController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
    super.dispose();
  }
}
