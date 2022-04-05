import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/user.dart';
import '../util/User/UserCRUDModel.dart';
import '../util/userAuth/userauthentication.dart';

class EditUserForm extends StatefulWidget {
  const EditUserForm({Key? key}) : super(key: key);

  @override
  State<EditUserForm> createState() => _EditUserFormState();
}

class _EditUserFormState extends State<EditUserForm> {


  TextEditingController? myController1, myController2,myController3,myController4;
  String? text1, text2, text3, text4;
  List<Users> docs = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Stream<User?> val = Provider.of<UserAuthentication>(context, listen: false)
        .authStateChanges;
    val.listen((event) {
      setState(() {
        Provider.of<UserCRUDModel>(context, listen: false)
            .getLoginUser(event!.uid.toString())
            .then((value) => {
          //print(value),
          print('user ud $value'),
          setState(() {
            docs = value;
            myController1 = TextEditingController()..text = docs[0].userName;
            myController2 = TextEditingController()..text = docs[0].email;
            myController3 = TextEditingController()..text = 'ppp';
            myController4 = TextEditingController()..text = docs[0].age;
          }),
        });
      });
    });


  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(150),
          child: AppBar(
            centerTitle: true,
            flexibleSpace: ClipRRect(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(30),
                  bottomLeft: Radius.circular(30)),
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage("assets/images/p4.jpg"),
                  fit: BoxFit.fill,
                )),
              ),
            ),
            title: Text(
              "Edit User Details",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
            ),
            backgroundColor: Colors.pink,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(50),
                    bottomLeft: Radius.circular(50))),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
            child: SafeArea(
              child: Column(
                children: [
                  Container(
                      child: Column(children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Center(
                        child: Container(
                          margin:
                              EdgeInsets.symmetric(horizontal: 0, vertical: 2),
                          width: 300,
                          height: 50,
                          child: TextField(
                            controller: myController1,
                            onChanged: (val) => setState(() => text1 = val),
                            decoration: InputDecoration(
                              labelText: "Enter Username",
                              filled: true,
                              fillColor: Color(0xffffffff),
                              border: OutlineInputBorder(
                                borderSide: new BorderSide(color: Colors.red),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.only(bottom: 8.0),
                    //   child: Center(
                    //     child: Container(
                    //       margin:
                    //           EdgeInsets.symmetric(horizontal: 0, vertical: 2),
                    //       width: 300,
                    //       height: 50,
                    //       child: TextField(
                    //         controller: myController2,
                    //         //onChanged: (val) => setState(() => uname = val),
                    //         decoration: InputDecoration(
                    //           labelText: "Enter Password",
                    //           filled: true,
                    //           fillColor: Color(0xffffffff),
                    //           border: OutlineInputBorder(
                    //             borderSide: new BorderSide(color: Colors.red),
                    //             borderRadius: BorderRadius.circular(10.0),
                    //           ),
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Center(
                        child: Container(
                          margin:
                              EdgeInsets.symmetric(horizontal: 0, vertical: 2),
                          width: 300,
                          height: 50,
                          child: TextField(
                            controller: myController2,
                            onChanged: (val) => setState(() => text2 = val),
                            decoration: InputDecoration(
                              labelText: "Enter Email",
                              filled: true,
                              fillColor: Color(0xffffffff),
                              border: OutlineInputBorder(
                                borderSide: new BorderSide(color: Colors.red),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Center(
                            child: Container(
                              margin:
                              EdgeInsets.symmetric(horizontal: 0, vertical: 2),
                              width: 300,
                              height: 50,
                              child: TextField(
                                controller: myController4,
                                onChanged: (val) => setState(() => text3 = val),
                                decoration: InputDecoration(
                                  labelText: "Enter Age",
                                  filled: true,
                                  fillColor: Color(0xffffffff),
                                  border: OutlineInputBorder(
                                    borderSide: new BorderSide(color: Colors.red),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      minimumSize: Size(100, 40),
                                      textStyle: TextStyle(fontSize: 15),
                                      primary: Colors.blueGrey,
                                      shape: new RoundedRectangleBorder(
                                        borderRadius:
                                        new BorderRadius.circular(10.0),
                                      ),
                                    ),
                                    child: Text('Submit'),
                                    onPressed: (){}),
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      minimumSize: Size(100, 40),
                                      textStyle: TextStyle(fontSize: 15),
                                      primary: Colors.blueGrey,
                                      shape: new RoundedRectangleBorder(
                                        borderRadius:
                                        new BorderRadius.circular(10.0),
                                      ),
                                    ),
                                    child: Text('Cancel'),
                                    onPressed: (){}),
                              ],
                            )),
                  ]))
                ],
              ),
            ),
          ),
        ));
  }
}
