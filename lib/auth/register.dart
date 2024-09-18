import 'dart:developer';

import 'package:causons/auth/authService.dart';
import 'package:causons/auth/connexion.dart';
import 'package:causons/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; 

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  //la variable pour afficher le mot de passe
  bool voirmdp = false;
  final _auth = AuthService();
  final _name = TextEditingController();
  final _email = TextEditingController();
  final _numero = TextEditingController();
  final _pwd = TextEditingController();
  final _pwdConfirm = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _name.dispose();
    _email.dispose();
    _numero.dispose();
    _pwd.dispose();
    _pwdConfirm.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 252, 171, 53), // AppBar transparent
        elevation: 0, 
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context); 
          },
        ),
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.all(16.0),
          child: Form(
            child: ListView(
              shrinkWrap: true,
              children: [
                const Text(
                  'Veuillez-vous enregistrer',
                  style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),

                // Champ pour le nom d'utilisateur
                const SizedBox(height: 20),
                TextFormField(
                  controller: _name,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.account_circle),
                    labelText: 'Nom',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    ),
                  ),
                ),

                // Champ de l'email
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

                // Champ du numéro de téléphone
                const SizedBox(height: 20),
                TextFormField(
                  controller: _numero,
                  keyboardType: TextInputType.phone, // le type de clavier
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly, 
                  ],
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.phone),
                    labelText: 'Numéro',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    ),
                  ),
                ),

                // Champ du mot de passe
                const SizedBox(height: 20),
                TextFormField(
                  controller: _pwd,
                  obscureText: !voirmdp, // Utilisation de l'état pour contrôler la visibilité
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.lock),
                    labelText: 'Mot de passe',
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        voirmdp ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          voirmdp = !voirmdp; // Change la visibilité du mot de passe
                        });
                      },
                    ),
                  ),
                ),

                // Champ de confirmation du mot de passe
                const SizedBox(height: 20),
                TextFormField(
                  controller: _pwdConfirm,
                  obscureText: true, //  masqué pour la confirmation
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.key),
                    labelText: 'Confirmation du mot de passe',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    ),
                  ),
                ),

                // Bouton  d'enregistrement 
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_pwd.text == _pwdConfirm.text) {
                      _signup();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black, 
                    backgroundColor: const Color.fromARGB(255, 252, 171, 53),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: const Text('S\'enregistrer'),
                ),

                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Déjà inscrit ? Connectez-vous ',
                      style: TextStyle(fontSize: 16),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Connexion()),
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

  // Fonction de connexion
  _signup() async {
    final user = await _auth.createUserWithEmailAndPassword(_email.text, _pwd.text);
    if (user != null) {
      log("User created");
      // ignore: use_build_context_synchronously
      Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
    }
  }
}
