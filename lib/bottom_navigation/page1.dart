import 'package:flutter/material.dart';

import 'live_view_page.dart';

class Page1 extends StatefulWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1>  with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
        appBar: AppBar(
            title: Text("Page 1"),
            actions:<Widget>[
              IconButton(icon: Icon(Icons.ac_unit), onPressed: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                        new ListViewPage()));

              })
            ]
        ),
        body: Align(
            alignment: Alignment.center,
            child: FlatButton(color: Colors.blue, textColor: Colors.white, onPressed: (){
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (BuildContext context) =>
                      new ListViewPage()));
            }, child: Text("Switch Page - Subscribe")))
    ));
  }

  @override
  bool get wantKeepAlive => true;
}

