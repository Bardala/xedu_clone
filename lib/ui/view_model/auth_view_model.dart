import 'package:flutter/material.dart';
import 'package:profile_card/models/user_model.dart';
import 'package:profile_card/repo/auth_repo.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class AuthViewModel with ChangeNotifier {
  final AuthRepo _authRepo = AuthRepo();

  bool _isLoading = false;
  String? _errorMessage;
  User? _user;

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  User? get currentUser => _user;

  Future<bool> login(String email, String password) async {
    _isLoading = true;
    _errorMessage = null;

    /*Called before API call to trigger loading UI
    Widgets listening will rebuild */
    notifyListeners();

    try {
      final res = await _authRepo.login(email, password);
      await _authRepo.saveToken(res.token);

      _user = res.user;
      return true; // Success
    } catch (e) {
      _errorMessage = e.toString();
      _user = null;
      return false; // Failure
    } finally {
      _isLoading = false;

      /*Ensures UI updates after success/error
      Removes loading state*/
      notifyListeners();
    }
  }

  Future<void> logout() async {
    await _authRepo.logout();
    _user = null;
    notifyListeners();
  }
}

/* 
  notifyListeners();
  When you call notifyListeners(), it tells all widgets that are listening to this AuthProvider 
  (via Provider, Consumer, or similar) to rebuild and update their UI.

  It’s like saying: “Hey UI, something changed — time to re-render!”
 */
