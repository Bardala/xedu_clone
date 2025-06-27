import 'dart:convert';

import 'package:profile_card/models/user_model.dart';
import "package:http/http.dart" as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepo {
  static const String _baseUrl = 'http://192.168.1.100:3000';
  static const String _loginEndpoint = '/api/login';

  Future<LoginRes> login(String email, String password) async {
    try {
      final res = await http.post(
        Uri.parse('$_baseUrl$_loginEndpoint'),
        body: jsonEncode({'email': email, 'password': password}),
        headers: {'Content-type': 'application/json'},
      );

      if (res.statusCode == 200) {
        final resData = jsonDecode(res.body) as Map<String, dynamic>;
        return LoginRes.fromJson(resData);
      } else {
        final errorData = jsonDecode(res.body);
        throw Exception(
          errorData['message'] ?? 'Login failed: ${res.statusCode}',
        );
      }
    } on http.ClientException catch (e) {
      throw Exception('Network error: ${e.message}');
    } catch (e) {
      throw Exception('An error occurred: $e');
    }
  }

  Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('authToken', token);
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('authToken');
  }
}
