import 'package:financial_wellbeing/core/constant/app_colors.dart';
import 'package:financial_wellbeing/core/constant/app_images.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/components/appbar/inner_app_bar.dart';
import '../../../theme/theme_helper.dart';

class ArticleScreen extends StatelessWidget {
  ArticleScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    // TODO: implement build
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
              SizedBox(
                height: height * 0.02,
              ),
              Center(
                child: SizedBox(
                  width: width * 100,
                  child: Image.asset(
                    "assets/images/financial_education_images/image1.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.06,
              ),
              Text("How to Get Started with Investing",
                  style: theme.textTheme.headlineLarge?.copyWith(
                    fontSize: width * 0.045,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  )),
              SizedBox(
                height: height * 0.03,
              ),
              Text(
                  """Investing is one of the most effective ways to grow your wealth and achieve financial freedom. Whether you're saving for retirement, a large purchase, or just building a safety net, investing strategically can help you reach your financial goals. Here’s a beginner-friendly guide on how to get started.
1. Understand Your Financial Goals
Before you invest, identify your financial objectives. Are you saving for retirement, a down payment, or simply building your savings? Your goals will impact your investment strategy. For example:
Short-term goals (1-3 years): Consider low-risk options like high-yield savings accounts, certificates of deposit (CDs), or short-term bonds.
Medium-term goals (3-10 years): Stocks, mutual funds, and bonds are good for this timeframe as they offer growth potential with manageable risk.
Long-term goals (10+ years): You may benefit from more growth-oriented assets like stocks, real estate, or even a diversified portfolio.
2. Learn the Basics of Asset Classes
A well-rounded investment strategy includes a mix of different asset types:
Stocks: Shares in a company that offer high returns but also carry more risk. Ideal for long-term growth.
Bonds: Loans to companies or governments that pay back with interest. They’re less risky than stocks and can add stability to your portfolio.
Mutual Funds and ETFs: Pooled investments that offer diversification by holding a range of stocks, bonds, or other assets. They’re managed by professionals, making them ideal for beginners.
Real Estate: Investments in property can offer income and appreciation but require significant upfront capital.
Cryptocurrency: Digital assets are highly volatile but can be a small part of a diversified portfolio for those comfortable with risk.""",
                  style: theme.textTheme.headlineLarge?.copyWith(
                    fontSize: width * 0.040,
                    color: AppColor.lightGrey,
                    fontWeight: FontWeight.w400,
                  )),
              SizedBox(
                height: height * 0.02,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
