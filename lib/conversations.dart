import 'package:flutter/material.dart';

class ConversationPage extends StatelessWidget {
  const ConversationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Conversation'),
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              // Les nouveaux messages apparaissent en bas
              reverse: true,
              // Fin utilité de reverse
              padding: const EdgeInsets.all(10.0),
              children: <Widget>[
                _buildMessage('Salut, comment ça va ?', true),
                _buildMessage('Je vais bien, merci ! Et toi ?', false),
                _buildMessage('Pas mal, juste un peu occupé.', true),
                _buildMessage('Ah je comprends. Tu travailles sur quoi en ce moment ?', false),
              ],
            ),
          ),
          const Divider(height: 1.0),
          _buildTextComposer(),
        ],
      ),
    );
  }

  Widget _buildMessage(String message, bool isMe) {
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        padding: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: isMe ? Colors.black38 : Color(0xFFfcab35),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
            bottomLeft: isMe ? Radius.circular(20.0) : Radius.zero,
            bottomRight: isMe ? Radius.zero : Radius.circular(20.0),
          ),
        ),
        child: Text(
          message,
          style: const TextStyle(color: Colors.white, fontSize: 16.0),
        ),
      ),
    );
  }

  // Widget ou component de la zone de saisie et d'envoie de massahe
  Widget _buildTextComposer() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              decoration: const InputDecoration.collapsed(
                hintText: "Écrire un message...",
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send),
            color: Colors.blueAccent,
            onPressed: () {
              // Logic pour envoyer un message
            },
          ),
        ],
      ),
    );
  }
}
