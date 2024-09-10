import 'package:flutter/material.dart';
import 'pages/register.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title:const Text("Causons Application"),
        ),
        body: Center(
          child: const Text(

            "Bienvenue sur Causons Application",

            style: TextStyle(
              
              fontSize: 24,
            ),
            ),
          ),
          )
          );

  }
}
