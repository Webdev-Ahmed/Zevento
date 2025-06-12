import 'package:flutter/material.dart';
import 'package:frontend/pages/onboarding/login_page.dart';
import 'package:frontend/pages/onboarding/register_page.dart';

class LoginRegisterToggle extends StatefulWidget {
  const LoginRegisterToggle({super.key});

  @override
  State<LoginRegisterToggle> createState() => _LoginRegisterToggleState();
}

class _LoginRegisterToggleState extends State<LoginRegisterToggle> {
  bool loginPageToggle = true;

  void togglePage() {
    setState(() {
      loginPageToggle = !loginPageToggle;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:
          loginPageToggle
              ? LoginPage(onTap: togglePage)
              : RegisterPage(onTap: togglePage),
    );
  }
}
