import 'package:flutter/material.dart';

class NavigatorButton extends StatelessWidget {
  final String text;
  final String route;

  const NavigatorButton({super.key, required this.text, required this.route});

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: () => _navigator(context), child: Text(text));
  }

  void _navigator(BuildContext context) =>
      Navigator.of(context).pushReplacementNamed(route);
}
