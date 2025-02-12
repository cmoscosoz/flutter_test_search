class FibreScorecard {
  final bool supports2Gbps;
  final bool supports4Gbps;
  final bool supports8Gbps;

  FibreScorecard({
    required this.supports2Gbps,
    required this.supports4Gbps,
    required this.supports8Gbps,
  });

  factory FibreScorecard.fromJson(Map<String, dynamic> json) {
    return FibreScorecard(
      supports2Gbps: json['supports2Gbps'] ?? false,
      supports4Gbps: json['supports4Gbps'] ?? false,
      supports8Gbps: json['supports8Gbps'] ?? false,
    );
  }
}
