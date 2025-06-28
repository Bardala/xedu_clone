import 'package:flutter/material.dart';
import 'package:profile_card/routes/app_routes.dart';
import 'package:profile_card/ui/view_model/auth_view_model.dart';
import 'package:profile_card/ui/views/userProfile/widgets/action_buttons.dart';
import 'package:profile_card/ui/views/userProfile/widgets/profile_card.dart';
import 'package:profile_card/ui/views/userProfile/widgets/profile_details_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ProfileScreen extends StatelessWidget with AppRoutes {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = context.watch<AuthViewModel>().currentUser;

    if (user == null) {
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.error_outline, size: 60, color: Colors.grey[400]),
              const SizedBox(height: 20),
              Text(
                'No user data available',
                style: TextStyle(fontSize: 18, color: Colors.grey[600]),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 250,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                user.name,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      blurRadius: 10,
                      color: Colors.black45,
                      offset: Offset(1, 1),
                    ),
                  ],
                ),
              ),
              background: Stack(
                fit: StackFit.expand,
                children: [
                  // Enhanced Image with better positioning
                  Positioned.fill(
                    child: Image.asset(
                      "assets/egyptian_writer.jpg",
                      fit: BoxFit.cover,
                      alignment: Alignment.topCenter, // Ensures head is visible
                      color: Colors.amber.withOpacity(
                        0.6,
                      ), // Warmer yellow tone
                      colorBlendMode:
                          BlendMode.softLight, // More natural blending
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        stops: [0.1, 0.9], // Better gradient control
                        colors: [
                          Colors.black.withOpacity(0.8), // Darker at bottom
                          Colors.transparent,
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.logout),
                onPressed: () => _logout(context),
                tooltip: 'Logout',
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  ProfileCard(user: user).animate().fadeIn(delay: 200.ms),
                  const SizedBox(height: 30),
                  ProfileDetailsSection(
                    user: user,
                  ).animate().fadeIn(delay: 400.ms),
                  ActionButtons(user: user).animate().fadeIn(delay: 600.ms),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _logout(BuildContext context) {
    context.read<AuthViewModel>().logout();
    navigateTo(context, AppRoutes.login);
  }
}
