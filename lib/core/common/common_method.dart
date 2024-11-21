import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import '../constant/app_colors.dart';

class CM {
  static TextTheme textTheme = const TextTheme();
  //? -- Usefull Do not Remove
  ///  flutter pub add internet_connection_checker -- For Check Internet
  // static Future<bool> internetConnectionCheckerMethod() async {
  //   bool result = await InternetConnectionChecker().hasConnection;
  //   return result;
  // }

  /// FOR UNFOCS KEYBOARD
  static void unFocsKeyBoard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  /// FOR GET DEVICE TYPE
  static String getDeviceType() {
    if (Platform.isAndroid) {
      return "Android";
    } else if (Platform.isIOS) {
      return "IOS";
    } else {
      return "";
    }
  }

  ///FOR SHOW SNACKBAR required flutter pub add responsive_sizer
  static void showSnackBar(
      {required BuildContext context,
      required String message,
      Duration? duration}) {
    var snackBar = SnackBar(
      elevation: .4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      content: Text(
        message,
        style: textTheme.bodyMedium!
            .copyWith(color: AppColor.white, fontWeight: FontWeight.bold),
      ),
      backgroundColor: AppColor.darkGrey,
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      behavior: SnackBarBehavior.floating,
      duration: duration ?? const Duration(seconds: 2),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  ///flutter pub add shared_preferences --For Local DataBase
  // static Future<String?> getString({required String key}) async {
  //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //   return sharedPreferences.getString(key);
  // }

  ///flutter pub add shared_preferences --For Local DataBase
  // static Future<bool> setString(
  //     {required String key, required String value}) async {
  //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //   return sharedPreferences.setString(key, value);
  // }

  ///flutter pub add intl --FOR DateFormat
  static String dateTimeToAgo(String dateTime) {
    DateTime input = DateTime.parse(dateTime);
    Duration diff = DateTime.now().difference(input);

    if (diff.inDays >= 1) {
      return diff.inDays < 7
          ? '${diff.inDays} day${diff.inDays == 1 ? '' : 's'} ago'
          : DateFormat('MMM d').format(input);
    } else if (diff.inHours >= 1) {
      return '${diff.inHours} hour${diff.inHours == 1 ? '' : 's'} ago';
    } else if (diff.inMinutes >= 1) {
      return '${diff.inMinutes} minute${diff.inMinutes == 1 ? '' : 's'} ago';
    } else if (diff.inSeconds >= 1) {
      return '${diff.inSeconds} second${diff.inSeconds == 1 ? '' : 's'} ago';
    } else {
      return 'just now';
    }
  }

  /// convert string into list
  static List<String> ConvertList(String inputString) {
    // Remove the square brackets
    String trimmedString = inputString.substring(1, inputString.length - 1);

    // Split the string by comma
    List<String> stringList =
        trimmedString.split(',').map((e) => e.trim()).toList();

    // Print the resulting list
    return stringList;
  }

  // static void noInternet() {
  //   showToast(
  //     "Please check your internet connection!",
  //   );
  // }

  // static void error() {
  //   showToast(
  //     "Something went wrong!",
  //   );
  // }

  ///For Get Device Size Expect Tool Bar Or Bottom
  // static double getDeviceSize() {
  //   double availableHeight = MediaQuery.of(Get.context!).size.height -
  //       MediaQuery.of(Get.context!).padding.top -
  //       MediaQuery.of(Get.context!).padding.bottom;
  //   return availableHeight;
  // }

  //? -- Usefull Do not Remove
  // static Future<String?> getDeviceId() async {
  //   var deviceInfo = DeviceInfoPlugin();
  //   if (Platform.isIOS) {
  //     var iosDeviceInfo = await deviceInfo.iosInfo;
  //     return iosDeviceInfo.identifierForVendor; // UNIQUE ID ON iOS
  //   } else if (Platform.isAndroid) {
  //     var androidDeviceInfo = await deviceInfo.androidInfo;
  //     return androidDeviceInfo.id; // UNIQUE ID ON ANDROID
  //   }
  //   return null;
  // }

  ///For Get App Bar Size
  static double getAppBarSize() {
    return AppBar().preferredSize.height;
  }

  ///For Get Tool Bar Size
  // static double getToolBarSize() {
  //   return MediaQuery.of(Get.context!).padding.top;
  // }

  ///For Get Six Digit Random Number
  static String getRandomNumber() {
    var random = Random();
    int min = 100000;
    int max = 999999;
    var number = min + random.nextInt(max - min);
    return number.toString();
  }

  ///For Check Post Api Response
  static bool responseCheckForPostMethod({http.Response? response}) {
    jsonDecode(response?.body ?? "");
    //******************* if (response != null && response.statusCode == StatusCodeConstant.OK) {
    //   CM.showToast(responseMap[ApiKey.message]);
    //   return true;
    // } else {
    //   CM.showToast(responseMap[ApiKey.message]);
    //   return false;
    // }
    return true;
  }

  static Future<void> setScreenPortraitMode() async {
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
  }

  ///For Insert Api Data Into UserLocal
  // static Map<String, dynamic> insertDataInModel({UserData? userData}) {
  //   UserLocalData userLocalData = UserLocalData();
  //   userLocalData.columnId = userData?.user?.id.toString() ?? "";
  //   userLocalData.columnName = userData?.user?.name.toString() ?? "";
  //   userLocalData.columnMembershipPlan = userData?.user?.membershipPlan.toString() ?? "";
  //   userLocalData.columnMembershipDate= userData?.user?.membershipDate.toString() ?? "";
  //   userLocalData.columnMembershipExpireDate= userData?.user?.membership_expire_date.toString() ?? "";
  //   userLocalData.columnEmail = userData?.user?.email.toString() ?? "";
  //   userLocalData.columnMobile = userData?.user?.mobile.toString() ?? "";
  //   userLocalData.columnUserImage = userData?.user?.userImage.toString() ?? "";
  //   userLocalData.columnEmailVerifyAt =
  //       userData?.user?.emailVerifiedAt.toString() ?? "";
  //   userLocalData.columnUserRole = userData?.user?.userRole.toString() ?? "";
  //   userLocalData.columnStatus = userData?.user?.status.toString() ?? "";
  //   userLocalData.columnUserId = userData?.user?.userId.toString() ?? "";
  //   userLocalData.columnMembershipPlan =
  //       userData?.user?.membershipPlan.toString() ?? "";
  //   userLocalData.columnMembershipDate =
  //       userData?.user?.membershipDate.toString() ?? "";
  //   userLocalData.columnMembershipExpireDate=
  //       userData?.user?.membership_expire_date.toString() ?? "";
  //   userLocalData.columnIp = userData?.user?.ip.toString() ?? "";
  //   userLocalData.columnDeviceType =
  //       userData?.user?.deviceType.toString() ?? "";
  //   userLocalData.columnCreatedAt = userData?.user?.createdAt.toString() ?? "";
  //   userLocalData.columnUpdatedAt = userData?.user?.updatedAt.toString() ?? "";
  //   userLocalData.columnToken = userData?.token.toString().toString() ?? "";
  //   userLocalData.columnMyCollection =
  //       userData?.bookcount?.myCollection.toString() ?? "";
  //   userLocalData.columnCompleteBook =
  //       userData?.bookcount?.completedbook.toString() ?? "";
  //   userLocalData.columnOnGoing = userData?.bookcount?.ongoing.toString() ?? "";
  //   userLocalData.columnNotificationOnOff =
  //       userData?.user?.notificationOnOff.toString() ?? "";
  //   userLocalData.columnAppUpdateOnOff =
  //       userData?.user?.appUpdateOnOff.toString() ?? "";
  //
  //   userLocalData.columnMode = userData?.user?.mode.toString() ?? "";
  //   userLocalData.columnCountryCode =
  //       userData?.user?.countryCode.toString() ?? "";
  //   return userLocalData.toMap();
  // }

  ///For Insert Data In DataBase
  // static Future<bool> insertDataIntoDataBase({UserData? userData}) async {
  //   DatabaseHelper.db = await DatabaseHelper.databaseHelperInstance.openDB();
  //   if (await DatabaseHelper.databaseHelperInstance
  //       .isDatabaseHaveData(db: DatabaseHelper.db)) {
  //     bool isInsert = await DatabaseHelper.databaseHelperInstance.insert(
  //       db: DatabaseHelper.db,
  //       data: CM.insertDataInModel(userData: userData),
  //     );
  //     return isInsert;
  //   } else {
  //     await DatabaseHelper.databaseHelperInstance.update(
  //         db: DatabaseHelper.db,
  //         data: CM.insertDataInModel(userData: userData));
  //     return true;
  //   }
  // }
  //
  // ///For Get Image Url
  // static String getImageUrl({required String value}) {
  //   return "${UriConstant.baseUrl}public/$value";
  // }

  ///FOR Remove html tag from text
  static String parseHtmlString(String htmlString) {
    RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);
    String value = htmlString.replaceAll(exp, '');
    value = value.replaceAll("&nbsp;", "");
    value = value.replaceAll("&rdquo;", "");
    value = value.replaceAll("&ldquo;", "");
    value = value.replaceAll("&lsquo;", "");
    return value.replaceAll("&rsquo;", "");
  }

  ///For Check Response
/* static Future<bool> checkResponse({
    required http.Response response,
  }) async {
    Map<String, dynamic> responseMap = jsonDecode(response.body);
    if (await CM.internetConnectionCheckerMethod()) {
      if (response.statusCode == StatusCodeConstant.OK) {
        CM.showSnackBar(
            message: responseMap[],
            );
        return true;
      } else if (response.statusCode == StatusCodeConstant.BAD_REQUEST) {
        CM.showSnackBar(
            message: responseMap[ApiKeyConstant.message],
            );
        return false;
      } else if (response.statusCode == StatusCodeConstant.BAD_GATEWAY) {
        CM.showSnackBar(
            message: "Server Down", );
        return false;
      } else if (response.statusCode == StatusCodeConstant.REQUEST_TIMEOUT) {
        CM.showSnackBar(
            message: "Server Down", );
        return false;
      } else {
        CM.showSnackBar(
            message: "Server Down", );
        return false;
      }
    } else {
      CM.showSnackBar(
          message: "Check Your Internet Connection",
          duration: const Duration(seconds: 4));
      return false;
    }
  }*/

/*  flutter pub add device_info_plus  --FOR GET DEVICE ID


    flutter pub add flutter_windowmanager --ONlY FOR ANDROID SECURE FROM SCREEN SHOTS
  static secureFromScreenShot() async {
    await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
  }*/
}

/* For Scroll Behaviour*/
class ListScrollBehaviour extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}

class MySeparator extends StatelessWidget {
  const MySeparator({super.key, this.height = 1, this.color = Colors.black});
  final double height;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxWidth = constraints.constrainWidth();
        const dashWidth = 5.0;
        final dashHeight = height;
        final dashCount = (boxWidth / (2 * dashWidth)).floor();
        return Flex(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.horizontal,
          children: List.generate(dashCount, (_) {
            return SizedBox(
              width: dashWidth,
              height: dashHeight,
              child: DecoratedBox(
                decoration: BoxDecoration(color: color),
              ),
            );
          }),
        );
      },
    );
  }
}
