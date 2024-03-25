class ApiResponse<T> {
  bool status;
  String? message;
  T? data;

  ApiResponse({
    required this.status,
    this.message,
    required this.data,
  });

  factory ApiResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    if (json['data'] is List<dynamic>) {
      if (json['data'].length == 0) {
        return ApiResponse<T>(
          status: json['status'],
          message: json['message'],
          data: null,
        );
      } else {
        return ApiResponse<T>(
            status: json['status'],
            message: json['message'],
            data: json['data']);
      }
    } else {
      return ApiResponse<T>(
          status: json['status'], message: json['message'], data: json['data']);
    }
  }
}
