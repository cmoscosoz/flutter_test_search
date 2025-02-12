import 'package:dev_test_2degrees/src/models/broadband_average_speed_model.dart';
import 'package:dev_test_2degrees/src/models/core_product_charge_model.dart';
import 'package:dev_test_2degrees/src/models/core_product_component_model.dart';
import 'package:flutter/foundation.dart';

class CoreProduct {
  final String coreProductKey;
  final String coreProductDescription;
  final String coreProductBroadbandCategory;
  final String? coreProductBroadbandSupplyProvider;
  final String? coreProductBroadbandCategoryGroup;
  final String? coreProductBroadbandProductType;
  final BroadbandAverageSpeeds? coreProductBroadbandAverageSpeeds;
  final String coreProductVoiceCategory;
  final List<CoreProductCharge> coreProductCharges;
  final List<CoreProductComponent> coreProductComponents;

  CoreProduct({
    required this.coreProductKey,
    required this.coreProductDescription,
    required this.coreProductBroadbandCategory,
    this.coreProductBroadbandSupplyProvider,
    this.coreProductBroadbandCategoryGroup,
    this.coreProductBroadbandProductType,
    this.coreProductBroadbandAverageSpeeds,
    required this.coreProductVoiceCategory,
    this.coreProductCharges = const [],
    required this.coreProductComponents,
  });

  factory CoreProduct.fromJson(Map<String, dynamic> json) {
    try {
      return CoreProduct(
        coreProductKey: json['coreProductKey'],
        coreProductDescription: json['coreProductDescription'],
        coreProductBroadbandCategory: json['coreProductBroadbandCategory'],
        coreProductBroadbandSupplyProvider:
            json['coreProductBroadbandSupplyProvider'],
        coreProductBroadbandCategoryGroup:
            json['coreProductBroadbandCategoryGroup'],
        coreProductBroadbandProductType:
            json['coreProductBroadbandProductType'],
        coreProductBroadbandAverageSpeeds:
            json['coreProductBroadbandAverageSpeeds'] != null
                ? BroadbandAverageSpeeds.fromJson(
                    json['coreProductBroadbandAverageSpeeds'])
                : null,
        coreProductVoiceCategory: json['coreProductVoiceCategory'],
        coreProductCharges: (json['coreProductCharges'] as List)
            .map((e) => CoreProductCharge.fromJson(e))
            .toList(),
        coreProductComponents: (json['coreProductComponents'] as List)
            .map((e) => CoreProductComponent.fromJson(e))
            .toList(),
      );
    } catch (e, stackTrace) {
      debugPrint('Error parsing CoreProduct: $e');
      debugPrint(stackTrace.toString());
      rethrow;
    }
  }

  // Helper method to check if this is a Fibre 1000 product
  bool isFibre1000() {
    return coreProductBroadbandCategory == 'UFB1000/500';
  }
}
