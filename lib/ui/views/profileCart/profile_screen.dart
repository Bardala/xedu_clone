import "package:flutter/material.dart";
import "package:profile_card/routes/app_routes.dart";
import "package:profile_card/ui/view_model/auth_view_model.dart";
import "package:provider/provider.dart";

class ProfileScreen extends StatelessWidget with AppRoutes {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = context.watch<AuthViewModel>().currentUser;

    if (user == null) {
      return const Scaffold(
        body: Center(child: Text('No user data available')),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        backgroundColor: Colors.lightBlueAccent,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => _logout(context),
          ),
        ],
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(24),
          margin: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.blue[50],
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(color: Colors.black12, blurRadius: 10, spreadRadius: 2),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: const DecorationImage(
                    image: AssetImage("assets/avatar.jpg"),
                    fit: BoxFit.cover,
                  ),
                  color: Colors.amber,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      spreadRadius: 2,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Text(
                user.name,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.person, color: Colors.purple[400]),
                  const SizedBox(width: 8),
                  Text(user.job!, style: TextStyle(color: Colors.grey[600])),
                ],
              ),
              const SizedBox(height: 16),
              _ProfileInfoRow(
                icon: Icon(Icons.email, color: Colors.cyan[400]),
                text: user.email,
              ),
              _ProfileInfoRow(
                icon: Icon(Icons.phone, color: Colors.green[400]),
                text: user.phone,
              ),
              _ProfileInfoRow(
                icon: Icon(Icons.location_on, color: Colors.red[400]),
                text: user.address,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _logout(BuildContext context) {
    context.read<AuthViewModel>().logout();
    navigateTo(context, AppRoutes.home);
  }
}

class _ProfileInfoRow extends StatelessWidget {
  final Widget icon;
  final String? text;

  const _ProfileInfoRow({required this.icon, this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [icon, const SizedBox(width: 12), Text(text!)],
      ),
    );
  }
}
