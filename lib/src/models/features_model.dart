class Features {
  final String? technology;
  final String? averageSpeed;

  Features({
    this.technology,
    this.averageSpeed,
  });

  factory Features.fromJson(Map<String, dynamic> json) {
    return Features(
      technology: json['technology'],
      averageSpeed: json['averageSpeed'],
    );
  }
}
