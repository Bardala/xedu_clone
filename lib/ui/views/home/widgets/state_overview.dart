import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:profile_card/ui/views/home/widgets/state_item.dart';

class StatsOverView extends StatelessWidget {
  const StatsOverView({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Your Progress",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                StateItem(value: "12", label: "Connections"),
                StateItem(value: "5", label: "Sessions"),
                StateItem(value: "3", label: "Goals"),
              ],
            ),
          ],
        ),
      ),
    ).animate().fadeIn(delay: 300.ms);
  }
}
