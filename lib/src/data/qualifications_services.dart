import 'package:dev_test_2degrees/src/core/constants.dart';
import 'package:dev_test_2degrees/src/models/qualification_result_model.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class QualificationsServices {
  final Dio _dio;

  QualificationsServices({required Dio dio}) : _dio = dio;

  static const String _baseUrl = '/qualify';

  Future<QualificationResult> getQualification({
    required String locationId,
    List<String> businessGroup = AppConstants.businessGroups,
    String salesChannel = AppConstants.saLesChanneL,
    String preferredCoreProductBroadbandCategory =
        AppConstants.preferredCoreProductBroadbandCategory,
  }) async {
    try {
      final response = await _dio.get(
        _baseUrl,
        queryParameters: {
          'locationId': locationId,
          'businessGroup': businessGroup,
          'salesChannel': salesChannel,
          'preferredCoreProductBroadbandCategory':
              preferredCoreProductBroadbandCategory,
        },
      );

      if (response.statusCode == 200) {
        return QualificationResult.fromJson(response.data);
      }
      throw 'Failed to get qualification';
    } catch (e) {
      if (e is DioException && e.response?.statusCode == 404) {
        final errorData = e.response?.data;
        throw errorData['title'] ?? 'Qualification Not Found';
      }
      throw 'Failed to get qualification $e';
    }
  }
}
