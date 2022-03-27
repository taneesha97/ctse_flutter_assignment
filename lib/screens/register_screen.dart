import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

import '../styles.dart';

class RegisterScreen extends StatefulWidget {

  String userName, password;
  RegisterScreen({Key? key, required this.userName, required this.password})
      : super(key: key);

  @override
  _RegisterScreen createState() => _RegisterScreen();
}

class _RegisterScreen  extends State<RegisterScreen>{

  final formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String? uname;
  String? password;
  final String _regxPattern = r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
  int initialValue = 1;
  var itemList = new List<int>.generate(100, (i) => i + 1);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xff0DD6E3),
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
        backgroundColor: Colors.teal,
        elevation: 0,
        toolbarHeight: 10,
        ),
        body: Padding(
          padding: EdgeInsets.all(0),
            child: Container(
              height: 500,
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    Container(
                      color:  Color(0xff0DD6E3),
                      height: 350,
                      // decoration: BoxDecoration(
                      //   borderRadius: BorderRadius.vertical(top: Radius.zero, bottom: Radius.zero),
                      // ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 30,
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 0, horizontal: 25),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: Container(
                                    // decoration: const BoxDecoration(
                                    //   borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                    // ),
                                    color: Color(0xffffffff),
                                    child: FlutterLogo(
                                      size: 60,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Welcome Movie Quiz',
                                        style: Styles.mainWelcomeText,

                                      ),
                                      Text(
                                        'Welcome Movie Quize',
                                        style: Styles.subWelcomeText,)
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Center(
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 0, vertical: 5),
                              width: 300,
                              height: 50,
                              child: TextFormField(
                                initialValue:'',
                                onChanged: (val) => setState(() => uname = val),
                                decoration: const InputDecoration(
                                  labelText: "Enter Username",
                                  filled: true,
                                  fillColor: Color(0xffffffff),
                                  border:  InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                          Center(
                            child: Container(
                                width: 300,
                                height: 50,
                                decoration: BoxDecoration(
                                // border: Border.all(color: Colors.black, width: 4),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              child: Material(
                                borderRadius: BorderRadius.circular(12),
                                child:TextFormField(
                                  decoration: const InputDecoration(
                                    labelText: "Enter Email Address",
                                    filled: true,
                                    fillColor: Color(0xffffffff),
                                    border:  InputBorder.none,
                                  ),
                                  initialValue:'',
                                  onChanged: (val) => setState(() => uname = val),
                                  validator: (value) {
                                    if (value!.isEmpty ||
                                        !RegExp(_regxPattern).hasMatch(value!)) {
                                      return "Please enter correct Email Address";
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                              )
                            ),
                          ),
                          Center(
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 0, vertical: 5),
                              padding: EdgeInsets.symmetric(horizontal: 14,vertical: 1),
                              width: 300, // Adjust Input Field Width.
                                decoration: BoxDecoration(
                                  // border: Border.all(color: Colors.black, width: 4),
                                  borderRadius: BorderRadius.circular(12),
                                  color: const Color(0xffffffff)
                                ),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton(
                                isExpanded: true,
                                iconSize: 36,
                                icon: Icon(Icons.arrow_drop_down_circle_outlined, color: Color(0xff0DD6E3)),
                                borderRadius: BorderRadius.circular(12),
                                dropdownColor: const Color(0xffffffff),
                                items: itemList.map((itemName) {
                                  return DropdownMenuItem(
                                    value: itemName,
                                      child: Text(itemName.toString())
                                  );
                                }).toList(),
                                onChanged: (int? newValue) {
                                  setState(() {
                                    initialValue = newValue!;
                                  });
                                },
                                value: initialValue,
                              )
                              )
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                    Center(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 25),
                            primary: Styles.primaryThemeColor,
                            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5)),

                        onPressed: () {},
                        child: const Text('Start'),
                      ),
                    ),
                  ],

                ),
              ),

          )
        )
    );
  }

}