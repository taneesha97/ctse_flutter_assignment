import 'package:ctse_assignment_1/models/user.dart';
import 'package:ctse_assignment_1/screens/login_screen.dart';
import 'package:ctse_assignment_1/util/userAuth/userauthentication.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:provider/provider.dart';

import '../styles.dart';

class RegisterScreen extends StatefulWidget {

  String? userName, password;
  RegisterScreen({Key? key,  this.userName,  this.password})
      : super(key: key);
  @override
  _RegisterScreen createState() => _RegisterScreen();
}

class _RegisterScreen  extends State<RegisterScreen>{

  final formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String? uname;
  String? emailadd;
  final String _regxPattern = r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
  int initialValue = 1;
  var itemList = new List<int>.generate(100, (i) => i + 1);

  void AddUserToDB(String emailadd, String uname, String id, String age, String profileUrl  ){
    User user =  new User(id: id, email: emailadd, userName: uname, profileUrl: profileUrl, age: age);

  }



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
                      height: 400,
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
                                Container(
                                  child: Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: Container(
                                      decoration: const BoxDecoration(
                                          color: Color(0xffffffff),
                                          borderRadius: BorderRadius.all(Radius.circular(10))
                                      ),
                                      child: const FlutterLogo(
                                        size: 60,
                                      ),
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
                              child: TextField(
                                onChanged: (val) => setState(() => uname = val),

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
                          Center(
                            child: Container(
                                width: 300,
                                height: 50,
                                decoration: BoxDecoration(
                                // border: Border.all(color: Colors.black, width: 4),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              child: SizedBox(

                                child:TextField(
                                  // decoration: const InputDecoration(
                                  //   labelText: "Enter Email Address",
                                  //   filled: true,
                                  //   fillColor: Color(0xffffffff),
                                  //   border:  InputBorder.none,
                                  // ),
                                  decoration: InputDecoration(
                                    labelText: "Enter Email Address",
                                    filled: true,
                                      fillColor: Color(0xffffffff),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),
                                  onChanged: (val) => setState(() => emailadd = val),
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
                          ),
                          Center(
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                              child: Align(
                                alignment: Alignment.bottomRight,
                                child: GestureDetector(
                                  onTap: (){
                                    Navigator.push(context,
                                      MaterialPageRoute(
                                          builder: (context) => LoginScreen()
                                      ),
                                    );
                                  },
                                  child: Text('Or Login',
                                    style: Styles.subWelcomeText),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Center(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 25),
                            primary: Styles.primaryThemeColor,
                            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5)),

                        onPressed: () {
                          var value = Provider.of<UserAuthentication>(context, listen: false).registerUser(emailadd!, 'hello1234');
                          // AddUserToDB(String? emailadd );

                        },
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