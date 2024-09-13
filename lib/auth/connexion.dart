import 'dart:developer';

import 'package:causons/auth/newpassword.dart';
import 'package:causons/auth/register.dart';
import 'package:causons/home_page.dart';
import 'package:flutter/material.dart';
import 'package:causons/auth/authService.dart';

class Connexion extends StatefulWidget {
  const Connexion({super.key});

  @override
  State<Connexion> createState() => _ConnexionState();
}

class _ConnexionState extends State<Connexion> {

  final _auth = AuthService();

  final _email = TextEditingController();
  final _pwd = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _email.dispose();
    _pwd.dispose();
  }

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
                  'Veuillez-vous connecter',
                  style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,  // Centre le texte
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _email,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    labelText: 'Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    ),
                    ),
                  ),

                  
                const SizedBox(height: 20),
                TextFormField(
                  controller: _pwd,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    labelText: 'Mot de passe',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    ),
                  ),
                ),

                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    _login();
                  },
                    child: const Text('Se connecter'),
                ),

                
                const SizedBox(height: 20),
                Row( 
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                  'S\'enregistrer : ',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                     Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Register(),
                    ),
                    );
                  },
                  child: const Text(
                    'ici',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color.fromARGB(255, 221, 187, 33),
                      fontWeight: FontWeight.bold,
                    ),
                    ),
                  ), 
               ],
                ),



                const SizedBox(height: 20),
                Row( 
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                  'Changer de mot de passe : ',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                     Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Password(),
                    ),
                    );
                  },
                  child: const Text(
                    'ici',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color.fromARGB(255, 221, 187, 33),
                      fontWeight: FontWeight.bold,
                    ),
                    ),
                  ), 
               ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  goToSignup(BuildContext context) => Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const Register()),
  );

  goToHome(BuildContext context) => Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const HomePage()),
  );

  _login() async {
    final user = await _auth.loginUserWithEmailAndPassword(_email.text, _pwd.text);
    if (user != null) {
      log("User connected");
      goToHome(context);
    }
  }
  }




