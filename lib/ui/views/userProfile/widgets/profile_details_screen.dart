import 'package:flutter/material.dart';
import 'package:profile_card/models/user_model.dart';
import 'package:profile_card/ui/views/userProfile/widgets/detail_title.dart';

class ProfileDetailsSection extends StatelessWidget {
  final User user;

  const ProfileDetailsSection({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Contact Information',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            DetailTile(
              icon: Icons.email,
              title: 'Email',
              value: user.email,
              color: Colors.red.shade400,
            ),
            DetailTile(
              icon: Icons.phone,
              title: 'Phone',
              value: user.phone ?? 'Not provided',
              color: Colors.green.shade400,
            ),
            DetailTile(
              icon: Icons.location_on,
              title: 'Address',
              value: user.address ?? 'Not provided',
              color: Colors.blue.shade400,
            ),
            DetailTile(
              icon: Icons.person,
              title: 'Username',
              value: user.username,
              color: Colors.purple.shade400,
            ),
          ],
        ),
      ),
    );
  }
}
