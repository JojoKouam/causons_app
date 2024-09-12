import 'package:causons/home_page.dart';
import 'package:flutter/material.dart';

import 'auth/register.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Causons',
      theme: ThemeData.dark(),
      themeMode: ThemeMode.dark,
   
      debugShowCheckedModeBanner: false,
      home: const Register(),
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

