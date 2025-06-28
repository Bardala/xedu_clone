import 'package:flutter/material.dart';
import 'package:profile_card/ui/views/userProfile/profile_screen.dart';

import 'widgets/greeting_card.dart';
import 'widgets/quick_actions.dart';
import 'widgets/advisors_section.dart';
import 'widgets/state_overview.dart';
import 'widgets/suggested_section.dart';
import 'widgets/up_coming_event.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.school, color: Colors.white),
            const SizedBox(width: 8),
            ShaderMask(
              shaderCallback: (bounds) => LinearGradient(
                colors: [Colors.white, Colors.blue.shade100],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ).createShader(bounds),
              child: const Text(
                'Xedu',
                style: TextStyle(
                  fontFamily: 'XeduFont',
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.2,
                  color: Colors.white, // Required for ShaderMask
                ),
              ),
            ),
          ],
        ),
        centerTitle: false,
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue.shade700, Colors.blue.shade400],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const ProfileScreen()),
                );
              },
              icon: CircleAvatar(
                radius: 18,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 16,
                  backgroundImage: const AssetImage("assets/avatar.jpg"),
                  onBackgroundImageError: (_, __) =>
                      const Icon(Icons.person, color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Greeting Card
              GreetingCard(),
              const SizedBox(height: 24),

              // Quick Actions
              QuickActions(),
              const SizedBox(height: 24),

              // Suggested Features
              const Text(
                "Featured Resources",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              const SuggestedFeaturesBar(),
              const SizedBox(height: 24),

              // Stats Overview
              StatsOverView(),
              const SizedBox(height: 24),

              // Advisors Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Meet Our Advisors",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  TextButton(onPressed: () {}, child: const Text("View All")),
                ],
              ),
              const SizedBox(height: 12),
              const AdvisorsSection(),
              const SizedBox(height: 24),

              // Upcoming Events
              UpComingEvent(),
            ],
          ),
        ),
      ),
    );
  }
}
