import 'package:dio/dio.dart';

class ApiService {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: 'http://127.0.0.1:5000', // Flask 服务地址
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
      headers: {'Content-Type': 'application/json'},
    ),
  );

  Future<int> login(String username, String password) async {
    try {
      final response = await dio.post(
        '/login',
        data: {"username": username, "password": password},
      );
      return response.statusCode == 200 ? 1 : 2;
    } on DioException catch (e) {
      if (e.response != null) {
        print("Login failed: ${e.response?.data}");
      } else {
        print("Bad request: ${e.message}");
      }
      return 2;
    }
  }
}
