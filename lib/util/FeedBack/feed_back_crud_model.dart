

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FeedBackCrudModel extends ChangeNotifier {


  Future<dynamic> insertFeedBack(String? value1, String? value2) async {
    try {
      DocumentReference<Map<String, dynamic>> value =
      await FirebaseFirestore.instance.collection('Feedback').add({
        'expression': value1 ?? '',
        'Comment': value2 ?? '',
      });
      return value.id.toString();
    } catch (e) {
      print(e);
    }
  }

}
