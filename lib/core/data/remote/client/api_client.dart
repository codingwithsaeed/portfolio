import '../../../core.dart';

abstract interface class ApiClient {
  Future<ApiResponse> get(String path, {StringMap? headers, DynamicMap? params});
  Future<ApiResponse> post(String path, {StringMap? headers, DynamicMap? params});
}
