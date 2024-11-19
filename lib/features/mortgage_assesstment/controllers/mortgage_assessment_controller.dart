import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
class MortgageAssessmentController extends GetxController {
  var assessmentScore = 400.obs;

  var products = [
    {
      "name": "Product 1",
      "institution": "ABC Bank",
      "interestRate": "3.25%",
      "term": "30 years",
      "savingsOpportunity":
      "Save up to \$10,000 over the life of the loan due to lower interest rates."
    },
    {
      "name": "Product 2",
      "institution": "XYZ Bank",
      "interestRate": "3.50%",
      "term": "25 years",
      "savingsOpportunity":
      "Save up to \$8,000 over the life of the loan due to better terms."
    },
  ].obs;
}