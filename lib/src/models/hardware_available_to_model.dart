import 'package:dev_test_2degrees/src/models/contract_pricing_model.dart';

class HardwareAvailableTo {
  final String? coreComponentPlanKey;
  final bool coreComponentPlanKeyRestricted;
  final List<ContractPricing> contractPricing;

  HardwareAvailableTo({
    this.coreComponentPlanKey,
    required this.coreComponentPlanKeyRestricted,
    required this.contractPricing,
  });

  factory HardwareAvailableTo.fromJson(Map<String, dynamic> json) {
    return HardwareAvailableTo(
      coreComponentPlanKey: json['coreComponentPlanKey'],
      coreComponentPlanKeyRestricted:
          json['coreComponentPlanKeyRestricted'] ?? false,
      contractPricing: (json['contractPricing'] as List)
          .map((e) => ContractPricing.fromJson(e))
          .toList(),
    );
  }
}
