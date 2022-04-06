import 'package:ctse_assignment_1/models/result_quiz.dart';
import 'package:ctse_assignment_1/models/user_history_model.dart';
import 'package:flutter/material.dart';

class UserHistoryCard extends StatelessWidget {

  final int index;
  //final bool _isShown = true;
  final ResultQuiz model;
  const UserHistoryCard({Key? key, required this.model, required this.index}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0.0),
      ),
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:<Widget> [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children:<Widget> [
                SizedBox(width: 5.0),
                Container(
                  width: 220,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children:<Widget> [
                      Text('Date: ' + model.date.toString(), style: TextStyle(color: Colors.black, fontSize: 14.0, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 5),
                      Text('Total Points: ' + (model.no_questions! * 10).toString(), style: TextStyle(color: Colors.grey,fontSize: 16.0,)),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              width: 60.0,
              height: 60.0,
              color: Colors.teal,
              child: Center(
                  child: Text.rich(
                    TextSpan(
                        text: model.correct_points.toString() + 'pts',
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white )
                    ),
                  )
              ),
            ),
          ],
        ),
      ),
    );;
  }
}
