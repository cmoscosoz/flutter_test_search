class Charge {
  final double chargeExcludingGst;
  final double chargeIncludingGst;
  final String billFrequency;
  final String unit;

  Charge({
    required this.chargeExcludingGst,
    required this.chargeIncludingGst,
    required this.billFrequency,
    required this.unit,
  });

  factory Charge.fromJson(Map<String, dynamic> json) {
    return Charge(
      chargeExcludingGst: json['chargeExcludingGst'],
      chargeIncludingGst: json['chargeIncludingGst'],
      billFrequency: json['billFrequency'],
      unit: json['unit'],
    );
  }
}
