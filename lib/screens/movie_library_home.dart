import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/movie.dart';
import '../styles.dart';

class LibraryHome extends StatefulWidget {
  final String name;
  final Stream<List<Movie>> movies;
  const LibraryHome({Key? key, required this.name, required this.movies}) : super(key: key);

  @override
  State<LibraryHome> createState() => _LibraryHomeState();
}

class _LibraryHomeState extends State<LibraryHome> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        child:
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            Text(
              "All Libraries",
              style: Styles.textSectionHeader,
            ),
            Text(
              "Custom Libraries to Manage Favorite Movies",
              style: Styles.textSectionSubBody,
            ),
            const SizedBox(
              height: 10,
            ),
            Flexible(
              flex: 9,
              child: SafeArea(
                child: StreamBuilder<List<Movie>>(
                    stream: widget.movies,
                    builder: (context, snapshot) {
                      if(snapshot.hasError){
                        return Text("Error");
                      } else if(snapshot.hasData){
                        final libraries = snapshot.data!;
                        return ListView(

                        );
                      } else {
                        return Center(child: CircularProgressIndicator(),);
                      }
                    }
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
