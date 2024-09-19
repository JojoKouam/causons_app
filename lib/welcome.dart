import 'package:causons/auth/connexion.dart';
import 'package:flutter/material.dart';
import 'auth/register.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Fond noir
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Centre les éléments verticalement
          crossAxisAlignment: CrossAxisAlignment.center, // Centre les éléments horizontalement
          children: <Widget>[
            const Spacer(), // Espacement supplémentaire
            
            // Image.asset('assets/images/causons_logo.png', width: 300),
            const SizedBox(height: 50),
            const Text(
              'Bienvenue sur Causons',
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                shadows: [
                  BoxShadow(
                    color: Colors.black38,
                    offset: Offset(0, 2),
                    blurRadius: 5,
                  ),
                ],
              ),
            ),
            const Spacer(),
            const SizedBox(height: 30), // Espacement supplémentaire
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.black, backgroundColor: const Color.fromARGB(255, 252, 171, 53), 
                padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                textStyle: const TextStyle(fontSize: 18, fontFamily: 'customFont'), // Police du bouton
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Connexion()),
                );
              },
              child: const Text('Se connecter'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.black,
                backgroundColor: const Color.fromARGB(132, 240, 240, 240),
                padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                textStyle: const TextStyle(fontSize: 18, fontFamily: 'customFont'), // Police du bouton
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Register()),
                );
              },
              child: const Text('S\'enregistrer'),
            ),
            const SizedBox(height: 20),
            
          ],
        ),
      ),
    );
  }
}
