import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class GreetingCard extends StatelessWidget {
  const GreetingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hello there!",
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.blue.shade800,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "Discover personalized recommendations and connect with experts to boost your journey.",
              style: TextStyle(fontSize: 14, color: Colors.grey.shade700),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue.shade600,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                onPressed: () {},
                child: const Text("Get Started"),
              ),
            ),
          ],
        ),
      ),
    ).animate().fadeIn(delay: 100.ms);
  }
}
