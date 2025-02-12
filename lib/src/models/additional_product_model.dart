import 'package:dev_test_2degrees/src/models/additional_products_plan_model.dart';

class AdditionalProduct {
  final String additionalProductService;
  final String additionalProductName;
  final bool serviceRestricted;
  final List<String> supportedServices;
  final List<AdditionalProductPlan> additionalProductPlans;

  AdditionalProduct({
    required this.additionalProductService,
    required this.additionalProductName,
    required this.serviceRestricted,
    required this.supportedServices,
    required this.additionalProductPlans,
  });

  factory AdditionalProduct.fromJson(Map<String, dynamic> json) {
    return AdditionalProduct(
      additionalProductService: json['additionalProductService'],
      additionalProductName: json['additionalProductName'],
      serviceRestricted: json['serviceRestricted'],
      supportedServices: List<String>.from(json['supportedServices']),
      additionalProductPlans: (json['additionalProductPlans'] as List)
          .map((e) => AdditionalProductPlan.fromJson(e))
          .toList(),
    );
  }
}
