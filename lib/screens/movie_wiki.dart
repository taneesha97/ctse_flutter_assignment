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
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 200,
            child: ListView.builder(
                itemCount: 10,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Container(
                      height: 150,
                      width: 150,
                      margin: const EdgeInsets.all(10),
                      child: Center(
                        child: Text("Card $index",
                            style: const TextStyle(color: Colors.white)),
                      ),
                      color: Colors.green[700],
                    )),
          ),
          Flexible(
            child: ListView.builder(
              itemCount: 15,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) => ListTile(
                title: Text("List $index"),
              ),
            ),
          )
        ],
      ))),
    );
  }
}
