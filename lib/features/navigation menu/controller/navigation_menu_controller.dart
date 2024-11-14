import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';


class NavigationMenuController extends GetxController {
  static NavigationMenuController get instance => Get.find();

  final int? preferredIndex;
  NavigationMenuController({this.preferredIndex});

  // Variables
  Rx<int> selectedIndex = 0.obs;
  late PageController pageController;

  void updateTabIndex(int index) {
    selectedIndex.value = index;
    Future.microtask(() {
      pageController.jumpToPage(index);
    });
  //  pageController.jumpToPage(index); // Ensure the page view also updates
  }

  @override
  void onInit() {
    super.onInit();
    selectedIndex.value = preferredIndex ?? 0;
    pageController = PageController(initialPage: selectedIndex.value);

  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }

  // Update the current page when tapped
  void onItemTapped(int index) {
    selectedIndex.value = index;
    pageController.jumpToPage(index);
  }

  // On Page Changed
  void onPageChanged(int index) {
    selectedIndex.value = index;
  }

  // Screens
  List<Widget> pages = [
    // HomeScreen(),
    // AdvertiseScreen(),
    // BookingScreen(),
    // ActiveJobsScreen(),
    // ProfileScreen()
  ];
}
