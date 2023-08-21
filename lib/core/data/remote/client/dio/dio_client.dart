import 'package:dio/dio.dart';
import 'package:portfolio/core/core.dart';
import 'package:portfolio/core/data/remote/client/dio/dio_utils.dart';

final class DioClient implements ApiClient {
  final Dio _dio;
  const DioClient(this._dio);

  @override
  Future<ApiResponse> get(String path, {StringMap? headers, DynamicMap? params}) async {
    final response = DioWrapper.wrap(
      onRequest: () => _dio.get(
        path,
        options: Options(headers: headers),
        queryParameters: params,
      ),
    );
    return response;
  }

  @override
  Future<ApiResponse> post(String path, {StringMap? headers, DynamicMap? params}) async {
    final response = DioWrapper.wrap(
      onRequest: () => _dio.post(
        path,
        options: Options(headers: headers),
        data: params,
      ),
    );
    return response;
  }
}
