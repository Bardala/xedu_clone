import 'package:flutter/material.dart';
import 'package:profile_card/routes/app_routes.dart';
import 'package:provider/provider.dart';
import 'package:profile_card/models/user_model.dart';
import 'package:profile_card/ui/view_model/auth_view_model.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> with AppRoutes {
  final _formKey = GlobalKey<FormState>();

  // Controllers
  final _emailController = TextEditingController();
  final _nameController = TextEditingController();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _jobController = TextEditingController();
  final _phoneController = TextEditingController();
  final _addressController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _nameController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    _jobController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final auth = context.watch<AuthViewModel>();

    return Scaffold(
      appBar: AppBar(title: const Text('Sign Up')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              if (auth.errorMessage != null)
                Text(
                  auth.errorMessage!,
                  style: const TextStyle(color: Colors.red),
                ),
              const SizedBox(height: 12),

              _buildTextField(
                _emailController,
                'Email',
                TextInputType.emailAddress,
              ),
              _buildTextField(_nameController, 'Name'),
              _buildTextField(_usernameController, 'Username'),
              _buildTextField(
                _passwordController,
                'Password',
                TextInputType.visiblePassword,
                true,
              ),
              _buildTextField(
                _jobController,
                'Job (Optional)',
                TextInputType.text,
                false,
                false,
              ),
              _buildTextField(
                _phoneController,
                'Phone (Optional)',
                TextInputType.text,
                false,
                false,
              ),
              _buildTextField(
                _addressController,
                'Address (Optional)',
                TextInputType.text,
                false,
                false,
              ),

              const SizedBox(height: 24),

              ElevatedButton(
                onPressed: auth.isLoading ? null : _submitForm,
                child: auth.isLoading
                    ? const CircularProgressIndicator()
                    : const Text("Create Account"),
              ),

              loginButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
    TextEditingController controller,
    String label, [
    TextInputType keyboardType = TextInputType.text,
    bool obscure = false,
    bool required = true,
  ]) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscure,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
        validator: required
            ? (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter $label';
                }
                return null;
              }
            : null,
      ),
    );
  }

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      final user = User(
        email: _emailController.text.trim(),
        name: _nameController.text.trim(),
        phone: _phoneController.text.trim(),
        job: _jobController.text.trim(),
        address: _addressController.text.trim(),
        username: _usernameController.text.trim(),
        password: _passwordController.text,
      );

      final success = await context.read<AuthViewModel>().signup(user);

      if (success && mounted) {
        navigateTo(context, AppRoutes.profile);
      }
    }
  }
}
