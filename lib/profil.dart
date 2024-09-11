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
              backgroundImage: NetworkImage("https://media.licdn.com/dms/image/v2/C4E03AQGiQOIX41Ia9A/profile-displayphoto-shrink_100_100/profile-displayphoto-shrink_100_100/0/1645444749981?e=1731542400&v=beta&t=eMH5bhx_dOuSA_uGX8K0FskOWxhakjBIVA06XC2_AlI"),
              //backgroundColor: Color(0xFFfcab35),
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
