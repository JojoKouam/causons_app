import 'dart:developer';

import 'package:causons/conversations.dart';
import 'package:causons/messages/newMessage.dart';
import 'package:causons/services/authService.dart';
import 'package:causons/services/chatService.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ContactlistPage extends StatelessWidget {
  ContactlistPage({super.key});

  final _auth = FirebaseAuth.instance;
  final AuthService _authSce = AuthService();
  final ChatService _chatSce = ChatService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nouveau message'),
      ),
      body: _buildUserList(),
    );
  }

  Widget _buildUserList() {
    return StreamBuilder<List<Map<String, dynamic>>>(
      stream: _chatSce.getUserStream(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Center(child: Text('Erreur'));
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(
            child: Text('Aucun utilisateur trouvé'),
          );
        }

        final sortedUsers = snapshot.data!..sort((a, b) {
          final nameA = a['name']?.toLowerCase() ?? '';
          final nameB = b['name']?.toLowerCase() ?? '';
          return nameA.compareTo(nameB);
        });

        return ListView(
          children: sortedUsers.map<Widget>((userData) {
            return _buildUserListItem(userData, context);
          }).toList(),
        );
      },
    );
  }

  // Fonction pour construire chaque item utilisateur
  Widget _buildUserListItem(Map<String, dynamic> userData, BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(userData['profilePictureUrl'] ?? 'https://placehold.co/400x600'),
      ),
      title: Text(userData['name'] ?? 'Utilisateur'),
      subtitle: Text(userData['contacts'] != null ? '+225 ' + userData['contacts'] : 'Contacts non disponible'),
      onTap: () async {
        final currentUserId = _auth.currentUser!.uid;
        final selectedUserId = userData['userId'];

        final chatExistant = await _chatSce.getExistingChat(currentUserId, selectedUserId);
        log('Chat Existant: ${chatExistant?.id}');
        log('$selectedUserId');

        if (chatExistant != null) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ConversationPage(chatId: chatExistant.id),
            ),
          );
        }
        else {
          final newChatId = await _chatSce.createNewChat(currentUserId, selectedUserId);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ConversationPage(chatId: newChatId),
            ),
          );
        }
      },
    );
  }
}
