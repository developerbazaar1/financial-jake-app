import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constant/app_images.dart';
import '../../../theme/theme_helper.dart';
import '../controller/splash_controller.dart';

class SplashScreen extends GetView<SplashController> {
  @override
  final controller = Get.put(SplashController());

  SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final GoRouter router = GoRouter.of(context);

    controller.onReady();
    Future.delayed(const Duration(milliseconds: 3000), () {
      controller.manageSession(router);
    });

    return Scaffold(
      backgroundColor: theme.primaryColor,
      body: Padding(
        padding: EdgeInsets.only(top: height * 0.15),
        child: Align(
          alignment: Alignment.topCenter,
          child: Image.asset(
            AppImage.logo,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
