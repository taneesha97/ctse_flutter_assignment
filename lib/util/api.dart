import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class Api {
  final String path;
  CollectionReference? ref;
  late FirebaseFirestore firestore;

  Api(this.path){
    ref = firestore.collection(path);
  }

   Future<QuerySnapshot>?getDataCollection()  {
     return ref?.get();
  }
}
