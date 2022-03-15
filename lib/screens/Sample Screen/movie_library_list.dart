import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../styles.dart';

class LibraryList extends StatelessWidget {
  const LibraryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        elevation: 0,
        toolbarHeight: 10,
      ),
      body: Padding(
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
                  "Create a Library",
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
                    child: ListView.builder(
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text("Sample"),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
        ),
      )
    );
  }
}
