import 'package:flutter/material.dart';
import 'package:profile_card/models/user_model.dart';
import 'package:profile_card/ui/views/userProfile/widgets/social_button.dart';

class ProfileCard extends StatelessWidget {
  final User user;

  const ProfileCard({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.blue.shade200, width: 3),
                    image: const DecorationImage(
                      image: AssetImage("assets/avatar.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade700,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                  child: const Icon(
                    Icons.verified,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              user.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              user.job ?? 'No job specified',
              style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SocialButton(
                  icon: Icons.email,
                  color: Colors.red.shade400,
                  onPressed: () {},
                ),
                SocialButton(
                  icon: Icons.phone,
                  color: Colors.green.shade400,
                  onPressed: () {},
                ),
                SocialButton(
                  icon: Icons.location_on,
                  color: Colors.blue.shade400,
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
