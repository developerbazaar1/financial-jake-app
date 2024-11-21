import 'package:get/get.dart';

// Data model for a product
class Product {
  final String name;
  final String renewalDate;
  final String renewalStatus;

  Product({
    required this.name,
    required this.renewalDate,
    required this.renewalStatus,
  });
}

// Controller to manage the list of products
class ProductController extends GetxController {
  // Observable list of products
  final products = <Product>[
    Product(
        name: "Home Mortgage",
        renewalDate: "Apr 2, 2024",
        renewalStatus: "Upcoming"),
    Product(
        name: "Auto Loan",
        renewalDate: "August 15, 2023",
        renewalStatus: "Expired"),
    Product(
        name: "Credit Card",
        renewalDate: "March 5, 2025",
        renewalStatus: "Renewed"),
    Product(
        name: "Equity Assessment",
        renewalDate: "March 5, 2025",
        renewalStatus: "Renewed"),
  ].obs;
}
