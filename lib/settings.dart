import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      ListView(
          children: const <Widget>[
            ListTile(
              leading: Icon(Icons.share),
              title: Text('Partager l\'application'),
              subtitle: Text('Inviter des amis(es)'),
            ),
            Divider(height: 0,),
            ListTile(
              leading: Icon(Icons.language),
              title: Text('Langues'),
              subtitle: Text('Changer la langue de l\'application'),
            ),
            Divider(height: 0,),
            ListTile(
              leading: Icon(Icons.numbers),
              title: Text('Changer de numéro de téléphone'),
              subtitle: Text('Vos contacts serons informés'),
            ),
            Divider(height: 0,),
            ListTile(
              leading: Icon(Icons.safety_check),
              title: Text('Modifier mon code de sécurité'),

            ),
            Divider(height: 0,),
            ListTile(
              leading: Icon(Icons.logout, color: Colors.red,),
              title: Text('Se déconnecter'),

            ),
            Divider(height: 0,),
            ListTile(
              leading: Icon(Icons.close_outlined, color: Colors.red,),
              title: Text('Supprimer mon compte'),

            ),
          ],
        ),
      );
  }
}
