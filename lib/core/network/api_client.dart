import 'package:dio/dio.dart';

class ApiClient {
  late final Dio dio;

  ApiClient() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://api.focusflow.com',
        connectTimeout: const Duration(seconds: 10),
      ),
    );
  }
}
