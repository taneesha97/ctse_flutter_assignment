import 'package:flutter/material.dart';
import 'leader_board.dart';


class ScorePage extends StatelessWidget {
  const ScorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Score Page ",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height:100,
              width: 100,
              margin: EdgeInsets.all(1),
              // color: Colors.blue,
              child: Image.asset('images/award.png', fit: BoxFit.cover),
            ),
            SizedBox(height: 20),
            Container(
              height:200,
              width: 300,
              color: Colors.black12,
              child: Center(
                  child: Text.rich(
                    TextSpan(
                        text: "Congratulations",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, )
                    ),
                  )
              ),
            ),
            SizedBox(height: 20),
            Container(
              height:100,
              width: 400,
              // color: Colors.black12,
              child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(100, 40),
                            textStyle: TextStyle(fontSize: 15),
                            primary: Colors.blueGrey,
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(10.0),
                            ),
                          ),
                          child: Text('Retry'),
                          onPressed: (){

                          }),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(100, 40),
                            textStyle: TextStyle(fontSize: 15),
                            primary: Colors.blue,
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(10.0),
                            ),
                          ),
                          child: Text('OK'),
                          onPressed: (){
                            Navigator.push(
                                context, MaterialPageRoute(builder: (context) => LeaderBoard()));
                          }),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(100, 40),
                            textStyle: TextStyle(fontSize: 15),
                            primary: Colors.pink,
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(10.0),
                            ),
                          ),
                          child: Text('Delete'),
                          onPressed: (){

                          })
                    ],

                  )
              ),
            )
          ],
        ),
      ),

    );
  }
}
