import 'package:ctse_assignment_1/styles.dart';
import 'package:flutter/material.dart';

class LibraryForm extends StatefulWidget {
  const LibraryForm({Key? key}) : super(key: key);

  @override
  _LibraryFormState createState() => _LibraryFormState();
}

class _LibraryFormState extends State<LibraryForm> {
  final formKey = GlobalKey<FormState>();
  String name = "";

  @override
  Widget build(BuildContext context) {
    final double height= MediaQuery.of(context).size.height;
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Create a Library", style: Styles.textSectionHeader,),
                Text("Custom Libraries to Manage Favorite Movies", style: Styles.textSectionSubBody,),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: "Enter the Library Name"
                  ),
                  validator: (value){
                    if(value!.isEmpty || !RegExp(r'^[a-z]+$').hasMatch(value!)){
                      return "Please enter correct library name";
                    } else {
                      return null;
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
