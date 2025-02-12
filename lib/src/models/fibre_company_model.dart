import 'package:dev_test_2degrees/src/models/fibre_score_card_model.dart';

class FibreCompany {
  final bool fibreAvailable;
  final bool fibreInstalled;
  final bool fibreActive;
  final List<dynamic> onts;
  final FibreScorecard scorecard;

  FibreCompany({
    required this.fibreAvailable,
    required this.fibreInstalled,
    required this.fibreActive,
    required this.onts,
    required this.scorecard,
  });

  factory FibreCompany.fromJson(Map<String, dynamic> json) {
    return FibreCompany(
      fibreAvailable: json['fibreAvailable'] ?? false,
      fibreInstalled: json['fibreInstalled'] ?? false,
      fibreActive: json['fibreActive'] ?? false,
      onts: json['onts'] ?? [],
      scorecard: FibreScorecard.fromJson(json['scorecard']),
    );
  }
}
