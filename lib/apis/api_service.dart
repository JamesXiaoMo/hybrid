import 'package:dio/dio.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';

class ApiService {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: 'http://127.0.0.1:5000', // Flask 服务地址
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
      headers: {'Content-Type': 'application/json'},
    ),
  );

  Future<int> login(
    String username,
    String password,
    Map<String, dynamic> userInfo,
  ) async {
    var hashedPassword = md5.convert(utf8.encode(password)).toString();
    try {
      final response = await dio.post(
        '/login',
        data: {"username": username, "password": hashedPassword},
      );
      if (response.statusCode == 200) {
        userInfo["isLogin"] = true;
        userInfo["username"] = username;
        userInfo["password"] = hashedPassword;
        userInfo["ID"] = response.data["userID"];
        return 1;
      } else {
        userInfo["isLogin"] = false;
        return 2;
      }
    } on DioException catch (e) {
      if (e.response != null) {
        print("Login failed: ${e.response?.data}");
      } else {
        print("Bad request: ${e.message}");
      }
      userInfo["isLogin"] = false;
      return 2;
    }
  }

  Future<Map<String, dynamic>> searchSong(String songName) async {
    try {
      final response = await dio.post(
        '/search_song',
        data: {"song_name": songName},
      );
      if (response.statusCode == 200) {
        return Map<String, dynamic>.from(response.data);
      } else {
        print("Search failed: ${response.statusMessage}");
        return {"status": response.statusCode, "result": []};
      }
    } on DioException catch (e) {
      if (e.response != null) {
        print("Search error: ${e.response?.data}");
        return Map<String, dynamic>.from(e.response?.data);
      } else {
        print("Bad request: ${e.message}");
        return {"status": 500, "result": []};
      }
    }
  }

  Future<Map<String, dynamic>> getSong(String songId) async {
    try {
      final response = await dio.post(
        '/get_song',
        data: {"song_id": songId},
      );
      if (response.statusCode == 200) {
        return Map<String, dynamic>.from(response.data);
      } else {
        print("Search failed: ${response.statusMessage}");
        return {"status": response.statusCode, "result": []};
      }
    } on DioException catch (e) {
      if (e.response != null) {
        print("Search error: ${e.response?.data}");
        return Map<String, dynamic>.from(e.response?.data);
      } else {
        print("Bad request: ${e.message}");
        return {"status": 500, "result": []};
      }
    }
  }
}
