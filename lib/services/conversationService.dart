import 'package:cloud_firestore/cloud_firestore.dart';

class ConversationService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final CollectionReference conversation = FirebaseFirestore.instance.collection('conversation');


}