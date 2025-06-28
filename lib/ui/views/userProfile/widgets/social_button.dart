import 'package:flutter/material.dart';

class SocialButton extends StatelessWidget {
  final IconData icon;
  final Color color;
  final VoidCallback onPressed;

  const SocialButton({
    required this.icon,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.2),
            blurRadius: 8,
            spreadRadius: 2,
          ),
        ],
      ),
      child: IconButton(
        icon: Icon(icon, color: color),
        onPressed: onPressed,
        style: IconButton.styleFrom(
          backgroundColor: Colors.white,
          padding: const EdgeInsets.all(12),
        ),
      ),
    );
  }
}
