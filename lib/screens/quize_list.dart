import 'package:flutter/material.dart';

class QuizeList extends StatefulWidget {
  @override
  _QuizeListState createState() => _QuizeListState();
}
//
class _QuizeListState extends State<QuizeList> {
  List category = ["Romantic", "Horror","Thriller","Animation","Romantic","Action","Romantic","Horror"];
  List time = ["20min", "10min","20min","15min","20min", "10min","20min","15min"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Quize List",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: ListView.builder(
          itemCount: 10,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) => Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            child: Card(
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0.0),
              ),
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(horizontal: 3.0, vertical: 3.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children:<Widget> [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children:<Widget> [
                        SizedBox(width: 5.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:<Widget> [
                            Text(category[index], style: TextStyle(color: Colors.black, fontSize: 18.0, fontWeight: FontWeight.bold)),
                            Text(time[index], style: TextStyle(color: Colors.grey)),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      alignment: Alignment.center,
                      // padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                      width: 55.0,
                      height: 55.0,
                      margin: EdgeInsets.all(2),
                      color: Colors.blue,
                      child: Center(
                          child: Text.rich(
                            TextSpan(
                                text: "76pts",
                                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white )
                            ),
                          )
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
      ),

    );
  }
}
