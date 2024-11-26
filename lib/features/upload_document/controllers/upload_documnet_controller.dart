import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class UploadDocumentController extends GetxController {
  // Example reactive list to hold uploaded documents

  //--------------- this is variable --------------

  var loanAgreementFile = ''.obs;
  var creditCardStatementFile = ''.obs;
  var receiptFile = ''.obs;

  //--------------- func for pick doc for specifc sec --------------

  Future<void> pickDocument(String section) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc', 'docx'],
    );
    if (result != null && result.files.single.path != null) {
      String selectedFile = result.files.single.path!;
      if (section == 'Loan Agreements') {
        loanAgreementFile.value = selectedFile;
      } else if (section == 'Credit Card Statements') {
        creditCardStatementFile.value = selectedFile;
      } else if (section == 'Receipts') {
        receiptFile.value = selectedFile;
      }
    } else {
      Get.snackbar("Error", "No document selected");
    }

    print("sucess , doc upload");
    // } else {
    //   // Get.snackbar("Error", "No document selected");
    //   print("Error No document selected");
    // }

    // Function to clear selected file for a section
  }

  void clearFile(String section) {
    if (section == 'Loan Agreements') {
      loanAgreementFile.value = '';
    } else if (section == 'Credit Card Statements') {
      creditCardStatementFile.value = '';
    } else if (section == 'Receipts') {
      receiptFile.value = '';
    }
    print("clear");
  }

  var documents = [
    {'title': 'Loan Agreements'},
    {'title': 'Credit Card Details'},
    {'title': 'Loan Agreements'},
    {'title': 'Credit Card Details'},
  ].obs;

  void addDocument() {
    documents.add({'title': 'New Document ${documents.length + 1}'});
  }

  void openDocument(int index) {
    Get.snackbar(
      'Document Opened',
      'You opened ${documents[index]['title']}',
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
