import 'package:flutter/material.dart';
import 'package:frontend/components/my_button.dart';
import 'package:frontend/pages/onboarding/login_register_toggle.dart';

class LoginOrRegister extends StatelessWidget {
  const LoginOrRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      spreadRadius: 1,
                      blurRadius: 20,
                    ),
                  ],
                ),
                child: Image.network(
                  "https://images.unsplash.com/photo-1511739001486-6bfe10ce785f?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                  height: MediaQuery.of(context).size.height * 0.55,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  alignment: Alignment.bottomCenter,
                ),
              ),
            ),

            SizedBox(height: 20),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Opacity(
                opacity: 0.7,
                child: Text(
                  "Zevento",
                  style: TextStyle(
                    fontSize: 14,
                    fontVariations: [FontVariation("wght", 600.0)],
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                "Travel anywhere without worry!",
                style: TextStyle(
                  fontFamily: "Playfair",
                  fontVariations: [FontVariation("wght", 600.0)],
                  fontSize: 45,
                  letterSpacing: 0.5,
                ),
              ),
            ),

            SizedBox(height: 20),

            MyButton(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginRegisterToggle(),
                  ),
                );
              },
              text: "Next",
            ),
          ],
        ),
      ),
    );
  }
}
