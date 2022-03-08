import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LeaderBoard extends StatefulWidget {
  @override
  _LeaderBoardState createState() => _LeaderBoardState();
}

class _LeaderBoardState extends State<LeaderBoard> {

  List names = ["Bright vachirawit", "Bright vachirawit","Bright vachirawit","Bright vachirawit","Bright vachirawit","Bright vachirawit","Bright vachirawit","Bright vachirawit","Bright vachirawit"];
  List place = ["1st place", "1st place","1st place","1st place","1st place","1st place","1st place","1st place","1st place"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Leader Board ",
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
                // padding: EdgeInsets.only()
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children:<Widget> [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children:<Widget> [
                        Container(
                          height: 60.0,
                          width: 5.0,
                          color: Colors.pink,
                          // margin: EdgeInsets.only(right: 0, left: 0),
                        ),
                        SizedBox(width: 5.0),
                        Container(
                          width: 55.0,
                          height: 55.0,
                          // color: Colors.green,
                          child: CircleAvatar(
                            backgroundColor: Colors.green,
                            foregroundColor: Colors.green,
                            // backgroundImage: AssetImage("images/woman.png"),
                            backgroundImage: NetworkImage
                              ("https://images.unsplash.com/photo-1457449940276-e8deed18bfff?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80"),
                          ),
                        ),
                        SizedBox(width: 5.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:<Widget> [
                            Text(names[index], style: TextStyle(color: Colors.black, fontSize: 18.0, fontWeight: FontWeight.bold)),
                            Text(place[index], style: TextStyle(color: Colors.grey)),
                          ],
                        ),
                      ],
                    ),

                        Container(
                        margin: EdgeInsets.only(left: 120.0),
                        // color: Colors.pink,
                            child: Row(
                              children: [
                                  Ink(
                                    decoration: ShapeDecoration(
                                    shape: CircleBorder(), color: Colors.white),
                              child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                  Icons.delete,
                                  color: Colors.black,
                                  size: 20,
                  )),
                 ),
               ]
            )
          ),
                    Container(
                      alignment: Alignment.center,
                      // padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                      width: 55.0,
                      height: 60.0,
                      // margin: EdgeInsets.all(2),
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
