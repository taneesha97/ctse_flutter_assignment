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
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: height*0.4),
              Text("Create a Library", style: Styles.textSectionHeader,),
              Text("Custom Libraries to Manage Favorite Movies", style: Styles.textSectionSubBody,),

            ],
          ),
        ),
      ),
    );
  }
}
