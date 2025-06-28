import 'dart:async';
import 'package:profile_card/routes/app_routes.dart';
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

class _LoginScreenState extends State<LoginScreen> with AppRoutes {
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
    /* 
    This is how you access a provider from anywhere in the widget tree,
    you often don't use this directly 
     */
    // final viewModel = Provider.of<AuthViewModel>(context);

    /* context.watch<T>()
    ✅ Listens for changes to the provider and rebuilds the widget when notifyListeners() is called.
    📦 Use this inside build() method or inside any widget that depends on updated
    🧠 Bonus Tip: Avoid calling watch in initState or async methods — it only works inside build.
     */
    final viewModel = context.watch<AuthViewModel>();

    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // Error message
              if (viewModel.errorMessage != null)
                Text(
                  viewModel.errorMessage!,
                  style: TextStyle(color: Colors.red),
                ),

              EmailFiled(controller: _emailController),
              const SizedBox(height: 20),

              PasswordField(controller: _passwordController),
              const SizedBox(height: 30),

              LoginButton(
                isLoading: viewModel.isLoading,
                onPressed: () => _submitForm(context),
              ),

              // Sign up option
              signupButton(context, text: "Don't have an account? Sign up"),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _submitForm(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      /** context.read<T>()
    ✅ Used when you want to call methods on the provider without listening for changes.
    🚫 Does not rebuild your widget when the provider notifies listeners.
     */
      final viewModel = context.read<AuthViewModel>();
      final success = await viewModel.login(
        _emailController.text.trim(),
        _passwordController.text,
      );

      if (success && mounted) navigateTo(context, AppRoutes.home);
    }
  }
}
