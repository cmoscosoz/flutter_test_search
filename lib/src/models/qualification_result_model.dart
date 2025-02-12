// Qualification Result Model
import 'package:dev_test_2degrees/src/models/additional_product_model.dart';
import 'package:dev_test_2degrees/src/models/address_model.dart';
import 'package:dev_test_2degrees/src/models/core_service_model.dart';
import 'package:dev_test_2degrees/src/models/fibre_company_model.dart';
import 'package:dev_test_2degrees/src/models/fibre_summary_model.dart';
import 'package:dev_test_2degrees/src/models/hardware_product_model.dart';
import 'package:dev_test_2degrees/src/models/property_summary_mode.dart';
import 'package:flutter/widgets.dart';

class QualificationResult {
  final String locationId;
  final Address address;
  final PropertySummary propertySummary;
  final List<CoreService> coreServices;
  final List<AdditionalProduct> additionalProducts;
  final List<HardwareProduct> hardwareProducts;
  final FibreSummary fibreSummary;
  final Map<String, FibreCompany>? fibreDetails;

  QualificationResult({
    required this.locationId,
    required this.address,
    required this.propertySummary,
    required this.coreServices,
    required this.additionalProducts,
    required this.hardwareProducts,
    required this.fibreSummary,
    required this.fibreDetails,
  });

  factory QualificationResult.fromJson(Map<String, dynamic> json) {
    try {
      return QualificationResult(
        locationId: json['locationId'],
        address: Address.fromJson(json['address']),
        propertySummary: PropertySummary.fromJson(json['propertySummary']),
        coreServices: (json['coreServices'] as List)
            .map((e) => CoreService.fromJson(e))
            .toList(),
        additionalProducts: (json['additionalProducts'] as List)
            .map((e) => AdditionalProduct.fromJson(e))
            .toList(),
        hardwareProducts: (json['hardwareProducts'] as List)
            .map((e) => HardwareProduct.fromJson(e))
            .toList(),
        fibreSummary: FibreSummary.fromJson(json['fibreSummary']),
        fibreDetails: (json['fibreDetails'] as Map<String, dynamic>?)?.map(
                (key, value) => MapEntry(key, FibreCompany.fromJson(value))) ??
            {},
      );
    } catch (e, stackTrace) {
      debugPrint('Error parsing QualificationResult: $e');
      debugPrint(stackTrace.toString());
      rethrow;
    }
  }
}
