import 'package:ctse_assignment_1/bottom_navigation/app.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../styles.dart';
import '../util/userAuth/userauthentication.dart';

class LoginScreen extends StatefulWidget {
  String? emailadd, password;

  LoginScreen({Key? key,  this.emailadd,  this.password})
      : super(key: key);
  @override
  _LoginScreen createState() => _LoginScreen();
}


class _LoginScreen extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  String? emailadd, password;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.teal,
        elevation: 0,
        toolbarHeight: 10,
      ),
    body: Padding(
        padding: EdgeInsets.all(0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              SizedBox(
                child: TextField(
                  onChanged: (val) => setState(() => emailadd = val.trim()),
                  decoration: const InputDecoration(
                    labelText: "Enter Username",
                    filled: true,
                    fillColor: Color(0xffffffff),
                    border:  InputBorder.none,
                  ),
                ),
              ),
              SizedBox(
                child: TextField(
                  onChanged: (val) => setState(() => password = val),
                  decoration: const InputDecoration(
                    labelText: "Enter Username",
                    filled: true,
                    fillColor: Color(0xffffffff),
                    border:  InputBorder.none,
                  ),
                ),
              ),
              SizedBox(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20),
                        primary: Styles.primaryThemeColor,
                        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5)),
                    onPressed: () {
                      Provider.of<UserAuthentication>(context, listen: false).logInUser(emailadd!, password! ); //'hello1234'
                      final firebaseUser = context.watch<User>();
                      print('firebaseUser $firebaseUser');
                      if(firebaseUser != null){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => App()),
                        );
                      }

                    },
                    child: const Text('Login'),
                  )
              )
            ],

          ),
        ),
      )
    );

  }
}

