import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {

  String userName, password;
  RegisterScreen({Key? key, required this.userName, required this.password})
      : super(key: key);

  @override
  State<RegisterScreen> createState() => RegisterScreen();
}