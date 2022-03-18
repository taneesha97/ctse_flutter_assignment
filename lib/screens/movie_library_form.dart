import 'package:ctse_assignment_1/components/movie/status_tag.dart';
import 'package:ctse_assignment_1/styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/library_model.dart';
import '../util/crud_model.dart';
import 'movie_library_list.dart';

class LibraryForm extends StatefulWidget {
  final int functionValue;
  final String libraryId;
  final String libraryName;
  LibraryForm({Key? key, required this.functionValue, required this.libraryId, required this.libraryName}) : super(key: key);

  @override
  _LibraryFormState createState() => _LibraryFormState();
}

class _LibraryFormState extends State<LibraryForm> {
  final formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String? lname;

  @override
  Widget build(BuildContext context) {
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
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
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
                        ],
                      ),
                      MoviesStatusTag(
                          status: widget.functionValue==0?"Inserting":"Updating",
                          color: widget.functionValue==0?Colors.green:Colors.deepOrange),
                    ],
                  ),
                ),

                TextFormField(
                  initialValue: widget.functionValue==0?"":widget.libraryName,
                  onChanged: (val) => setState(() => lname = val),
                  decoration: const InputDecoration(
                      labelText: "Enter the Library Name",
                  fillColor: Colors.teal),
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
                      onPressed: (){
                        if (formKey.currentState!.validate()){

                          // Update and Inserting Logic Separation.
                          if(widget.functionValue == 0){
                            // Create the Library Model.
                            final library = Library(
                              name: lname.toString(),
                              optional: "optional",
                              id: 'default-id',
                            );

                            // Call the DB method to write to the database.
                            Provider.of<CrudModel>(context, listen: false).addLibraries(library);
                          } else {
                            print("Updating Item - PROTO");
                            print(widget.libraryId);
                          }
                        }
                      },
                      style: ElevatedButton.styleFrom(primary: Colors.teal),
                      child: Text(
                        "Add to the Library",
                        style: Styles.navBarTitle,
                      )),
                ),

                Center(
                  child: ElevatedButton(
                      onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>  LibraryList()),
                        );
                      },
                      style: ElevatedButton.styleFrom(primary: Colors.teal),
                      child: Text(
                        "See All Libraries",
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
