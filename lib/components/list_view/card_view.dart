import 'package:flutter/material.dart';

import '../../screens/quice_configuration_splash.dart';

class CardView1 extends StatelessWidget {

  final int index;
  final String text1, text2;
  const CardView1({
    Key? key,
    required this.index,
    required this.text1,
    required this.text2,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return
      Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(horizontal: 2.0, vertical: 1.0),
        child: Card(
          elevation: 5.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6.0),
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
                        Text(text1, style: TextStyle(color: Colors.black, fontSize: 18.0, fontWeight: FontWeight.bold)),
                        Text(text2, style: TextStyle(color: Colors.grey)),
                      ],
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.all(1),
                  child: Row(
                    children: [
                      Ink(
                        decoration: ShapeDecoration(
                            shape: CircleBorder(), color: Colors.blue),
                        child: IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context, MaterialPageRoute(builder: (context) => SplashQuiceConfig()));
                            },
                            icon: Icon(
                              Icons.start,
                              color: Colors.white,
                              size: 15,
                            )),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Ink(
                        decoration: ShapeDecoration(
                            shape: CircleBorder(), color: Colors.green),
                        child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.edit,
                              color: Colors.white,
                              size: 15,
                            )),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Ink(
                        decoration: ShapeDecoration(
                            shape: CircleBorder(), color: Colors.red),
                        child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.delete,
                              color: Colors.white,
                              size: 15,
                            )),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
  }
}

