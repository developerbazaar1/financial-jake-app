import 'package:get/get.dart';

class FinancialEducationController extends GetxController {
  var selectedTab = 'Articles'.obs;

  void setTab(String tab) {
    selectedTab.value = tab;
  }
}
