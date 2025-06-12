import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:frontend/services/auth_service.dart';
import 'package:icons_plus/icons_plus.dart';

class MyGoogleButton extends StatelessWidget {
  final String type;
  final AuthService _authService = AuthService();
  MyGoogleButton({super.key, this.type = "login"});

  @override
  Widget build(BuildContext context) {
    Future<void> signInGoogle(BuildContext context) async {
      try {
        final UserCredential? userCredential =
            await _authService.signInWithGoogle();
        if (userCredential != null && userCredential.user != null) {
          Navigator.of(
            context,
          ).pushNamedAndRemoveUntil('/home', (route) => false);
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Google sign-in failed. Please try again.',
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

    return GestureDetector(
      onTap: () => signInGoogle(context),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.tertiary,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            width: 1,
            color: Theme.of(
              context,
            ).colorScheme.secondary.withValues(alpha: 0.7),
          ),
        ),
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Brand(Brands.google, size: 24),
            SizedBox(width: 16),
            Text(
              type == "login" ? "Sign in with Google" : "Sign up with Google",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onTertiary,
                fontSize: 16,
                fontVariations: [FontVariation("wght", 400.0)],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
