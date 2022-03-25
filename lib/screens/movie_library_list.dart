import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/movie/validation_pop.dart';
import '../models/library_model.dart';
import '../styles.dart';
import '../util/crud_model.dart';
import 'movie_library_form.dart';
import 'movie_library_home.dart';

class LibraryList extends StatelessWidget {
  const LibraryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Stream<List<Library>> libraries =
        Provider
            .of<CrudModel>(context, listen: false)
            .getListOfLibraries;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          elevation: 0,
          toolbarHeight: 10,
        ),
        body: Padding(
          padding: const EdgeInsets.only(
            top: 10,
            left: 10,
            right: 10,
          ),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        right: 10,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "All Libraries",
                            style: Styles.textSectionHeader,
                          ),
                          Text(
                            "Custom Libraries to Manage Favorite Movies",
                            style: Styles.textSectionSubBody,
                          ),
                        ],
                      ),
                    ),
                    FloatingActionButton.small(onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LibraryForm(functionValue: 0,
                              libraryId: '-',
                              libraryName: "-",)),
                      );
                    },
                      child: const Icon(Icons.add),
                      backgroundColor: Colors.teal,),
                  ],
                ),

                const SizedBox(
                  height: 10,
                ),
                Flexible(
                  flex: 9,
                  child: SafeArea(
                    child: StreamBuilder<List<Library>>(
                        stream: libraries,
                        builder: (context, snapshot) {
                          if (snapshot.hasError) {
                            return Text("Error");
                          } else if (snapshot.hasData) {
                            final libraries = snapshot.data!;
                            return ListView(
                              children: libraries
                                  .map((e) => buildLibrary(e, context))
                                  .toList(),
                            );
                          } else {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        }),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  Widget buildLibrary(Library library, BuildContext context) {

      // Assign Colors to the Library (Null Safety).
      String colorString;
      if (library.color == ""){
        colorString = 4280391411.toString();
      } else {
        colorString = library.color;
      }
      int colorInteger = int.parse(colorString);
      Color newColor = Color(colorInteger);


       return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    LibraryHome(
                      libraryId: library.id.toString(),
                      libraryName: library.name,
                    )),
          );
        },
        child: Card(
          elevation: 6,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
          ),
          child: ListTile(
              leading:  CircleAvatar(
                backgroundColor: newColor,
              ), // Add color here.
              title: Text(library.name, style: Styles.smallCardHeader,),
              trailing: Wrap(
                spacing: 12,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                LibraryForm(
                                  libraryId: library.id,
                                  functionValue: 1,
                                  libraryName: library.name,
                                )),
                      );
                    },
                    child: Icon(
                      Icons.edit,
                      color: Colors.grey,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      showAltertDialog(context, () {
                        Provider.of<CrudModel>(context, listen: false)
                            .deleteLibrary(library.id);
                        Navigator.pop(context);
                      }, () {
                        Navigator.pop(context);
                      },
                          "Do you want to delete library including all the movies in it?");
                    },
                    child: Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                  ),
                ],
              )),
        ),
      );
}
}
