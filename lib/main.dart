import 'package:flutter/material.dart';
import 'package:profile_card/routes/app_routes.dart';
import 'package:profile_card/ui/view_model/auth_view_model.dart';
import 'package:profile_card/ui/views/login/login_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    /* 
    Creates an AuthProvider instance available to all child widgets
    Uses ChangeNotifierProvider because our AuthProvider extends ChangeNotifier
     */
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => AuthViewModel())],
      // All widgets under MyApp can access the AuthProvider
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const LoginScreen(),
      routes: AppRoutes.routes,
    );
  }
}
