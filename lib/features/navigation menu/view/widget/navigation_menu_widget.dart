import 'package:flutter/material.dart';


import '../../../../core/constant/app_colors.dart';
import '../../../navigation%20menu/view/widget/bottom_nav_bar_item.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;

    return Container(
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05), // Adjust shadow color and opacity as needed
            spreadRadius: 1,
            blurRadius: 1,
            offset: const Offset(0, -1.5), // Position the shadow above the bar
          ),
        ],
      ),
      child: BottomAppBar(
        shape: const AutomaticNotchedShape(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(30),
            ),
          ),
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(100)),
          ),
        ),
        padding: EdgeInsets.only(top: height * 0.02,left: width * 0.01,right: width * 0.01),
        height: height * 0.1,
        notchMargin: 8,
        color: Colors.transparent, // Make the BottomAppBar color transparent to avoid hiding the shadow
        child: Row(
          children: [
            const Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  BottomNavBarItem(index: 0),
                  BottomNavBarItem(index: 1),
                  BottomNavBarItem(index: 2),
                  BottomNavBarItem(index: 3),
                  BottomNavBarItem(index: 4),
                ],
              ),
            ),
            // Space for Search Icon
          ],
        ),
      ),
    );
  }
}
