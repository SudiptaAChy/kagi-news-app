import 'package:dio/dio.dart';
import 'package:kagi_news_app/core/network/api_error.dart';
import 'package:kagi_news_app/core/network/api_response.dart';
import 'package:kagi_news_app/core/network/api_router.dart';

class NetworkService {
  static final instance = NetworkService._internal();

  final Dio _dio;

  NetworkService._internal()
      : _dio = Dio(
          BaseOptions(
            baseUrl: ApiRouter.baseUrl,
            connectTimeout: Duration(seconds: 10),
            receiveTimeout: Duration(seconds: 10),
            sendTimeout: Duration(seconds: 10),
            headers: {
              "Content-Type": "application/json",
            },
          ),
        );

  Future<ApiResponse<T>> request<T>(
    String path, {
    required T Function(dynamic data) parser,
  }) async {
    try {
      final response = await _dio.get(path);
      final statusCode = response.statusCode;

      if (statusCode == 200) {
        return ApiResponse.success(parser(response.data));
      } else if (statusCode != null && statusCode >= 500 && statusCode <= 599) {
        return ApiResponse.failure(ApiError(
            type: ApiErrorType.server,
            statusCode: statusCode,
            message: response.statusMessage ?? "",
            details: response.data));
      } else {
        return ApiResponse.failure(ApiError(
            statusCode: statusCode,
            message: response.statusMessage ?? "",
            details: response.data));
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionError) {
        return ApiResponse.failure(ApiError.noConnection());
      }

      return ApiResponse.failure(ApiError(
          statusCode: e.response?.statusCode,
          message: e.message.toString(),
          details: e.response?.data));
    } catch (e) {
      return ApiResponse.failure(ApiError(message: e.toString()));
    }
  }
}
