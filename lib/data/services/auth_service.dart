// lib/data/services/auth_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:profile_card/data/services/api_config.dart';
import 'package:profile_card/models/user_model.dart';

class AuthService {
  final headers = {'Content-Type': 'application/json'};

  Future<http.Response> login(String email, String password) {
    return http.post(
      Uri.parse(EndPoint.loginApi),
      body: jsonEncode({'email': email, 'password': password}),
      headers: headers,
    );
  }

  Future<http.Response> signup(User user) {
    return http.post(
      Uri.parse(EndPoint.signupApi),
      body: jsonEncode(user.toJson()),
      headers: headers,
    );
  }
}
