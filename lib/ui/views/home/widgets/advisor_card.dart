import 'package:flutter/material.dart';
import 'package:profile_card/models/advisor.dart';

class AdvisorCard extends StatelessWidget {
  final Advisor advisor;

  const AdvisorCard({super.key, required this.advisor});

  @override
  Widget build(BuildContext context) {
    final hasImage = advisor.imageUrl.isNotEmpty == true;

    return Container(
      width: 240,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.indigo.shade50, Colors.blue.shade100],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(2, 4)),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: 36,
            backgroundImage: hasImage ? NetworkImage(advisor.imageUrl) : null,
            child: !hasImage ? const Icon(Icons.person, size: 36) : null,
          ),
          const SizedBox(height: 12),
          Text(
            advisor.name,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4),
          Text(
            advisor.specialty,
            style: TextStyle(color: Colors.grey[600], fontSize: 12),
          ),
          const SizedBox(height: 4),
          Expanded(
            child: Text(
              advisor.bio,
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 12),
            ),
          ),
          const SizedBox(height: 6),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.indigo,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              minimumSize: const Size.fromHeight(32),
            ),
            child: const Text(
              "Book",
              style: TextStyle(fontSize: 12, color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
