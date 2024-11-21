import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
import 'package:go_router/go_router.dart';
import '../../../core/components/appbar/inner_app_bar.dart';
import '../../../core/constant/app_colors.dart';
import '../../../theme/theme_helper.dart';
import '../controllers/notification_setting_controller.dart';

class NotificationSettingScreen extends StatelessWidget {
  NotificationSettingScreen({super.key});

  final controller = Get.put(NotificationSettingController());

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(height * 0.08),
        child: InnerAppBar(
          onTap: () {
            context.go('/home?index=4');
          },
          title: 'Notification',
          arrowColor: AppColor.black,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.025,
          vertical: height * 0.02,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Obx(() => SwitchListTile(
                  trackOutlineColor:
                      WidgetStateProperty.all(Colors.transparent),
                  thumbColor: WidgetStateProperty.all(AppColor.white),
                  inactiveThumbColor: AppColor.white,
                  inactiveTrackColor: AppColor.grey.withOpacity(0.35),
                  activeColor: AppColor.white,
                  activeTrackColor: theme.primaryColor.withOpacity(0.9),
                  title: Text(
                    'Push Notifications',
                    style: theme.textTheme.bodyLarge?.copyWith(
                      fontSize: width * 0.036,
                      fontFamily: 'Roboto',
                    ),
                  ),
                  subtitle: Text(
                    'Stay updated on all the latest service activities and job opportunities.',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontSize: width * 0.036,
                      fontFamily: 'Roboto',
                      color: AppColor.grey,
                    ),
                  ),
                  value: controller.isPushNotificationsEnabled.value,
                  onChanged: controller.togglePushNotifications,
                )),
            Obx(() => SwitchListTile(
                  trackOutlineColor:
                      WidgetStateProperty.all(Colors.transparent),
                  thumbColor: WidgetStateProperty.all(AppColor.white),
                  inactiveThumbColor: AppColor.white,
                  inactiveTrackColor: AppColor.grey.withOpacity(0.35),
                  activeColor: AppColor.white,
                  activeTrackColor: theme.primaryColor.withOpacity(0.9),
                  title: Text(
                    'Active Jobs',
                    style: theme.textTheme.bodyLarge?.copyWith(
                      fontSize: width * 0.036,
                      fontFamily: 'Roboto',
                    ),
                  ),
                  subtitle: Text(
                    'Get real-time alerts of active jobs that are still awaiting service partner acceptance.',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontSize: width * 0.036,
                      fontFamily: 'Roboto',
                      color: AppColor.grey,
                    ),
                  ),
                  value: controller.isActiveJobsEnabled.value,
                  onChanged: controller.toggleActiveJobs,
                )),
            Obx(() => SwitchListTile(
                  trackOutlineColor:
                      WidgetStateProperty.all(Colors.transparent),
                  thumbColor: WidgetStateProperty.all(AppColor.white),
                  inactiveThumbColor: AppColor.white,
                  inactiveTrackColor: AppColor.grey.withOpacity(0.35),
                  activeColor: AppColor.white,
                  activeTrackColor: theme.primaryColor.withOpacity(0.9),
                  title: Text(
                    'Booking Confirmations',
                    style: theme.textTheme.bodyLarge?.copyWith(
                      fontSize: width * 0.036,
                      fontFamily: 'Roboto',
                    ),
                  ),
                  subtitle: Text(
                    'Instantly know when your service requests are confirmed and ready to go.',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontSize: width * 0.036,
                      fontFamily: 'Roboto',
                      color: AppColor.grey,
                    ),
                  ),
                  value: controller.isBookingConfirmationEnabled.value,
                  onChanged: controller.toggleBookingConfirmations,
                )),
          ],
        ),
      ),
    );
  }
}
