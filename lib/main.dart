import 'package:desarrollo_patroclos/pages_global/login_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const PatroclosApp());
}

class PatroclosApp extends StatelessWidget {
  const PatroclosApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Patroclos - Dashboard Usuario',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 222, 182, 113)),
        useMaterial3: true,
      ),
      home: const LoginPage(),
    );
  }
}
