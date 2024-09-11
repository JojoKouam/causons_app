import 'package:flutter/material.dart';

import 'auth/register.dart';


void main() {
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
    );
  }
}

