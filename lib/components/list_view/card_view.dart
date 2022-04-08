import 'package:ctse_assignment_1/screens/quice_configuration_screen_two.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import '../../screens/quice_configuration_splash.dart';
import '../../screens/quize_list.dart';
import '../../util/QuizeConfig/quize_list_crud_model.dart';

class CardView1 extends StatefulWidget {

  final int index;
  final String text1, id;
  final int text2, questions, text3;
  const CardView1({
    Key? key,
    required this.index,
    required this.text1,
    required this.text2,
    required this.text3,
    required this.questions,
    required this.id,

  }) : super(key: key);

  @override
  State<CardView1> createState() => _CardView1State();
}

class _CardView1State extends State<CardView1> {

  bool _isShown = true;

  //delete one quiz list item
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
                    Navigator.of(context, rootNavigator: true).pop(); // New Pop Method.
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
                        Row(
                          children: [
                            const Text('time - ', style: TextStyle(color: Colors.grey)),
                            Text(widget.text2.toString(), style: TextStyle(color: Colors.grey)),
                            SizedBox(width: 15.0),
                            const Text('questions - ', style: TextStyle(color: Colors.grey)),
                            Text(widget.text3.toString(), style: TextStyle(color: Colors.grey)),
                          ],
                        ),
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
                                  context, MaterialPageRoute(builder: (context) => SplashQuiceConfig(
                                cattegory: widget.text1,
                                time: widget.text2,
                                questions: widget.questions,
                              )));
                            },
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
                              onPressed: (){
                                SchedulerBinding.instance?.addPostFrameCallback((_) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DropDownNew(
                                          id: widget.id,
                                          category:widget.text1,
                                          time:widget.text2,
                                          questions:widget.questions,
                                        )),
                                  );
                                });
                              },
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

