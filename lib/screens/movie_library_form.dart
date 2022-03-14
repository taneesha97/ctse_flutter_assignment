import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ctse_assignment_1/styles.dart';
import 'package:flutter/material.dart';

class LibraryForm extends StatefulWidget {
  CollectionReference libraries = FirebaseFirestore.instance.collection('libraries');
  LibraryForm({Key? key}) : super(key: key);

  @override
  _LibraryFormState createState() => _LibraryFormState();
}

class _LibraryFormState extends State<LibraryForm> {

  final formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String library_name = "default";

  Future<void> CreateLibrary() {
    return widget.libraries.add({
          "library_name": "libraryName",
        })
        .then((value) => print("Library Added"))
        .catchError((error) => print("Failed to create the Library"));
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        elevation: 0,
        toolbarHeight: 10,
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Container(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Create a Library",
                  style: Styles.textSectionHeader,
                ),
                Text(
                  "Custom Libraries to Manage Favorite Movies",
                  style: Styles.textSectionSubBody,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  onSaved: (value){
                    library_name=value!;
                    },
                  decoration: const InputDecoration(
                      labelText: "Enter the Library Name"),
                  validator: (value) {
                    if (value!.isEmpty ||
                        !RegExp(r'^[a-z]+$').hasMatch(value!)) {
                      return "Please enter correct library name";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: 60,
                ),
                Center(
                  child: ElevatedButton(
                      onPressed: CreateLibrary,
                      child: Text(
                        "Add to the Library",
                        style: Styles.navBarTitle,
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
