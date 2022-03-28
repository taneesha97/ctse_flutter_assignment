import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../styles.dart';

class MovieErrorPage extends StatelessWidget {
  const MovieErrorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        elevation: 0,
        toolbarHeight: 10,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                  borderRadius: new BorderRadius.only(
                    topLeft: const Radius.circular(10.0),
                    topRight: const Radius.circular(10.0),
                  ),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage("https://www.pngall.com/wp-content/uploads/8/Warning-PNG-Picture.png"),
                  )
              ),
            ),

            Text("Something is wrong!", style: Styles.smallCardHeader),
          ],
        ),
      ),
    );
  }
}
