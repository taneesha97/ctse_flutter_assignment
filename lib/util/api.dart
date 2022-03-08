import 'package:cloud_firestore/cloud_firestore.dart';

class Api {
  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance.collection('users').snapshots();
}