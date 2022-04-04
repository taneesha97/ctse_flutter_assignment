import 'package:ctse_assignment_1/bottom_navigation/app.dart';
import 'package:ctse_assignment_1/screens/register_screen.dart';
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

    void loginUserMethod(Stream<User?> val) {
      val.listen((event) {
        print('event email $event.email');
        if(event != null){
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => App()),
          );
        }else{
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => RegisterScreen()),
          );
        }
      });
    }

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
                      Stream<User?> val = Provider.of<UserAuthentication>(context, listen: false).authStateChanges;
                      print('111111111111111111111111111111111111111111');
                      print(val.first);
                      loginUserMethod(val);

                      // if(firebaseUser != null){
                      //   Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => App()),
                      //   );
                          // .logInUser(emailadd!, password! ); //'hello1234'
                      // final firebaseUser = context.watch<User>();
                      // print('firebaseUser $firebaseUser');

                      // }
                    },
                    child: const Text('Login'),
                  )
              ), SizedBox(
                child: ElevatedButton(
                  child: const Text('Register Here'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RegisterScreen()),
                    );
                  },
                ),
              )
            ],

          ),
        ),
      )
    );

  }
}

