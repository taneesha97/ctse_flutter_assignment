import 'package:flutter/material.dart';

import 'live_view_page.dart';

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
        appBar: AppBar(
            title: Text("Page 2"),
            actions:<Widget>[
              IconButton(icon: Icon(Icons.ac_unit), onPressed: (){
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (BuildContext context) =>
                        new Page2()));

              })
            ]
        ),
        body: Align(
            alignment: Alignment.center,
            child: FlatButton(color: Colors.blue, textColor: Colors.white, onPressed: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) =>
                      new ListViewPage()));
            }, child: Text("Switch Page - Leave a Like")))
    ));
  }
}

