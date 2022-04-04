import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ctse_assignment_1/models/user.dart';
import 'package:flutter/material.dart';

class UserCRUDModel extends ChangeNotifier {

  Future<dynamic> insertUserData(User? user) async {
    try {
      DocumentReference<Map<String, dynamic>> value =
      await FirebaseFirestore.instance.collection('User').add({
        'id': user?.id ?? '',
        'userName': user?.userName ?? '',
        'email': user?.email ?? '',
        'profileUrl': user?.profileUrl ?? '',
        'age': user?.age ?? '',
      });
      return true;
    } catch (e) {
      return false;
      print(e);
    }
  }

}
