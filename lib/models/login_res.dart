import 'package:profile_card/models/user_model.dart';

class LoginRes {
  final User user;
  final String token;

  LoginRes({required this.user, required this.token});

  factory LoginRes.fromJson(Map<String, dynamic> json) {
    return LoginRes(
      user: User.fromJson(json["user"] as Map<String, dynamic>),
      token: json['token'] as String,
    );
  }
}
