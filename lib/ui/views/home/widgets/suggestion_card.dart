import 'package:flutter/material.dart';

class SuggestionCard extends StatelessWidget {
  final IconData icon;
  final String title;

  const SuggestionCard({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.indigo.shade50,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Icon(icon, size: 32, color: Colors.indigo),
          const SizedBox(height: 8),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}
