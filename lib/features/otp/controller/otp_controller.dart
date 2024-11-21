// otp_controller.dart
import 'package:financial_wellbeing/core/routes/route_constant.dart';
import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OtpController extends GetxController {
  var agr = Get.arguments;
  // final FirebaseAuth _auth = FirebaseAuth.instance;
  var phoneNumber = ''.obs;
  // var otpCode = ''.obs;
  var verificationId = ''.obs;
  var isLoading = false.obs;
  // final userRepository = Get.put(UserRepository());

  final int otpLength = 6; // Variable for OTP length
  var otpCode =
      List.generate(6, (index) => '').obs; // Initialize with the length of OTP
  var currentFocusIndex = 0.obs;

  void updateOtpCode(int index, String value) {
    if (value.length == 1) {
      otpCode[index] = value;
      currentFocusIndex.value = index + 1;
    } else if (value.isEmpty) {
      otpCode[index] = '';
      currentFocusIndex.value = index - 1;
    }
    otpCode.refresh();
  }

  String get concatenatedOtpCode => otpCode.join();

  final List<TextEditingController> controllers =
      List.generate(6, (index) => TextEditingController());

  void handleChange(String value, int index, BuildContext context) {
    if (value.length == 1 && index < otpLength - 1) {
      FocusScope.of(context).nextFocus();
    } else if (value.isEmpty && index > 0) {
      FocusScope.of(context).previousFocus();
    }

    updateOtpCode(index, value);
  }

  Future<void> verifyOtp(BuildContext context) async {
    isLoading(true);
    String result = otpCode.value.join('');
    print(result);
    try {
      // final credential = PhoneAuthProvider.credential(
      //   verificationId: verificationId.value,
      //   smsCode: result,
      // );
      context.pushReplacementNamed(RouteConstants.resetPassword);
      FocusScope.of(context).unfocus();

      // if (credential != null) {
      //  // await _auth.signInWithCredential(credential);
      //  //  CM.showSnackBar(
      //  //    message: 'new phone number updated successfully',
      //  //  );
      //
      //   Map<String, dynamic> profileDetails = {
      //     'user.mobile': phoneNumber.value,
      //   };
      //   await userRepository.updateSingleField(profileDetails);
      //   // Get.toNamed(AppRoutes.emailVerification, arguments: {
      //   //   'email': agr['email'],
      //   // });
      //   Get.offAllNamed(AppRoutes.navigationMenu);
      //
      // }
    } catch (e) {
      Get.snackbar('Error', 'Failed to sign in \n $e');
      print(e);
    }
    isLoading(false);
  }

  Future<void> resendOtp() async {
    print(1);
    try {
      print(2);
      isLoading(true);
      // await _auth.verifyPhoneNumber(
      //   phoneNumber: '+91${phoneNumber.value}',
      //   verificationCompleted: (PhoneAuthCredential credential) async {
      //     await _auth.signInWithCredential(credential);
      //     print(3);
      //   },
      //   verificationFailed: (FirebaseAuthException e) {
      //     Get.snackbar('Error', e.message ?? 'Verification failed');
      //     print(e.message);
      //     print(4);
      //     throw (e);
      //   },
      codeSent:
      (String verificationId, int? resendToken) {
        // Get.toNamed(AppRoutes.otp, arguments: {
        //   'phone': phoneController.text.trim(),
        //   'verificationId':verificationId
        // });
        // onCodeSent(verificationId);
        //   Get.snackbar('OTP Sent', 'OTP has been sent to your phone');
        //   print(5);
        // },
        // timeout: const Duration(seconds: 60),
        // codeAutoRetrievalTimeout: (String verificationId) {
        //    this.verificationId.value = verificationId;
        //    },
        //
        // );
        //   print(6);
        // isLoading(false);
      };
    } catch (e) {
      print(7);
      rethrow;
    }
  }
}
