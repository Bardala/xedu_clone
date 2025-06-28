// lib/data/services/auth_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:profile_card/data/services/api_config.dart';
import 'package:profile_card/models/login_res.dart';
import 'package:profile_card/models/user_model.dart';

class AuthService {
  final _headers = {'Content-Type': 'application/json'};

  Future<LoginRes> login(String email, String password) async {
    final res = await http.post(
      Uri.parse(EndPoint.loginApi),
      body: jsonEncode({'email': email, 'password': password}),
      headers: _headers,
    );

    final body = jsonDecode(res.body);

    if (res.statusCode == 200) {
      return LoginRes.fromJson(body);
    } else {
      throw Exception(body['error'] ?? 'Login failed');
    }
  }

  Future<LoginRes> signup(User user) async {
    final res = await http.post(
      Uri.parse(EndPoint.signupApi),
      headers: _headers,
      body: jsonEncode(user.toJson()),
    );

    final body = jsonDecode(res.body);

    if (_isSuccess(res.statusCode)) {
      return LoginRes.fromJson(body);
    } else {
      throw Exception(body['error'] ?? 'Signup failed');
    }
  }

  bool _isSuccess(int code) => code >= 200 && code < 300;
}
