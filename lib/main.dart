import 'package:ctse_assignment_1/components/card_custom.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Row(
      children: const [
        CustomCard(
          image: "https://picsum.photos/250?image=9",
          title:"Spider-Man",
          year: 2007
        ),

      ],
      )
    );
  }
}

