import 'package:dev_test_2degrees/src/models/charge_model.dart';
import 'package:dev_test_2degrees/src/models/marketing_details_model.dart';

class ComponentPlan {
  final String planKey;
  final String? planCategory;
  final String planDescription;
  final List<Charge> charges;
  final dynamic dataCap;
  final bool? dataBanking;
  final bool? dataRollover;
  final int minimumContractTerm;
  final String? segment;
  final String? defaultIpHandling;
  final String? backhaulRealm;
  final bool hasUnlimitedData;
  final dynamic dataMbLimit;
  final bool hasUnlimitedMinutes;
  final dynamic minutesLimit;
  final bool hasUnlimitedText;
  final dynamic textLimit;
  final MarketingDetails? marketingDetails;

  ComponentPlan({
    required this.planKey,
    this.planCategory,
    required this.planDescription,
    required this.charges,
    this.dataCap,
    this.dataBanking,
    this.dataRollover,
    required this.minimumContractTerm,
    this.segment,
    this.defaultIpHandling,
    this.backhaulRealm,
    required this.hasUnlimitedData,
    this.dataMbLimit,
    required this.hasUnlimitedMinutes,
    this.minutesLimit,
    required this.hasUnlimitedText,
    this.textLimit,
    this.marketingDetails,
  });

  factory ComponentPlan.fromJson(Map<String, dynamic> json) {
    return ComponentPlan(
      planKey: json['planKey'],
      planCategory: json['planCategory'],
      planDescription: json['planDescription'],
      charges:
          (json['charges'] as List).map((e) => Charge.fromJson(e)).toList(),
      dataCap: json['dataCap'],
      dataBanking: json['dataBanking'],
      dataRollover: json['dataRollover'],
      minimumContractTerm: json['minimumContractTerm'],
      segment: json['segment'],
      defaultIpHandling: json['defaultIpHandling'],
      backhaulRealm: json['backhaulRealm'],
      hasUnlimitedData: json['hasUnlimitedData'],
      dataMbLimit: json['dataMbLimit'],
      hasUnlimitedMinutes: json['hasUnlimitedMinutes'],
      minutesLimit: json['minutesLimit'],
      hasUnlimitedText: json['hasUnlimitedText'],
      textLimit: json['textLimit'],
      marketingDetails: json['marketingDetails'] != null
          ? MarketingDetails.fromJson(json['marketingDetails'])
          : null,
    );
  }
}
