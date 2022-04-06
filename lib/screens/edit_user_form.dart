import 'package:ctse_assignment_1/screens/profile_ui.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

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
  String? text1, text2, text3, text4, uiD;
  List<Users> docs = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Stream<User?> val = Provider.of<UserAuthentication>(context, listen: false)
        .authStateChanges;
    val.listen((event) {
      setState(() {
        uiD = event!.uid.toString();
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

  var alertStyle = AlertStyle(
    overlayColor: const Color.fromARGB(196, 151, 151, 163),
    animationType: AnimationType.fromTop,
    isCloseButton: false,
    isOverlayTapDismiss: false,
    descStyle: TextStyle(fontWeight: FontWeight.bold),
    animationDuration: Duration(milliseconds: 400),
    alertBorder: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(50.0),
      side: BorderSide(
        color: Colors.grey,
      ),
    ),
    titleStyle: const TextStyle(
      color: Color.fromRGBO(91, 55, 185, 1.0),
      //fontSize: 10
    ),
  );

  void onTextFieldChange(String value) {
    print(value);
    text1 = value;
  }
  void onTextFieldChange2(String value) {
    print(value);
    text2 = value;
  }
  void onTextFieldChange3(String value) {
    print(value);
    text3 = value;
  }



  @override
  Widget build(BuildContext context) {

    void onPress() {
      print('sssssww');
      print(text1);
      print(text2);
      print(text3);
      print(text4);

      Alert(
        context: context,
        style: alertStyle,
        type: AlertType.success,
        //title: "",
        desc: "Thank You for the feedback",
        buttons: [
          DialogButton(
            child: const Text(
              "Ok",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: (){
              // Provider.of<UserCRUDModel>(context, listen: false)
              //     .updateUserData(uiD, text1, text3, text2);
              Navigator.of(context, rootNavigator: true).pop();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfileUI()),
              );
            },
            color: Color.fromRGBO(91, 55, 185, 1.0),
            radius: BorderRadius.circular(10.0),
          ),
        ],
      ).show();
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(builder: (context) => const ProfileUI()),
      // );
    }

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
                            onChanged: onTextFieldChange,
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
                            onChanged: (val) => onTextFieldChange2,
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
                                onChanged: (val) => onTextFieldChange3,

                                    //setState(() => text3 = val),
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
                                    onPressed: onPress),
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
