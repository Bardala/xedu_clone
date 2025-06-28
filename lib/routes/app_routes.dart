// main.dart

import 'package:flutter/material.dart';
import 'package:profile_card/ui/core/ui/navigator_button.dart';
import 'package:profile_card/ui/views/advisors/advisors_screen.dart';
import 'package:profile_card/ui/views/home/home_screen.dart';
import 'package:profile_card/ui/views/login/login_screen.dart';
import 'package:profile_card/ui/views/userProfile/profile_screen.dart';
import 'package:profile_card/ui/views/signup/signup_screen.dart';

mixin AppRoutes {
  static final String login = "/login";
  static final String signup = "/signup";
  static final String profile = "/profile";
  static final String advisors = "/advisors";
  static final String home = "/home";

  static final Map<String, Widget Function(BuildContext)> routes = {
    profile: (context) => const ProfileScreen(),
    signup: (context) => const SignupScreen(),
    login: (context) => const LoginScreen(),
    advisors: (context) => const AdvisorsScreen(),
    home: (context) => const HomeScreen(),
  };

  void navigateTo(BuildContext context, String routeName) =>
      Navigator.of(context).pushReplacementNamed(routeName);

  NavigatorButton loginButton(BuildContext context, {String text = "LOGIN"}) =>
      NavigatorButton(text: text, route: login);

  NavigatorButton signupButton(
    BuildContext context, {
    String text = "Sign Up",
  }) => NavigatorButton(text: text, route: signup);

  NavigatorButton profileButton(
    BuildContext context, {
    String text = "Profile",
  }) => NavigatorButton(text: text, route: profile);
}
