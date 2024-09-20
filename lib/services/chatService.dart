// ignore_for_file: file_names, unnecessary_cast

import 'package:cloud_firestore/cloud_firestore.dart';

class ChatService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final CollectionReference conversation = FirebaseFirestore.instance.collection('conversation');

  Stream<List<Map<String, dynamic>>> getUserStream() {
    return _firestore.collection('users').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        final user = doc.data() as Map<String, dynamic>;
        return user;
      }).toList();
    });
  }


  Future<DocumentSnapshot?> getExistingChat(String expediteur, String destinataire) async {

    final querySnapshot = await FirebaseFirestore.instance
        .collection('conversation')
        .where('participants', arrayContainsAny: [expediteur, destinataire])
        .get();

    for (var doc in querySnapshot.docs) {
      final participants = doc['participants'] as List?;
      if (participants != null &&
          participants.contains(expediteur) &&
          participants.contains(destinataire)) {
        return doc;
      }
    }

    return null;
  }


  Future<String> createNewChat(String expediteur, String destinataire) async {
    final chatDoc = await _firestore.collection('conversation').add({
      'participants': [expediteur, destinataire],
      'createdAt': Timestamp.now(),
    });
    return chatDoc.id;
  }
}
