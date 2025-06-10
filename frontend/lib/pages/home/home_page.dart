import 'package:flutter/material.dart';
import 'package:frontend/services/auth_service.dart';

class HomePage extends StatelessWidget {
  final AuthService _authService = AuthService();
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: _authService.signOut,
        child: Text("Sign Out"),
      ),
    );
  }
}
