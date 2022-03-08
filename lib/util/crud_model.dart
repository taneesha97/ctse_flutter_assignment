import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class CrudModel extends ChangeNotifier{

  late FirebaseFirestore firestore;
  String testingValue = "Testing Value";
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  init(){
    firestore = FirebaseFirestore.instance;
  }

  Widget? sendTextTesting(){
    FutureBuilder<DocumentSnapshot>(
      future: users.doc("1").get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {

        if (snapshot.hasError) {
          print("Error");
          return Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          print("Error");
          return Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
          print("OK");
          return Text("Full Name: ${data['full_name']} ${data['last_name']}");
        }

        print("Loading");
        return Text("loading");
      },
    );
  }



}