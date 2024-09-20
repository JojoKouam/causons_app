
// ignore_for_file: file_names
import 'dart:developer';
import 'package:causons/services/userService.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {

  final UserService userSce = UserService();
  final _auth = FirebaseAuth.instance;
  final CollectionReference users = FirebaseFirestore.instance.collection('users');

  Future<User?> createUserWithEmailAndPassword(
      String email, String password, String name, String contacts) async {
    try {
      final credential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      final user = credential.user;
      if (user != null) {
        await userSce.saveUserData(name, email, contacts, user.uid);
      }
      return credential.user;
    } catch (e) {
      log("Une erreur est intervenue");
    }
  return null;
  }

  Future<User?> loginUserWithEmailAndPassword(String email, String password) async {
    try {
      final cred = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = cred.user;
      if (user != null) {
        // Enregistrement dans local storage
        final storageData = await SharedPreferences.getInstance();
        final isSaved = await storageData.setString("idUser", user.uid);
        if (isSaved) {
          log('User logged in and ID saved successfully: ${user.uid}');
        } else {
          log('Failed to save user ID');
        }
      }
      return user;
    } on FirebaseAuthException catch (e) {
      log('Error logging in: ${e.code} - ${e.message}');
    } catch (e) {
      log('An unexpected error occurred: $e');
    }
    return null;
  }

  Future<void> signout() async {
    try {
      await _auth.signOut();
    } catch (e) {
      log("Something went wrong");
    }
  }

}