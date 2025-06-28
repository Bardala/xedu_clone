import 'package:flutter/material.dart';

import 'package:profile_card/data/repo/auth_repo.dart';
import 'package:profile_card/models/login_res.dart';
import 'package:profile_card/models/user_model.dart';
import 'package:profile_card/utils/result.dart'; // Your Result<T> type

class AuthViewModel with ChangeNotifier {
  final AuthRepo _authRepo = AuthRepo();

  bool _isLoading = false;
  String? _errorMessage;
  User? _user;

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  User? get currentUser => _user;

  Future<bool> login(String email, String password) async {
    _setLoading(true);

    final result = await _authRepo.login(email, password);

    // Exhausted switch
    /* 
    1.Works with Sealed Types
    Used with sealed classes or enums where all subtypes are known at compile time.
    Ensures no case is missed.

    2.Compiler Checks
    If a case is missing, Dart throws a compile-time error (unlike if-else).

    3.No default Needed
    Since all cases are covered, default is unnecessary (unless handling non-exhaustive types).
     */
    return switch (result) {
      Success<LoginRes> success => _handleSuccess(success.data),
      Failure<LoginRes> failure => _handleError(failure.errorMsg),
    };
  }

  Future<bool> signup(User user) async {
    _setLoading(true);

    final res = await _authRepo.signup(user);

    return switch (res) {
      Success<LoginRes> success => _handleSuccess(success.data),
      Failure<LoginRes> failure => _handleError(failure.errorMsg),
    };
  }

  Future<void> logout() async {
    await _authRepo.logout();
    _user = null;
    notifyListeners();
  }

  bool _handleSuccess(LoginRes data) {
    _user = data.user;
    _errorMessage = null;
    _authRepo.saveToken(data.token);
    _setLoading(false);
    return true;
  }

  bool _handleError(String message) {
    _errorMessage = message;
    _user = null;
    _setLoading(false);
    return false;
  }

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
}
