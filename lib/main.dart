import 'package:ctse_assignment_1/screens/index_page.dart';
import 'package:ctse_assignment_1/screens/movie_library_form.dart';

import 'package:ctse_assignment_1/screens/movie_wiki.dart';
import 'package:ctse_assignment_1/util/QuizeConfig/quize_list_crud_model.dart';

import 'package:ctse_assignment_1/util/Quizes/quiz_crud_model.dart';
import 'package:ctse_assignment_1/util/crud_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  );
  runApp(const MyApp());
  // if (Firebase.apps.isEmpty) {
  //   WidgetsFlutterBinding.ensureInitialized();
  //   await Firebase.initializeApp(
  //     // Replace with actual values
  //     options: const FirebaseOptions(
  //       apiKey: "",
  //       appId: "1:406029970910:android:4da777d7415dd38630814f",
  //       messagingSenderId: "406029970910",
  //       projectId: "ctse-assignment-1",
  //     ),
  //   );
  // }else {
  //   Firebase.apps; // if already initialized, use that one
  // }
  //
  //
  // runApp(const MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CrudModel()),
        ChangeNotifierProvider(create: (context) => QuizCrudModel()),
        ChangeNotifierProvider(create: (context) => QuizListCrudModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          backgroundColor: Colors.black,
        ),
        home: IndexPage(),
      ),
    );
  }
}
