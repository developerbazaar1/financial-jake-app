import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
class MortgageFormController extends GetxController {
  var mortgageName = ''.obs;
  var mortgageInstitution = ''.obs;
  var remainingBalance = ''.obs;
  var isOpenOrClosed = ''.obs;
  var isFixedVariable = ''.obs;
  var isInsuranceRequired = ''.obs;
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
  // Reactive variables for dropdowns
  var selectedMonth = ''.obs;
  var selectedYear = ''.obs;
  // Predefined lists of months and years
  static const List<String> monthList = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];
  static const List<String> yearList = [
    '2000',
    '2001',
    '2002',
    '2003',
    '2004',
    '2005',
    '2006',
    '2007',
    '2008',
    '2009',
    '2010',
    '2011',
    '2012',
    '2013',
    '2014',
    '2015',
    '2016',
    '2017',
    '2018',
    '2019',
    '2020',
    '2021',
    '2022',
    '2023',
    '2024'
  ];
  var uploadDoc = ''.obs;
  //--------------- func for pick doc for specifc sec --------------
  Future<void> pickDocument(String section) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc', 'docx'],
    );
    if (result != null && result.files.single.path != null) {
      String selectedFile = result.files.single.path!;
      if (section == 'Upload Documents') {
        uploadDoc.value = selectedFile;
      }
      print("sucess , doc upload");
    } else {
      Get.snackbar("Error", "No document selected");
    }
  }
  void clearFile(String section) {
    if (section == 'Upload Documents') {
      uploadDoc.value = '';
    }
    print("clear");
  }
}