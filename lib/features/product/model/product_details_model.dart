class ProductDetailsModal {
  
  final String productName; 
  final String institution;
  final String interestRate;
  final String term;
  final String savingsOpportunity;
  final String remainingLoanBalance;
  final String openOrClosed;
  final String fixedOrVariable;
  final String amortizationPeriod;
  final String feesToBreakMortgage;

  ProductDetailsModal(  {
    required this.institution,
    required this.interestRate,
    required this.term,
    required this.savingsOpportunity,
    required this.remainingLoanBalance,
    required this.openOrClosed,
    required this.fixedOrVariable,
    required this.amortizationPeriod,
    required this.feesToBreakMortgage,
    required this.productName,
  });
}