import 'package:dev_test_2degrees/src/models/hardware_available_to_model.dart';

class HardwareProduct {
  final String hardwareProductKey;
  final String hardwareProductDescription;
  final String hardwareProductExtendedDescription;
  final String hardwareProductMake;
  final String hardwareProductModel;
  final String hardwareProductType;
  final double rrpExcludingGst;
  final double rrpIncludingGst;
  final double? deliveryChargeOverrideExcludingGst;
  final double? deliveryChargeOverrideIncludingGst;
  final String purchaseType;
  final List<String> supportedCoreProductBroadbandCategories;
  final List<String> supportedCoreProductVoiceCategories;
  final List<HardwareAvailableTo> hardwareAvailableTo;

  HardwareProduct({
    required this.hardwareProductKey,
    required this.hardwareProductDescription,
    required this.hardwareProductExtendedDescription,
    required this.hardwareProductMake,
    required this.hardwareProductModel,
    required this.hardwareProductType,
    required this.rrpExcludingGst,
    required this.rrpIncludingGst,
    this.deliveryChargeOverrideExcludingGst,
    this.deliveryChargeOverrideIncludingGst,
    required this.purchaseType,
    required this.supportedCoreProductBroadbandCategories,
    required this.supportedCoreProductVoiceCategories,
    required this.hardwareAvailableTo,
  });

  factory HardwareProduct.fromJson(Map<String, dynamic> json) {
    return HardwareProduct(
      hardwareProductKey: json['hardwareProductKey'],
      hardwareProductDescription: json['hardwareProductDescription'],
      hardwareProductExtendedDescription:
          json['hardwareProductExtendedDescription'],
      hardwareProductMake: json['hardwareProductMake'],
      hardwareProductModel: json['hardwareProductModel'],
      hardwareProductType: json['hardwareProductType'],
      rrpExcludingGst: json['rrpExcludingGst']?.toDouble() ?? 0.0,
      rrpIncludingGst: json['rrpIncludingGst']?.toDouble() ?? 0.0,
      deliveryChargeOverrideExcludingGst:
          json['deliveryChargeOverrideExcludingGst']?.toDouble(),
      deliveryChargeOverrideIncludingGst:
          json['deliveryChargeOverrideIncludingGst']?.toDouble(),
      purchaseType: json['purchaseType'],
      supportedCoreProductBroadbandCategories: List<String>.from(
          json['supportedCoreProductBroadbandCategories'] ?? []),
      supportedCoreProductVoiceCategories:
          List<String>.from(json['supportedCoreProductVoiceCategories'] ?? []),
      hardwareAvailableTo: (json['hardwareAvailableTo'] as List)
          .map((e) => HardwareAvailableTo.fromJson(e))
          .toList(),
    );
  }
}
