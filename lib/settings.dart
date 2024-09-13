import 'package:causons/auth/connexion.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  Future<void> _logout(BuildContext context) async {
    try {
      // Déconnexion de l'utilisateur
      await FirebaseAuth.instance.signOut();

      // Vider le stockage local
      final prefs = await SharedPreferences.getInstance();
      await prefs.clear();

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Connexion()),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erreur lors de la déconnexion : $e')),
      );
    }
  }


  // Pop Up de confirmation de deconnexion
  void _showLogoutConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirmation de déconnexion'),
          content: const Text('Voulez-vous vraiment vous déconnecter ?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Annuler'),
              onPressed: () {
                Navigator.of(context).pop(); // Fermer le dialogue
              },
            ),
            TextButton(
              child: const Text('Se déconnecter'),
              onPressed: () {
                Navigator.of(context).pop(); // Fermer le dialogue
                _logout(context); // Appeler la méthode de déconnexion
              },
            ),
          ],
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          const ListTile(
            leading: Icon(Icons.share),
            title: Text('Partager l\'application'),
            subtitle: Text('Inviter des amis(es)'),
          ),
          const Divider(height: 0),
          const ListTile(
            leading: Icon(Icons.language),
            title: Text('Langues'),
            subtitle: Text('Changer la langue de l\'application'),
          ),
          const Divider(height: 0),
          const ListTile(
            leading: Icon(Icons.numbers),
            title: Text('Changer de numéro de téléphone'),
            subtitle: Text('Vos contacts seront informés'),
          ),
          const Divider(height: 0),
          const ListTile(
            leading: Icon(Icons.safety_check),
            title: Text('Modifier mon code de sécurité'),
          ),
          const Divider(height: 0),
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.red),
            title: const Text('Se déconnecter'),
            onTap: () => _showLogoutConfirmationDialog(context),
          ),
          const Divider(height: 0),
          const ListTile(
            leading: Icon(Icons.close_outlined, color: Colors.red),
            title: Text('Supprimer mon compte'),
          ),
        ],
      ),
    );
  }
}
