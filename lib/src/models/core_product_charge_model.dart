class CoreProductCharge {
  final String chargeType;
  final String billingDescription;
  final double chargeExcludingGst;
  final double chargeIncludingGst;
  final int minContractLength;
  final int maxContractLength;

  CoreProductCharge({
    required this.chargeType,
    required this.billingDescription,
    required this.chargeExcludingGst,
    required this.chargeIncludingGst,
    required this.minContractLength,
    required this.maxContractLength,
  });

  factory CoreProductCharge.fromJson(Map<String, dynamic> json) {
    return CoreProductCharge(
      chargeType: json['chargeType'],
      billingDescription: json['billingDescription'],
      chargeExcludingGst: json['chargeExcludingGst'],
      chargeIncludingGst: json['chargeIncludingGst'],
      minContractLength: json['minContractLength'],
      maxContractLength: json['maxContractLength'],
    );
  }
}
