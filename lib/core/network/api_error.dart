enum ApiErrorType { noConnection, unknown, server }

class ApiError {
  final ApiErrorType type;
  final String message;
  final int? statusCode;
  final dynamic details;

  ApiError({
    this.type = ApiErrorType.unknown,
    this.statusCode,
    required this.message,
    this.details,
  });

  factory ApiError.noConnection() => ApiError(
        type: ApiErrorType.noConnection,
        message: "No internet connection!",
      );

  @override
  String toString() =>
      "Api error type:$type, code:$statusCode, message:$message";
}
