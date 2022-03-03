import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IndexPage extends StatelessWidget {
  const IndexPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.red, // background
                onPrimary: Colors.white,
                padding: const EdgeInsets.all(20.0),
                fixedSize: const Size(640, 70),
                // foreground
              ),
              onPressed: () { },
              child: Text('Movie Wiki Page', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
            ),
            SizedBox(
              height: 15,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.teal, // background
                onPrimary: Colors.white,
                padding: const EdgeInsets.all(20.0),
                fixedSize: const Size(640, 70),
                // foreground
              ),
              onPressed: () { },
              child: Text('Single Movie Page', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
            ),
            SizedBox(
              height: 15,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.teal, // background
                onPrimary: Colors.white,
                padding: const EdgeInsets.all(20.0),
                fixedSize: const Size(640, 70),
                // foreground
              ),
              onPressed: () { },
              child: Text('Movie Wiki Page', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
            ),
            SizedBox(
              height: 15,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.red, // background
                onPrimary: Colors.white,
                padding: const EdgeInsets.all(20.0),
                fixedSize: const Size(640, 70),
                // foreground
              ),
              onPressed: () { },
              child: Text('Movie Wiki Page', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
            ),
            SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}
