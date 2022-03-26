import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashQuiceConfig extends StatefulWidget {
  const SplashQuiceConfig({Key? key}) : super(key: key);

  @override
  _SplashQuiceConfigState createState() => _SplashQuiceConfigState();
}

class _SplashQuiceConfigState extends State<SplashQuiceConfig> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        elevation: 0,
        toolbarHeight: 10,
      ),
      body: Container(
        color: Colors.black,
        child: Container(
          margin: EdgeInsets.only(top: 60.0),
          child: Column(
            children: [
              // Center(
                Lottie.asset("assets/images/cute-girl.json"),
                SizedBox(height: 80),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(90, 45),
                    textStyle: TextStyle(fontSize: 15),
                    primary: Colors.teal,
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10.0),
                    ),
                  ),
                  child: Text('START'),
                  onPressed: (){
                    // Navigator.push(
                        // context, MaterialPageRoute(builder: (context) => QuizeList()));
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
