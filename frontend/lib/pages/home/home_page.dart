import 'package:flutter/material.dart';
import 'package:frontend/services/auth_service.dart';

class HomePage extends StatelessWidget {
  final AuthService _authService = AuthService();
  HomePage({super.key});

  Future<void> signOut(BuildContext context) async {
    try {
      await _authService.signOut();
      Navigator.of(context).pushNamedAndRemoveUntil('/login', (route) => false);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Error signing out: $e',
            style: TextStyle(
              color: Theme.of(context).colorScheme.onTertiary,
              fontVariations: [FontVariation("wght", 500.0)],
            ),
          ),
          backgroundColor: Theme.of(context).colorScheme.error,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () => signOut(context),
        child: Text("Sign Out"),
      ),
    );
  }
}
