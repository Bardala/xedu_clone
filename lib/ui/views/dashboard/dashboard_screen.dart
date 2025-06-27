import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<_DashboardItem> items = const [
      _DashboardItem(Icons.calendar_today, 'Schedule', Colors.purple),
      _DashboardItem(Icons.person, 'Profile', Colors.teal),
      _DashboardItem(Icons.settings, 'Settings', Colors.orange),
      _DashboardItem(Icons.coffee, 'Coffee', Colors.brown),
      _DashboardItem(Icons.alarm, 'Alarm', Colors.blueGrey),
      _DashboardItem(Icons.people, 'Friends', Colors.indigo),
      _DashboardItem(Icons.security, 'Security', Colors.green),
      _DashboardItem(Icons.code, 'Projects', Colors.deepPurple),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        backgroundColor: Colors.blueAccent,
      ),
      body: GridView.count(
        padding: const EdgeInsets.all(16),
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        children: items.map((item) {
          return DashboardCard(
            icon: item.icon,
            title: item.title,
            color: item.color,
          );
        }).toList(),
      ),
    );
  }
}

class DashboardCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color color;

  const DashboardCard({
    super.key,
    required this.icon,
    required this.title,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [color.withOpacity(0.8), color.withOpacity(0.4)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(2, 4)),
        ],
      ),
      child: InkWell(
        // InkWell: plays the role of adding a material touch interaction—literally.
        onTap: () {}, // Add functionality here
        borderRadius: BorderRadius.circular(20),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: Colors.white, size: 40),
              const SizedBox(height: 12),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DashboardItem {
  final IconData icon;
  final String title;
  final Color color;

  const _DashboardItem(this.icon, this.title, this.color);
}
