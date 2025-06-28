import 'package:flutter/material.dart';
import 'package:profile_card/models/user_model.dart';

class ActionButtons extends StatelessWidget {
  final User user;

  const ActionButtons({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              backgroundColor: Colors.blue.shade700,
            ),
            onPressed: () {
              // Edit profile action
            },
            child: const Text('Edit Profile', style: TextStyle(fontSize: 16)),
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              side: BorderSide(color: Colors.blue.shade700),
            ),
            onPressed: () {
              // Share profile action
            },
            child: Text(
              'Share Profile',
              style: TextStyle(fontSize: 16, color: Colors.blue.shade700),
            ),
          ),
        ),
      ],
    );
  }
}
