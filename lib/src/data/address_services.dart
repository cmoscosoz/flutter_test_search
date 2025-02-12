import 'package:dev_test_2degrees/src/models/address_model.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class AddressServices {
  final Dio _dio;

  AddressServices({required Dio dio}) : _dio = dio;

  static const String _baseUrl = '/addresses/search';

  Future<List<Address>> searchAddress(String query) async {
    try {
      final response = await _dio.get(
        _baseUrl,
        queryParameters: {'address': query},
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['addresses'];
        return data.map((json) => Address.fromJson(json)).toList();
      }
      return [];
    } catch (e) {
      if (e is DioException && e.response?.statusCode == 404) {
        final errorData = e.response?.data;
        throw errorData['title'] ?? 'Location Not Found';
      }
      throw 'Failed to search address $e';
    }
  }
}
