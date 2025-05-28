import 'package:flutter/material.dart';
import 'package:frontend/pages/onboarding/login_or_register.dart';
import 'package:frontend/themes/light_mode.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zvento',
      theme: lightMode,
      debugShowCheckedModeBanner: false,
      home: LoginOrRegister(),
    );
  }
}
