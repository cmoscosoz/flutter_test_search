import 'package:dev_test_2degrees/src/models/core_product_model.dart';
import 'package:flutter/foundation.dart';

class CoreService {
  final String? coreServiceKey;
  final List<CoreProduct> coreProducts;

  CoreService({
    required this.coreServiceKey,
    required this.coreProducts,
  });

  factory CoreService.fromJson(Map<String, dynamic> json) {
    try {
      return CoreService(
        coreServiceKey: json['coreServiceKey'],
        coreProducts: (json['coreProducts'] as List)
            .map((e) => CoreProduct.fromJson(e))
            .toList(),
      );
    } catch (e, stackTrace) {
      debugPrint('Error parsing CoreService: $e');
      debugPrint(stackTrace.toString());
      rethrow;
    }
  }
}
