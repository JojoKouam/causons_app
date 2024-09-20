// ignore_for_file: file_names

import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserService {
  final _auth = FirebaseAuth.instance;
  final CollectionReference users = FirebaseFirestore.instance.collection(
      'users');

  Future<void> saveUserData(String name, String email, String numero, userId) {
    return users.doc(userId).set({
      'userId': userId,
      'name': name,
      'email': email,
      'contacts': numero,
      'timestamp': Timestamp.now(),
    }).then((value) async {
      log('User connected');
    }).catchError((error) {
      log("Failed to add user: $error");
    });
  }

  Future<Map<String, dynamic>?> getConnectedUserData() async {
    try {
      // Recuperation des informations de l'utilisateur connecté
      final userConnected = _auth.currentUser;
      if (userConnected != null) {
        final userDoc = await users.doc(userConnected.uid).get();
        if (userDoc.exists) {
          final userData = userDoc.data() as Map<String, dynamic>;
          return userData;
        }
        else {
          log('User document does not exist in Firestore');
        }
      }
      else {
        log('No user is currently signed in');
      }
    } catch (e) {
      log('$e');
    }
    return null;
  }

}