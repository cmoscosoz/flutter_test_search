import 'package:dev_test_2degrees/src/models/charge_model.dart';
import 'package:dev_test_2degrees/src/models/marketing_details_model.dart';
import 'package:flutter/foundation.dart';

class AdditionalProductPlan {
  final String planKey;
  final String planDescription;
  final List<Charge> charges;
  final int? freeSecondsPerCall;
  final int? freeSecondsPerPeriod;
  final List<dynamic> destinations;
  final List<String> wifiRecommendations;
  final int? dataCap;
  final int? minutesLimit;
  final int? textLimit;
  final String? groupTag;
  final bool isGroupLeader;
  final int? maxGroupMemberCount;
  final String? dataCategory;
  final bool isGroupMember;
  final bool isStandalone;
  final int minimumContractTerm;
  final String? planDuration;
  final String? dataCapDescription;
  final String? callingMinsDescription;
  final String? textsDescription;
  final List<String> additionalDescriptions;
  final List<String> supportedPlanKeys;
  final MarketingDetails? marketingDetails;
  final String? companionTag;
  final List<String>? supportedCompanionTags;

  AdditionalProductPlan({
    required this.planKey,
    required this.planDescription,
    required this.charges,
    this.freeSecondsPerCall,
    this.freeSecondsPerPeriod,
    required this.destinations,
    required this.wifiRecommendations,
    this.dataCap,
    this.minutesLimit,
    this.textLimit,
    this.groupTag,
    required this.isGroupLeader,
    this.maxGroupMemberCount,
    this.dataCategory,
    required this.isGroupMember,
    required this.isStandalone,
    required this.minimumContractTerm,
    this.planDuration,
    this.dataCapDescription,
    this.callingMinsDescription,
    this.textsDescription,
    required this.additionalDescriptions,
    required this.supportedPlanKeys,
    this.marketingDetails,
    this.companionTag,
    this.supportedCompanionTags,
  });

  factory AdditionalProductPlan.fromJson(Map<String, dynamic> json) {
    try {
      return AdditionalProductPlan(
        planKey: json['planKey'],
        planDescription: json['planDescription'],
        charges:
            (json['charges'] as List).map((e) => Charge.fromJson(e)).toList(),
        freeSecondsPerCall: json['freeSecondsPerCall'],
        freeSecondsPerPeriod: json['freeSecondsPerPeriod'],
        destinations: List<dynamic>.from(json['destinations'] ?? []),
        wifiRecommendations:
            List<String>.from(json['wifiRecommendations'] ?? []),
        dataCap: json['dataCap'],
        minutesLimit: json['minutesLimit'],
        textLimit: json['textLimit'],
        groupTag: json['groupTag'],
        isGroupLeader: json['isGroupLeader'] ?? false,
        maxGroupMemberCount: json['maxGroupMemberCount'],
        dataCategory: json['dataCategory'],
        isGroupMember: json['isGroupMember'] ?? false,
        isStandalone: json['isStandalone'] ?? false,
        minimumContractTerm: json['minimumContractTerm'] ?? 0,
        planDuration: json['planDuration'],
        dataCapDescription: json['dataCapDescription'],
        callingMinsDescription: json['callingMinsDescription'],
        textsDescription: json['textsDescription'],
        additionalDescriptions:
            List<String>.from(json['additionalDescriptions'] ?? []),
        supportedPlanKeys: List<String>.from(json['supportedPlanKeys'] ?? []),
        marketingDetails: json['marketingDetails'] != null
            ? MarketingDetails.fromJson(json['marketingDetails'])
            : null,
        companionTag: json['companionTag'],
        supportedCompanionTags: json['supportedCompanionTags'] != null
            ? List<String>.from(json['supportedCompanionTags'])
            : null,
      );
    } catch (e, stackTrace) {
      debugPrint('Error parsing AdditionalProductPlan: $json');
      debugPrint('Error parsing AdditionalProductPlan: $e');
      debugPrint(stackTrace.toString());
      rethrow;
    }
  }
}
