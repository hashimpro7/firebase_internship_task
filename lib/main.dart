import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_internship/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyCM00UsC0Px3NV9RqVSJ2MMQ3CplwfbJKo",
      projectId: "fir-s-8614b",
      messagingSenderId: "128404336454",
      appId: "1:128404336454:web:a0727945fb7c0d8b7e7f47",
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase',
      home: LoginPage(),
    );
  }
}
