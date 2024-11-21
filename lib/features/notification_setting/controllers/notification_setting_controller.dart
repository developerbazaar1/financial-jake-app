import 'package:get/get.dart';

class NotificationSettingController extends GetxController {
  var isPushNotificationsEnabled = false.obs;
  var isActiveJobsEnabled = false.obs;
  var isBookingConfirmationEnabled = false.obs;

  // Methods to toggle the switches
  void togglePushNotifications(bool value) {
    isPushNotificationsEnabled.value = value;
  }

  void toggleActiveJobs(bool value) {
    isActiveJobsEnabled.value = value;
  }

  void toggleBookingConfirmations(bool value) {
    isBookingConfirmationEnabled.value = value;
  }
}
