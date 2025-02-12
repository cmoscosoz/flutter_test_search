import 'package:dev_test_2degrees/src/models/features_model.dart';
import 'package:flutter/foundation.dart';

class MarketingDetails {
  final String title;
  final Features features;

  MarketingDetails({
    required this.title,
    required this.features,
  });

  factory MarketingDetails.fromJson(Map<String, dynamic> json) {
    try {
      return MarketingDetails(
        title: json['title'],
        features: Features.fromJson(json['features']),
      );
    } catch (e, stackTrace) {
      debugPrint('Error parsing MarketingDetails: $e');
      debugPrint(stackTrace.toString());
      rethrow;
    }
  }
}
