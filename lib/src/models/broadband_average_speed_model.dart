class BroadbandAverageSpeeds {
  final int averageSpeedDownMbps;
  final int averageSpeedUpMbps;
  final String averageSpeedSource;

  BroadbandAverageSpeeds({
    required this.averageSpeedDownMbps,
    required this.averageSpeedUpMbps,
    required this.averageSpeedSource,
  });

  factory BroadbandAverageSpeeds.fromJson(Map<String, dynamic> json) {
    return BroadbandAverageSpeeds(
      averageSpeedDownMbps: json['averageSpeedDownMbps'],
      averageSpeedUpMbps: json['averageSpeedUpMbps'],
      averageSpeedSource: json['averageSpeedSource'],
    );
  }
}
