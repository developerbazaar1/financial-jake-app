import 'package:financial_wellbeing/core/constant/app_images.dart';
import 'package:financial_wellbeing/core/constant/app_svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import '../../../core/common/common_widget.dart';
import '../../../core/components/appbar/inner_app_bar.dart';
import '../../../core/components/image/upload_document.dart';
import '../../../core/components/text/heading_text.dart';
import '../../../core/constant/app_colors.dart';
import '../../../core/constant/app_text.dart';
import '../../../core/routes/route_constant.dart';
import '../../../theme/theme_helper.dart';
import '../controllers/upload_document_controlller.dart';
class UploadDocumentScreen extends StatelessWidget {
  final UploadDocumentController controller =
  Get.put(UploadDocumentController());
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(height * 0.06),
        child: InnerAppBar(
          onTap: () {
            context.go('/home_screen?index=0');
          },
        ),
      ),
      backgroundColor: theme.primaryColor,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: width * 0.055),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: height * 0.02),
              const HeadingText(text: 'Secure Document \nUpload'),
              SizedBox(height: height * 0.02),
              Text(
                'Upload your financial documents securely to help us better assess your financial health. All uploads are encrypted and kept safe in the cloud.',
                style: theme.textTheme.bodySmall?.copyWith(
                  fontSize: width * 0.031,
                ),
              ),
              SizedBox(height: height * 0.02),
              Text(
                'My Documents',
                style: theme.textTheme.titleMedium?.copyWith(
                  fontSize: width * 0.046,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Obx(() => GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 14,
                    childAspectRatio: (1 / .72)),
                itemCount: controller.documents.length,
                padding: EdgeInsets.symmetric(vertical: height * 0.02),
                itemBuilder: (context, index) {
                  final doc = controller.documents[index];
                  return DocumentCard(
                    title: doc['title']!,
                    onTap: () => controller.openDocument(index),
                  );
                },
              )),
              Text(
                'Upload more Documents',
                style: theme.textTheme.titleMedium?.copyWith(
                  fontSize: width * 0.046,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: height * 0.02),
              UploadTextDocument(
                title: 'Loan Agreements',
                docText: 'Upload Loan Agreements',
                onTap: () => controller.pickDocument('Loan Agreements'),
                onClear: () => controller.clearFile('Loan Agreements'),
                filePath: controller.loanAgreementFile,
              ),
              SizedBox(height: height * 0.015),
              UploadTextDocument(
                title: 'Credit Card Statements',
                docText: 'Upload Document Credit Card Statements',
                onTap: () => controller.pickDocument('Credit Card Statements'),
                onClear: () => controller.clearFile('Credit Card Statements'),
                filePath: controller.creditCardStatementFile,
              ),
              SizedBox(height: height * 0.015),
              UploadTextDocument(
                title: 'Receipts',
                docText: 'Upload  Receipts',
                onTap: () => controller.pickDocument('Receipts'),
                onClear: () => controller.clearFile('Receipts'),
                filePath: controller.receiptFile,
              ),
              SizedBox(height: height * 0.02),
              CW.commonElevatedButton(
                height: height * 0.06,
                width: width,
                child: Text(
                  "Save Documents",
                  style: theme.textTheme.bodyLarge?.copyWith(
                      fontSize: width * 0.041,
                      fontWeight: FontWeight.w600,
                      color: theme.primaryColor),
                ),
                onPressed: () {
                  if (controller.loanAgreementFile.isEmpty ||
                      controller.creditCardStatementFile.isEmpty ||
                      controller.receiptFile.isEmpty) {
                    print("no file add");
                  } else {
                    // Proceed with form submission or next steps
                    print(
                        "Loan Agreement File: ${controller.loanAgreementFile.value}");
                    print(
                        "Credit Card Statement File: ${controller.creditCardStatementFile.value}");
                    print("Receipt File: ${controller.receiptFile.value}");
                  }
                },
              ),
              SizedBox(height: height * 0.1),
            ],
          ),
        ),
      ),
    );
  }
}
class UploadTextDocument extends StatelessWidget {
  const UploadTextDocument({
    super.key,
    required this.title,
    required this.docText,
    required this.filePath,
    this.onTap,
    required this.onClear,
  });
  final String title, docText;
  final GestureTapCallback? onTap;
  //---------var to display file path---------
  final RxString filePath;
  final VoidCallback onClear; // To handle file removal
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          title,
          style: theme.textTheme.bodyLarge?.copyWith(
            fontSize: width * 0.041,
            fontWeight: FontWeight.w600,
          ),
        ),
        Obx(() {
          return InkWell(
            onTap: filePath.isEmpty
                ? onTap
                : null, // Disable picking if a file is selected
            child: Container(
              margin: EdgeInsets.symmetric(
                  horizontal: width * 0.03, vertical: height * 0.010),
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColor.gradiantColor1,
                    AppColor.gradiantColor2,
                    AppColor.gradiantColor3,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: AppColor.secondary,
                  borderRadius: BorderRadius.circular(30),
                ),
                height: height * 0.135,
                width: width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // SizedBox(
                    //   height: height * 0.010,
                    // ),
                    if (filePath.isEmpty)
                      SvgPicture.asset(
                        AppSvg.document,
                      ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            filePath.isNotEmpty
                                ? filePath
                                .split('/')
                                .last // Display only the file name
                                : docText,
                            style:
                            Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: AppColor.lightGrey,
                              fontSize: width * 0.035,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        // Show clear icon if a file is selected
                        if (filePath.isNotEmpty)
                          IconButton(
                            icon: const Icon(Icons.cancel, color: Colors.grey),
                            onPressed: onClear,
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ],
    );
  }
}
class UploadButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  const UploadButton({
    Key? key,
    required this.title,
    required this.onPressed,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF1F1F1F),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: const BorderSide(color: Colors.grey),
        ),
        padding: const EdgeInsets.symmetric(vertical: 20),
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.upload_file, color: Colors.white),
          const SizedBox(width: 10),
          Text(
            title,
            style: const TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
class DocumentCard extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  const DocumentCard({required this.title, required this.onTap});
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.03,
        ),
        decoration: BoxDecoration(
            color: AppColor.secondary,
            borderRadius: BorderRadius.circular(32),
            border: Border.all(color: AppColor.borderColor, width: 3)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(AppSvg.document),
            SizedBox(height: height * 0.008),
            Text(
              title,
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyLarge?.copyWith(
                fontSize: width * 0.041,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}