import 'dart:async';
import 'package:provider/provider.dart';

import 'package:flutter/material.dart';
import 'package:profile_card/ui/view_model/auth_view_model.dart';
import 'package:profile_card/ui/views/login/widgets/email_field.dart';
import 'package:profile_card/ui/views/login/widgets/login_button.dart';
import 'package:profile_card/ui/views/login/widgets/password_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Form and state management
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // ========== UI BUILD ==========
  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // Error message
              if (authViewModel.errorMessage != null)
                Text(
                  authViewModel.errorMessage!,
                  style: TextStyle(color: Colors.red),
                ),

              EmailFiled(controller: _emailController),
              const SizedBox(height: 20),

              PasswordField(controller: _passwordController),
              const SizedBox(height: 30),

              LoginButton(
                isLoading: authViewModel.isLoading,
                onPressed: () => _submitForm(context),
              ),

              // Sign up option
              TextButton(
                onPressed: () {
                  // Navigate to signup screen
                },
                child: const Text('Don\'t have an account? Sign up'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _submitForm(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      final success = await Provider.of<AuthViewModel>(
        context,
        listen: false,
      ).login(_emailController.text.trim(), _passwordController.text);

      if (success && mounted) {
        Navigator.of(context).pushReplacementNamed('/profile');
      }
    }
  }

  void _navigateToSignup(BuildContext context) {
    // Implement signup navigation
  }
}
