import 'package:causons/conversations.dart';
import 'package:flutter/material.dart';


class MessagesPage extends StatelessWidget {
  const MessagesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          // Barre de recherche
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(25.0),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.search, color: Colors.white),
                  hintText: 'Rechercher des conversations...',
                  hintStyle: TextStyle(color: Colors.white70),
                  contentPadding: EdgeInsets.all(15.0),
                ),
              ),
            ),
          ),
          // Liste des conversations
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(8.0),
              children: <Widget>[
                _buildConversationCard(
                    context,
                    'Pogban Hervé',
                    'Hello world',
                    '2:30 AM',
                    'https://media.licdn.com/dms/image/v2/D4E35AQFzUTln6vc0_Q/profile-framedphoto-shrink_100_100/profile-framedphoto-shrink_100_100/0/1720979167835?e=1726664400&v=beta&t=KO3tXCEk_jzoNQjQUrXX9hgi5SBiuBFWyD0MF4aAdgU'
                ),
                _buildConversationCard(
                    context,
                    'Emmanuel Oulaï',
                    'Bonjour bro',
                    '7:30 PM',
                    'https://media.licdn.com/dms/image/v2/C4E03AQGiQOIX41Ia9A/profile-displayphoto-shrink_100_100/profile-displayphoto-shrink_100_100/0/1645444749981?e=1731542400&v=beta&t=eMH5bhx_dOuSA_uGX8K0FskOWxhakjBIVA06XC2_AlI'
                ),
                // Ajoute plus de cartes de conversation ici si nécessaire
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:() {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildConversationCard(BuildContext context, String name, String lastMessage, String time, String avatarUrl) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          backgroundImage: NetworkImage(avatarUrl),
        ),
        title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(lastMessage, overflow: TextOverflow.ellipsis),
        trailing: Text(time, style: const TextStyle(color: Colors.grey)),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ConversationPage(),
            ),
          );
        },
      ),
    );
  }
}
