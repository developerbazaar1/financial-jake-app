import 'package:get/get.dart';

class HomeScreenController extends GetxController {
  var isOpenOrClosed = ''.obs;
  // var assessmentScore = 785.obs;

  var assessmentScore = <Map<String, int>>[
    {"data1": 200},
    {"data1": 300},
    {"data1": 500},
    {"data1": 600},
    {"data1": 0},
  ].obs;

  // @override
  // bool operator ==(Object other) {
  //   // TODO: implement ==
  //   return super == other;
  // }
}

// class OnboardingController extends GetxController {
//   var currentPage = 0.obs;
//   int pages = 3;
//   RxDouble progress = 0.25.obs;
//   var controller;
//   final pageController = PageController(
//     viewportFraction: 1,
//     keepPage: true,
//     initialPage: 0,
//   ).obs;

//   @override
//   void onInit() {
//     controller = PageController(
//       viewportFraction: 0.8,
//     );
//     super.onInit();
//     pageController.value.addListener(() {
//       handlePageChange(pageController.value.page!.round());
//     });
//   }

//   void handlePageChange(int pageIndex) {
//     if (pageIndex == 0) {
//       progress.value = 0.25;
//     } else if (pageIndex == 1) {
//       progress.value = 0.50;
//     } else if (pageIndex == 2) {
//       progress.value = 0.75;
//     } else {
//       progress.value = 1.0;
//     }

//     currentPage.value = pageIndex;
//   }
// }
