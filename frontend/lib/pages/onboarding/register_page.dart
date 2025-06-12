import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:frontend/components/my_button.dart';
import 'package:frontend/components/my_google_button.dart';
import 'package:frontend/components/my_textfield.dart';
import 'package:frontend/services/auth_service.dart';
import 'package:lucide_icons/lucide_icons.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final AuthService _authService = AuthService();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final void Function()? onTap;

  RegisterPage({super.key, required this.onTap});

  Future<void> registerUser(BuildContext context) async {
    if (!_formKey.currentState!.validate()) return;

    if (passwordController.text != confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Passwords do not match.",
            style: TextStyle(
              color: Theme.of(context).colorScheme.onTertiary,
              fontVariations: [FontVariation("wght", 500.0)],
            ),
          ),
          backgroundColor: Theme.of(context).colorScheme.error,
        ),
      );
      return;
    }

    try {
      final UserCredential? userCredential = await _authService.signUpWithEmail(
        emailController.text.trim(),
        passwordController.text.trim(),
      );

      if (userCredential != null && userCredential.user != null) {
        Navigator.of(
          context,
        ).pushNamedAndRemoveUntil('/home', (route) => false);
      }
    } on FirebaseAuthException catch (e) {
      String errorMessage;
      switch (e.code) {
        case 'email-already-in-use':
          errorMessage = 'Email is already in use.';
          break;
        case 'invalid-email':
          errorMessage = 'Invalid email address.';
          break;
        case 'weak-password':
          errorMessage = 'Password is too weak.';
          break;
        default:
          errorMessage = "Registration failed. Please try again.";
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              "Register",
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
              "Create a new account to get started",
              style: TextStyle(
                fontSize: 14,
                color: Theme.of(context).colorScheme.onSecondary.withAlpha(180),
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
                    if (value == null || value.isEmpty)
                      return 'Please enter your email';
                    final emailRegex = RegExp(
                      r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$',
                    );
                    if (!emailRegex.hasMatch(value))
                      return 'Enter a valid email address';
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
                    if (value == null || value.isEmpty)
                      return 'Enter your password';
                    if (value.length < 6)
                      return 'Password must be at least 6 characters';
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                MyTextfield(
                  controller: confirmPasswordController,
                  hintText: "Confirm Password",
                  obscureText: true,
                  iconEnabled: true,
                  icon: LucideIcons.keyRound,
                  validator: (value) {
                    if (value == null || value.isEmpty)
                      return 'Confirm your password';
                    return null;
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 15),

          MyButton(onTap: () => registerUser(context), text: "Register"),

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

          MyGoogleButton(type: "register"),

          const SizedBox(height: 15),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Already have an account?",
                style: TextStyle(
                  fontSize: 14,
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
              ),
              TextButton(
                onPressed: onTap,
                child: Text(
                  "Login",
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
