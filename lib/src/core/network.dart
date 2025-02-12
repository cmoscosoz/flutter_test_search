import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'constants.dart';

@module
abstract class NetworkModule {
  @singleton
  Dio get dio => Dio(
        BaseOptions(
          baseUrl: AppConstants.baseUrl,
          connectTimeout: AppConstants.connectTimeout,
          receiveTimeout: AppConstants.receiveTimeout,
        ),
      )..interceptors.add(
          LogInterceptor(
            // responseBody: true,s
            requestBody: true,
          ),
        );
}
