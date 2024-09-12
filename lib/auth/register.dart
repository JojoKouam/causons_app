import 'package:causons/auth/connexion.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; 

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool voirmdp = false; //la variable pour voir le mot de passe

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    labelText: 'Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    ),
                  ),
                ),

                // Champ du numéro de phone
                const SizedBox(height: 20),
                TextFormField(
                  keyboardType:TextInputType.phone, // le type de clavier
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
                  obscureText: true, // Utilisation de l'état pour contrôler la visibilité
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.lock),
                    labelText: 'Mot de passe',
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    ),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.visibility,),
                      onPressed: () {
                        setState(() {
                          voirmdp =!voirmdp; //la visibilité du mot de passe
                        });
                      },
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

                // Bouton  d'enregistrement 
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                   Navigator.push(context, MaterialPageRoute(builder: (context) => const Connexion()));

                  },
                  child: const Text('S\'enregistrer'),
                ),

                const SizedBox(height: 20),
                Row( 
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                  'Déjà inscrit ? Connectez-vous ',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                     Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Connexion(),
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
  }
