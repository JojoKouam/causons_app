import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:causons/services/userService.dart';

class ProfilPage extends StatelessWidget {
  const ProfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    final userService = UserService();
    return FutureBuilder<Map<String, dynamic>?>(
      future: userService.getConnectedUserData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            body: Center(child: CircularProgressIndicator()), // Affiche un indicateur de chargement
          );
        } else if (snapshot.hasError) {
          return Scaffold(
            body: Center(child: Text('Error: ${snapshot.error}')), // Affiche une erreur si la récupération échoue
          );
        } else if (snapshot.hasData) {
          final userData = snapshot.data!;
          return Scaffold(
            body: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 80,
                    backgroundImage: NetworkImage(userData['profilePictureUrl'] ?? 'https://placehold.co/400x600'),
                  ),
                  Text('Nom: ${userData['name'] ?? 'N/A'}', style: TextStyle(fontSize: 24)),
                  SizedBox(height: 10),
                  Text('Email: ${userData['email'] ?? 'N/A'}', style: TextStyle(fontSize: 18)),
                  SizedBox(height: 10),
                  Text('Téléphone: ${userData['contacts'] ?? 'N/A'}', style: TextStyle(fontSize: 18)),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      log("message");
                    },
                    child: Text('Modifier Profil'),
                  ),
                ],
              ),
            ),
          );
        } else {
          return Scaffold(
            body: Center(child: Text('No user data found')), // Affiche un message si aucune donnée utilisateur n'est trouvée
          );
        }
      },
    );
  }
}
