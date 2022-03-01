import 'package:flutter/material.dart';

class MovieWiki extends StatelessWidget {
  const MovieWiki({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movie Wiki"),
        backgroundColor: Colors.green[700],
        centerTitle: true,
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 200,
              )
            ],
          )
        )
      ),
    );
  }
}
