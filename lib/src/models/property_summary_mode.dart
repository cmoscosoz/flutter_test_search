// Property Summary Model
class PropertySummary {
  final int? floorAreaSqm;
  final String? aerialImageUrl;
  final String? boundaryImageUrl;

  PropertySummary({
    this.floorAreaSqm,
    this.aerialImageUrl,
    this.boundaryImageUrl,
  });

  factory PropertySummary.fromJson(Map<String, dynamic> json) {
    return PropertySummary(
      floorAreaSqm: json['floorAreaSqm'],
      aerialImageUrl: json['aerialImageUrl'],
      boundaryImageUrl: json['boundaryImageUrl'],
    );
  }
}
