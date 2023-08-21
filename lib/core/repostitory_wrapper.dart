import 'package:portfolio/core/core.dart';

import 'exceptions.dart';

abstract final class RepositoryWrapper {
  static Future<dynamic> wrap(Future<ApiResponse> Function() onExcute) async {
    final response = await onExcute();
    if (response.isSuccess) {
      return response.body;
    }
    throw AppException(response.body);
  }
}
