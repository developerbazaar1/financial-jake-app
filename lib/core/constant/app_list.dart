
import 'package:financial_wellbeing/core/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../features/navigation menu/model/navigation_menu_model.dart';
import '../../features/product/model/product_details_model.dart';
import 'app_images.dart';
import 'app_svg.dart';

class AppList {

  static List<BottomBarItemModel> bottomBarItems = [
    BottomBarItemModel(
      title: "Home",
      selectedIcon: AppSvg.home,
      unselectedIcon: AppSvg.homeActive,
    ),
    BottomBarItemModel(
      title: "My Products",
      selectedIcon: AppSvg.wallet,
      unselectedIcon: AppSvg.walletActive,
    ),
    BottomBarItemModel(
      title: "Equity",
      selectedIcon: AppSvg.chart,
      unselectedIcon: AppSvg.chartActive,
    ),
    BottomBarItemModel(
      title: "Settings",
      selectedIcon: AppSvg.setting,
      unselectedIcon: AppSvg.settingActive,
    ),

  ];
  static List<dynamic> listdata = <dynamic>[
    {
      "heading": "Potential Saving Opportunity",
      "name": "Mortgage Assessment",
      "details":
      "For personalized AI analysis and better insights, share a few details.  In the meantime, check out these product options.",
      "image": "assets/images/score.png"
    },
    {
      "heading": "Potential Saving Opportunity",
      "name": "Mortgage Assessment",
      "details":
      "For personalized AI analysis and better insights, share a few details.  In the meantime, check out these product options.",
      "image": "assets/images/score.png"
    },
    {
      "heading": "Potential Saving Opportunity",
      "name": "Mortgage Assessment",
      "details":
      "For personalized AI analysis and better insights, share a few details.  In the meantime, check out these product options.",
      "image": "assets/images/score.png"
    },
    {
      "heading": "Potential Saving Opportunity",
      "name": "Mortgage Assessment",
      "details":
      "For personalized AI analysis and better insights, share a few details.  In the meantime, check out these product options.",
      "image": "assets/images/score.png"
    },
    {
      "heading": "Potential Saving Opportunity",
      "name": "Mortgage Assessment",
      "details":
      "For personalized AI analysis and better insights, share a few details.  In the meantime, check out these product options.",
      "image": "assets/images/score.png"
    },
  ];

 static Color getProgressColor(int score) {
    if(score <= 0){
      return AppColor.progressGrey; // 0-200
    }
   else if (score >= 1 && score <= 200) {
      return AppColor.redColor; // 1-200
    } else if (score > 200 && score <= 400) {
      return AppColor.orange; // 200-400
    } else if (score > 400 && score <= 600) {
      return AppColor.yellow; // 400-600
    } else if (score > 600 && score <= 800) {
      return AppColor.lightGreen; // 600-800
    } else if (score > 800 && score <= 1000) {
      return AppColor.green; // 800-1000
    } else {
      return AppColor.redColor; // Default or out-of-range
    }
  }

  static var products = [
    ProductDetailsModal(

      institution: "ABC Bank",
      productName:'Product 1',
      interestRate: "4.25%",
      term: "30 Years",
      savingsOpportunity:
      "Save up to \$10,000 over the life of the loan due to lower interest rates.",
      remainingLoanBalance: "\$200,000",
      openOrClosed: "Open",
      fixedOrVariable: "Fixed",
      amortizationPeriod: "25 Years",
      feesToBreakMortgage: "\$5,000",
    ),
    ProductDetailsModal(
      productName:'Product 2',
      institution: "XYZ Bank",
      interestRate: "8.25%",
      term: "36 Years",
      savingsOpportunity:
      "Save up to \$10,000 over the life of the loan due to lower interest rates.",
      remainingLoanBalance: "\$200,000",
      openOrClosed: "Open",
      fixedOrVariable: "Fixed",
      amortizationPeriod: "25 Years",
      feesToBreakMortgage: "\$5,000",
    ),

  ].obs;

 static final benefits = [
    "Unlock Savings: Save approximately \$3,000 net after switching—\$5,500 in interest savings over 38 months minus \$2,500 in breakage and legal fees.",
    "Variable Rate: Enjoy the flexibility of a variable interest rate, with the potential to save more as rates fluctuate.",
    "Lock into Fixed Rate Anytime: With this variable mortgage, you can lock into a fixed-rate option at any time, without penalty.",
    "No Prepayment Penalties: Make extra payments without incurring penalties, allowing you to pay down your mortgage faster.",
    "Flexible Payment Options: Adjust your payment schedule to fit your financial situation, with the ability to increase payments or make lump-sum contributions.",
  ];

 static List<String> openClosedList = [
   "Open", "Closed"
 ];
 static List<String> fixedVariable = [
   "Fixed", "Variable"
 ];
 static List<String> yesNo = [
   "Yes", "No"
 ];


}
