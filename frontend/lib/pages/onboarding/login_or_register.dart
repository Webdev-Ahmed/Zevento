import 'package:flutter/material.dart';

class LoginOrRegister extends StatelessWidget {
  const LoginOrRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // SizedBox(height: 60),
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(
                      context,
                    ).colorScheme.onSurface.withValues(alpha: 0.3),
                    blurRadius: 20,
                    spreadRadius: 0.5,
                  ),
                ],
              ),
              height: 300,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.calendar_month_rounded,
                        size: 65,
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                      Text(
                        "Zevento",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 10),

                  Text(
                    "The best way to tour!",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                  ),
                ],
              ),
            ),

            // Logo
          ],
        ),
      ),
    );
  }
}

extension on TextStyle {
  fadeIn() {}
}
