import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class QuickActions extends StatelessWidget {
  final actions = [
    {'icon': Icons.calendar_today, 'label': 'Schedule'},
    {'icon': Icons.bookmark, 'label': 'Saved'},
    {'icon': Icons.notifications, 'label': 'Alerts'},
    {'icon': Icons.settings, 'label': 'Settings'},
  ];

  QuickActions({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 4,
      childAspectRatio: 0.9,
      children: actions.map((action) {
        return Column(
          children: [
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Icon(
                action['icon'] as IconData,
                color: Colors.blue.shade700,
                size: 28,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              action['label'] as String,
              style: TextStyle(fontSize: 12, color: Colors.grey.shade700),
            ),
          ],
        );
      }).toList(),
    ).animate().slideX(delay: 200.ms);
  }
}
