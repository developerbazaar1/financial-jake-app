import '../../features/navigation menu/model/navigation_menu_model.dart';
import 'app_images.dart';
import 'app_svg.dart';

class AppList {
  static List<BottomBarItemModel> bottomBarItems = [
    BottomBarItemModel(
      title: "Home",
      selectedIcon: AppSvg.home,
      unselectedIcon: AppSvg.homeActive,
    ),
    BottomBarItemModel(
      title: "My Products",
      selectedIcon: AppSvg.wallet,
      unselectedIcon: AppSvg.walletActive,
    ),
    BottomBarItemModel(
      title: "Equity",
      selectedIcon: AppSvg.chart,
      unselectedIcon: AppSvg.chartActive,
    ),
    BottomBarItemModel(
      title: "Settings",
      selectedIcon: AppSvg.setting,
      unselectedIcon: AppSvg.settingActive,
    ),
  ];
}
