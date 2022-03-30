import 'package:ctse_assignment_1/models/user_history_model.dart';
import 'package:flutter/material.dart';

class UserHistoryCard extends StatelessWidget {

  final int index;
  //final bool _isShown = true;
  final UserHistoryModel model;
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
                  width: 150,
                  child: Text(model.Quiz_ID.toString(), style: TextStyle(color: Colors.black, fontSize: 18.0, fontWeight: FontWeight.bold)),
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
                        text: model.score.toString() + 'pts',
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
