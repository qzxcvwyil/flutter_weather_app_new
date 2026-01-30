import 'package:dio/dio.dart';

class ApiException implements Exception {
  final String url;
  final String message;
  final int? statusCode;
  final Response? response;

  ApiException({
    required this.url,
    required this.message,
    this.response,
    this.statusCode,
  });

  /// IMPORTANT NOTE
  /// here you can take advantage of toString() method to display the error for user
  /// lets make an example
  /// so in onError method when you make api you can just use apiExceptionInstance.toString() to get the error message from api
  @override
  String toString() {
    if (response != null) {
      try {
        final data = response!.data;
        if (data is Map<String, dynamic> && data['error'] != null) {
          return data['error'].toString();
        }
        // иногда API может вернуть список или строку напрямую
        return data.toString();
      } catch (_) {}
    }
    return message;
  }
}
