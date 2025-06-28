// lib/data/services/auth_local_service.dart
import 'package:shared_preferences/shared_preferences.dart';

class AuthLocalService {
  Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('authToken', token);
  }

  Future<void> clearToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('authToken');
  }
}
