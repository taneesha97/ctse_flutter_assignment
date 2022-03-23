import 'package:ctse_assignment_1/models/quize_list_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../screens/movie_library_form.dart';
import '../../screens/quice_configuration_screen.dart';
import '../../screens/quice_configuration_splash.dart';
import '../../screens/quize_list.dart';
import '../../util/QuizeConfig/quize_list_crud_model.dart';

class CardView1 extends StatefulWidget {

  final int index;
  final String text1, text2, id;
  const CardView1({
    Key? key,
    required this.index,
    required this.text1,
    required this.text2,
    required this.id,

  }) : super(key: key);

  @override
  State<CardView1> createState() => _CardView1State();
}

class _CardView1State extends State<CardView1> {

  bool _isShown = true;

  void _deleteQuizList(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: const Text('Please Confirm'),
            content: const Text('Are you sure to remove the quiz?'),
            actions: [
              // The "Yes" button
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    Provider.of<QuizListCrudModel>(context, listen: false).deleteQuizList(widget.id);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => QuizeList()));
                  },
                  child: const Text('Yes')),
              TextButton(
                  onPressed: () {
                    // Close the dialog
                    Navigator.of(context).pop();
                  },
                  child: const Text('No'))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {

    onPress() {

      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => DropDown(

              // id: quizList.id,
              // functionValue: 1,
              // libraryName: library.name,
            )),
      );

      // final QuizID = storage.getItem('QuizID');
      // print(QuizID);
      // print('questionCard');
      // Provider.of<QuizCrudModel>(context, listen: false).updateValues(quizList, selectedIndex.toString(), QuizID);
      // _controller.checkAns(question, selectedIndex.toString());
    }

    return
      Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(horizontal: 2.0, vertical: 1.0),
        child: Card(
          elevation: 5.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6.0),
          ),
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(horizontal: 3.0, vertical: 3.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children:<Widget> [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children:<Widget> [
                    SizedBox(width: 5.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:<Widget> [
                        Text(widget.text1, style: TextStyle(color: Colors.black, fontSize: 18.0, fontWeight: FontWeight.bold)),
                        Text(widget.text2, style: TextStyle(color: Colors.grey)),
                      ],
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.all(1),
                  child: Row(
                    children: [
                      Ink(
                        decoration: ShapeDecoration(
                            shape: CircleBorder(), color: Colors.blue),
                        child: IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context, MaterialPageRoute(builder: (context) => SplashQuiceConfig()));
                            },
                            //     () {
                            //   Navigator.push(
                            //       context,
                            //       MaterialPageRoute(
                            //       builder: (context) => DropDown(
                            //
                            //       // libraryId: library.id,
                            //       // functionValue: 1,
                            //       // libraryName: library.name,
                            //   )),
                            // },
                            icon: Icon(
                              Icons.start,
                              color: Colors.white,
                              size: 15,
                            )),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Ink(
                        decoration: ShapeDecoration(
                            shape: CircleBorder(), color: Colors.green),
                        child: IconButton(
                            onPressed: onPress,
                            icon: Icon(
                              Icons.edit,
                              color: Colors.white,
                              size: 15,
                            )),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Ink(
                        decoration: ShapeDecoration(
                            shape: CircleBorder(), color: Colors.red),
                        child: IconButton(
                            onPressed: _isShown == true ? () => _deleteQuizList(context) : null,
                            icon: Icon(
                              Icons.delete,
                              color: Colors.white,
                              size: 15,
                            )),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
  }
}

