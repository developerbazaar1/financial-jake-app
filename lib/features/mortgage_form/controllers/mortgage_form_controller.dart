import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class MortgageFormController extends GetxController {
  var mortgageName = ''.obs;
  var mortgageInstitution = ''.obs;
  var remainingBalance = ''.obs;
  var isOpenOrClosed = ''.obs;
  var isCurrentlyEmployed = ''.obs;
  var creditScore = ''.obs;
  var annualIncome = ''.obs;
  var homeValue = ''.obs;
  var isEstimateEnabled = false.obs;
  var isConsentGiven = false.obs;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController institutionNameController =
      TextEditingController();
  final TextEditingController remainingBalanceController =
      TextEditingController();
  final TextEditingController Controller = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
}
