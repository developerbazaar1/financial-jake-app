import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constant/app_images.dart';
import '../../../data/repositories/auth_repository.dart';
import '../../../theme/theme_helper.dart';
import '../controller/splash_controller.dart';

class SplashScreen extends GetView<SplashController> {
  final controller = Get.put(SplashController());

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
        padding:  EdgeInsets.only(top: height * 0.15),
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
