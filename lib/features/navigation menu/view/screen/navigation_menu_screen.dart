import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/navigation_menu_controller.dart';
import '../widget/navigation_menu_widget.dart';

class NavigationMenuScreen extends StatelessWidget {
  const NavigationMenuScreen({super.key, this.initialTabIndex});
  final int? initialTabIndex;

  @override
  Widget build(BuildContext context) {
    final controller =
        Get.put(NavigationMenuController(preferredIndex: initialTabIndex));
    controller
        .updateTabIndex(initialTabIndex ?? 0); // Update the tab index on start
    return Scaffold(
      // -- Page View
      body: PageView(
        physics: const NeverScrollableScrollPhysics(), // Disable swiping
        controller: controller.pageController,
        onPageChanged: controller.onPageChanged,
        children: controller.pages,
      ),
      // -- Navigation Menu
      bottomNavigationBar: const NavigationMenu(),
    );
  }
}
