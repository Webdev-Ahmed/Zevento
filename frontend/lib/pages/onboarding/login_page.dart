import 'package:flutter/material.dart';
import 'package:frontend/components/my_button.dart';
import 'package:frontend/components/my_textfield.dart';
import 'package:frontend/services/auth_service.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:lucide_icons/lucide_icons.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final AuthService _authService = AuthService();
  final void Function()? onTap;
  LoginPage({super.key, required this.onTap});

  void signInEmail() {
    _authService.signInWithEmail(
      emailController.text.trim(),
      passwordController.text.trim(),
    );
  }

  void signInGoogle() {
    _authService.signInWithGoogle();
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

          MyTextfield(
            controller: emailController,
            hintText: "Email",
            iconEnabled: true,
            icon: LucideIcons.atSign,
          ),

          const SizedBox(height: 10),

          MyTextfield(
            controller: passwordController,
            hintText: "Password",
            obscureText: true,
            iconEnabled: true,
            icon: LucideIcons.lock,
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

          MyButton(onTap: () => signInEmail, text: "Login"),

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

          GestureDetector(
            onTap: signInGoogle,
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
                    "Sign in with Google",
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
          ),

          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
