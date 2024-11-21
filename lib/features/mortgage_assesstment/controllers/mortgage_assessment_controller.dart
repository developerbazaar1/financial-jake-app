import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../product/model/product_details_model.dart';
class MortgageAssessmentController extends GetxController {
  static MortgageAssessmentController get instance=> Get.find();
  var assessmentScore = 200.obs;


}