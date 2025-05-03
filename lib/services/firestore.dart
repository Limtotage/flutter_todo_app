import 'package:cloud_firestore/cloud_firestore.dart';
import "package:firebase_auth/firebase_auth.dart";

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> saveTodo(
      {required String title,
      required String description,
      required String type}) async {
    final user = _auth.currentUser;
    if (user == null) {
      throw Exception("Invalid User");
    }
    await _db.collection('Todos').add({
      'userId': user.uid,
      'title': title,
      'description': description,
      'completed': false,
      'iconType': type,
      'createdAt': FieldValue.serverTimestamp(),
    });
  }

  Stream<QuerySnapshot> getUserCompletedTodos() {
    final user = _auth.currentUser;
    return FirebaseFirestore.instance
        .collection('Todos')
        .where('userId', isEqualTo: user!.uid)
        .where("completed", isEqualTo: true)
        .orderBy('createdAt', descending: true)
        .snapshots();
  }

  Stream<QuerySnapshot> getUserUnCompletedTodos() {
    final user = _auth.currentUser;
    return FirebaseFirestore.instance
        .collection('Todos')
        .where('userId', isEqualTo: user!.uid)
        .where("completed", isEqualTo: false)
        .orderBy('createdAt', descending: true)
        .snapshots();
  }

  Future<void> updateTodo({
    required String docID,
    required bool newValue,
  }) async {
    await FirebaseFirestore.instance
        .collection('Todos')
        .doc(docID)
        .update({'completed': newValue});
  }

  Future<void> deleteTodo({
    required String docID,
  }) async {
    await FirebaseFirestore.instance.collection('Todos').doc(docID).delete();
  }
}
