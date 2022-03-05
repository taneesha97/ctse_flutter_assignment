import 'package:flutter/material.dart';

class IndexPage extends StatelessWidget {
  const IndexPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow,
      child: SingleChildScrollView(
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
                onPressed: () {
                  Navigator.of(context).pushNamed('/movieWiki');
                },
                child: Text(
                  'Movie Wiki Page',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
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
                onPressed: () {},
                child: Text(
                  'Single Movie Page',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
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
                onPressed: () {
                  Navigator.of(context).pushNamed('/quizScreen');
                },
                child: Text(
                  'Quiz Screen',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
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
                onPressed: () {},
                child: Text(
                  'Movie Wiki Page',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
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
                onPressed: () {
                  Navigator.of(context).pushNamed('/samplescreen');
                },
                child: Text(
                  'Sample Page',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
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
                onPressed: () {
                  Navigator.of(context).pushNamed('/filescreen');
                },
                child: Text(
                  'File scrren',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
