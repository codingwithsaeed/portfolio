import 'package:dio/dio.dart';

import '../../../../core.dart';

final dioOptions = BaseOptions(
  baseUrl: Endpoints.baseUrl,
  contentType: 'application/json',
);

abstract final class DioWrapper {
  static Future<ApiResponse> wrap({required Future<Response> Function() onRequest}) async {
    try {
      final response = await onRequest();
      return ApiResponse(statusCode: response.statusCode!, body: response.data);
    } on DioException catch (e) {
      if (e.response != null) {
        return ApiResponse(statusCode: e.response!.statusCode!, body: e.response!.data);
      }
      return ApiResponse(statusCode: 500, body: e.stackTrace);
    }
  }
}
