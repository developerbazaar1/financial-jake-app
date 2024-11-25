import 'package:get/get.dart';

class CustomerSupportController extends GetxController {
  var isExpanded = false.obs; // Observable for expansion state
  var expandedStates = <bool>[].obs;
  void toggleExpanded() {
    isExpanded.value = !isExpanded.value; // Toggle the value
  }
}
