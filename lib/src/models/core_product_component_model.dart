import 'package:dev_test_2degrees/src/models/component_plan_model.dart';
import 'package:flutter/foundation.dart';

class CoreProductComponent {
  final String coreProductComponentService;
  final List<ComponentPlan> coreProductComponentPlans;

  CoreProductComponent({
    required this.coreProductComponentService,
    required this.coreProductComponentPlans,
  });

  factory CoreProductComponent.fromJson(Map<String, dynamic> json) {
    try {
      return CoreProductComponent(
        coreProductComponentService: json['coreProductComponentService'],
        coreProductComponentPlans: (json['coreProductComponentPlans'] as List)
            .map((e) => ComponentPlan.fromJson(e))
            .toList(),
      );
    } catch (e, stackTrace) {
      debugPrint('Error parsing CoreProductComponent: $e');
      debugPrint(stackTrace.toString());
      rethrow;
    }
  }
}
