import 'package:flutter/material.dart';

class ProfilPage extends StatelessWidget {
  const ProfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 80,
              backgroundImage: AssetImage("https://placehold.co/600x400"),
              backgroundColor: Color(0xFFfcab35),
            ),
            const Text('Nom: John Doe', style: TextStyle(fontSize: 24)),
            const SizedBox(height: 10),
            const Text('Email: johndoe@example.com', style: TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            const Text('Télephone: +225 07 07 07 00 00', style: TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Action à effectuer
              },
              child: const Text('Modifier Profil'),
            ),
          ],
        ),
      ),
    );
  }
}
