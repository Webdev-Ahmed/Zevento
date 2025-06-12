import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:frontend/components/my_button.dart';
import 'package:frontend/components/my_google_button.dart';
import 'package:frontend/components/my_textfield.dart';
import 'package:frontend/services/auth_service.dart';
import 'package:lucide_icons/lucide_icons.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final AuthService _authService = AuthService();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final void Function()? onTap;
  LoginPage({super.key, required this.onTap});

  Future<void> signInEmail(BuildContext context) async {
    try {
      final UserCredential? userCredential = await _authService.signInWithEmail(
        emailController.text.trim(),
        passwordController.text.trim(),
      );
      if (userCredential != null && userCredential.user != null) {
        Navigator.of(
          context,
        ).pushNamedAndRemoveUntil('/home', (route) => false);
      }
    } on FirebaseAuthException catch (e) {
      // Handle Firebase Auth specific errors
      String errorMessage;
      switch (e.code) {
        case 'user-not-found':
          errorMessage = 'No user found for that email.';
          break;
        case 'wrong-password':
          errorMessage = 'Wrong password provided.';
          break;
        case 'user-disabled':
          errorMessage = 'This user account has been disabled.';
          break;
        default:
          errorMessage = "An error occurred. Please try again.";
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            errorMessage,
            style: TextStyle(
              color: Theme.of(context).colorScheme.onTertiary,
              fontVariations: [FontVariation("wght", 500.0)],
            ),
          ),
          backgroundColor: Theme.of(context).colorScheme.error,
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'An unexpected error occurred.',
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
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),

          // Title
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              "Login",
              textAlign: TextAlign.start,
              style: TextStyle(
                fontFamily: "Playfair",
                fontSize: 50,
                fontVariations: [FontVariation("wght", 600.0)],
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              "Enter valid email & password to continue",
              style: TextStyle(
                fontSize: 14,
                color: Theme.of(
                  context,
                ).colorScheme.onSecondary.withValues(alpha: 0.7),
                fontVariations: [FontVariation("wght", 400.0)],
              ),
            ),
          ),

          const SizedBox(height: 20),

          Form(
            key: _formKey,
            child: Column(
              children: [
                MyTextfield(
                  controller: emailController,
                  hintText: "Email",
                  iconEnabled: true,
                  icon: LucideIcons.atSign,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    final emailRegex = RegExp(
                      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
                    );
                    if (!emailRegex.hasMatch(value)) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 10),

                MyTextfield(
                  controller: passwordController,
                  hintText: "Password",
                  obscureText: true,
                  iconEnabled: true,
                  icon: LucideIcons.lock,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    if (value.length < 6) {
                      return 'Password must be at least 6 characters long';
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),

          const SizedBox(height: 15),

          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                "Forget Password",
                style: TextStyle(
                  fontSize: 14,
                  color: Theme.of(context).colorScheme.primary,
                  fontVariations: [FontVariation("wght", 600.0)],
                ),
              ),
            ),
          ),

          const SizedBox(height: 15),

          // Fixed: Pass function with context properly
          MyButton(
            onTap: () {
              _formKey.currentState!.validate();
              signInEmail(context);
            },
            text: "Login",
          ),

          const SizedBox(height: 15),

          Row(
            children: [
              Expanded(
                child: Divider(
                  height: 1,
                  indent: 10,
                  endIndent: 10,
                  color: Theme.of(
                    context,
                  ).colorScheme.onSecondary.withValues(alpha: 0.5),
                ),
              ),
              Text(
                "OR",
                style: TextStyle(
                  fontSize: 14,
                  color: Theme.of(
                    context,
                  ).colorScheme.onSecondary.withValues(alpha: 0.6),
                  fontFamily: "Playfair",
                  fontVariations: [FontVariation("wght", 600.0)],
                ),
              ),
              Expanded(
                child: Divider(
                  height: 1,
                  indent: 10,
                  endIndent: 10,
                  color: Theme.of(
                    context,
                  ).colorScheme.onSecondary.withValues(alpha: 0.5),
                ),
              ),
            ],
          ),

          const SizedBox(height: 15),

          MyGoogleButton(type: "login"),

          const SizedBox(height: 15),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Don't have an account?",
                style: TextStyle(
                  fontSize: 14,
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
              ),
              TextButton(
                onPressed: onTap,
                child: Text(
                  "Sign Up",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontVariations: [FontVariation("wght", 600.0)],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
