class FibreSummary {
  final bool fibreAvailable;
  final bool fibreInstalled;
  final bool fibreActive;
  final bool consentRequired;
  final String consentStatus;
  final bool rightOfWay;
  final String buildingType;
  final String? fibreEta;
  final bool fibreInADay;
  final String? ufbRegion;

  FibreSummary({
    required this.fibreAvailable,
    required this.fibreInstalled,
    required this.fibreActive,
    required this.consentRequired,
    required this.consentStatus,
    required this.rightOfWay,
    required this.buildingType,
    this.fibreEta,
    required this.fibreInADay,
    this.ufbRegion,
  });

  factory FibreSummary.fromJson(Map<String, dynamic> json) {
    return FibreSummary(
      fibreAvailable: json['fibreAvailable'] ?? false,
      fibreInstalled: json['fibreInstalled'] ?? false,
      fibreActive: json['fibreActive'] ?? false,
      consentRequired: json['consentRequired'] ?? false,
      consentStatus: json['consentStatus'],
      rightOfWay: json['rightOfWay'] ?? false,
      buildingType: json['buildingType'],
      fibreEta: json['fibreEta'],
      fibreInADay: json['fibreInADay'] ?? false,
      ufbRegion: json['ufbRegion'],
    );
  }
}
