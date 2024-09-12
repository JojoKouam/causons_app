import 'package:causons/auth/connexion.dart';
import 'package:flutter/material.dart';

class Password extends StatefulWidget {
  const Password({super.key});

  @override
  State<Password> createState() => _PasswordState();
}

class _PasswordState extends State<Password> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.all(16.0),
          child: Form(
            child: Column(
              mainAxisSize: MainAxisSize.min,  // Réduit la taille de la colonne au minimum pour s'adapter au contenu
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Modifier le mot de passe',
                  style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,  // Centre le texte
                ),
                  
                const SizedBox(height: 20),
                TextFormField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    labelText: 'Nouveau Mot de passe',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    ),
                  ),
                ),

                 // Champ de confirmation du mot de passe
                const SizedBox(height: 20),
                TextFormField(
                  obscureText: true, //  masqué pour la confirmation
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.key),
                    labelText: 'Confirmation du mot de passe',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    ),
                  ),
                ),


                
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                     Navigator.push(context, MaterialPageRoute(builder: (context) => const Connexion()));
                  },
                  child: const Text('Enregistrer'),

                ),

                const SizedBox(height: 20),
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}
