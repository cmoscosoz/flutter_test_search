import 'package:dev_test_2degrees/src/models/charge_model.dart';

class ContractPricing {
  final int coreProductMinContractLength;
  final int coreProductMaxContractLength;
  final double chargeExcludingGst;
  final double chargeIncludingGst;
  final List<Charge> rentalCharges;

  ContractPricing({
    required this.coreProductMinContractLength,
    required this.coreProductMaxContractLength,
    required this.chargeExcludingGst,
    required this.chargeIncludingGst,
    required this.rentalCharges,
  });

  factory ContractPricing.fromJson(Map<String, dynamic> json) {
    return ContractPricing(
      coreProductMinContractLength: json['coreProductMinContractLength'] ?? 0,
      coreProductMaxContractLength: json['coreProductMaxContractLength'] ?? 0,
      chargeExcludingGst: json['chargeExcludingGst']?.toDouble() ?? 0.0,
      chargeIncludingGst: json['chargeIncludingGst']?.toDouble() ?? 0.0,
      rentalCharges: (json['rentalCharges'] as List)
          .map((e) => Charge.fromJson(e))
          .toList(),
    );
  }
}
