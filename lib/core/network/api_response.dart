import 'package:kagi_news_app/core/network/api_error.dart';

class ApiResponse<T> {
  final ApiError? error;
  final T? data;

  ApiResponse.success(this.data) : error = null;
  ApiResponse.failure(this.error) : data = null;
}
