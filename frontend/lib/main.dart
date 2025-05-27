import 'package:flutter/material.dart';
import 'package:frontend/pages/auth/login_page.dart';
import 'package:frontend/themes/light_mode.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zevento',
      theme: LightMode,
      debugShowCheckedModeBanner: false,
      home: const LoginPage(),
    );
  }
}
