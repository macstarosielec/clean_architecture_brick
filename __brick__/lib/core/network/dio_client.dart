import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:{{project_name.snakeCase()}}/core/config/app_config.dart';
import 'package:{{project_name.snakeCase()}}/core/constants/api_constants.dart';

@module
abstract class NetworkModule {
  @lazySingleton
  Dio dio(IAppConfig appConfig) {
    final dio = Dio(
      BaseOptions(
        baseUrl: appConfig.baseUrl,
        connectTimeout: ApiConstants.connectTimeout,
        receiveTimeout: ApiConstants.receiveTimeout,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );
    if (kDebugMode) {
      dio.interceptors.add(
        LogInterceptor(
          requestBody: true,
          responseBody: true,
        ),
      );
    }
    return dio;
  }
}
