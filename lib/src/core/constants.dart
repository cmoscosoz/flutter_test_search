class AppConstants {
  /// The base URL for the 2degrees API
  /// base URL: https://api.2degrees.nz/sales/v3/qualification
  static const String baseUrl =
      'https://api.2degrees.nz/sales/v3/qualification';

  /// int addressResulsPagination = 5;
  static const int addressResulsPagination = 5;

  /// bool allowVoiceNoFeatures = false;
  static const bool allowVoiceNoFeatures = false;

  /// List String availableBillFrequencies = ['Monthly'];
  static const List<String> availableBillFrequencies = ['Monthly'];

  /// List String businessGroups = ['Slingshot', '2degrees', 'Orcon'];
  static const List<String> businessGroups = ['Slingshot', '2degrees', 'Orcon'];

  /// int maximumContractLength = 24;
  static const int minimumContractLength = 12;

  /// preferredCoreProductBroadbandCategory = 'UFB1000/500';
  static const String preferredCoreProductBroadbandCategory = 'UFB1000/500';

  /// String saLesChanneL = 'OnlineSignup';
  static const String saLesChanneL = 'OnlineSignup';

  /// Duration connectTimeout = Duration(seconds: 10);
  static const Duration connectTimeout = Duration(seconds: 10);

  /// Duration receiveTimeout = Duration(seconds: 10);
  static const Duration receiveTimeout = Duration(seconds: 10);
}
