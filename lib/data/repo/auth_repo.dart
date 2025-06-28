// lib/data/repositories/auth_repository.dart
import 'package:profile_card/data/services/auth_local_service.dart';
import 'package:profile_card/data/services/auth_service.dart';
import 'package:profile_card/models/login_res.dart';
import 'package:profile_card/models/user_model.dart';
import 'package:profile_card/utils/result.dart';

class AuthRepo {
  final AuthService _remote = AuthService();
  final AuthLocalService _local = AuthLocalService();

  Future<Result<LoginRes>> signup(User user) async {
    try {
      final res = await _remote.signup(user);
      return Result.ok(res);
    } catch (e) {
      return Result.error("Signup error: $e");
    }
  }

  Future<Result<LoginRes>> login(String email, String password) async {
    try {
      final res = await _remote.login(email, password);
      return Result.ok(res);
    } catch (e) {
      return Result.error("Login error: $e");
    }
  }

  Future<void> saveToken(String token) => _local.saveToken(token);

  Future<void> logout() => _local.clearToken();

  bool isSuccess(int code) => code >= 200 && code < 300;
}
