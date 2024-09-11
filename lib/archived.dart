import 'package:flutter/material.dart';

class ArchivedPage extends StatelessWidget {
  const ArchivedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Messages archivés', style: TextStyle(fontSize: 24)),
            const SizedBox(height: 10),
            const Text('Email: johndoe@example.com', style: TextStyle(fontSize: 18)),
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
