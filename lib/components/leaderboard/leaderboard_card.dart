import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/leaderboard_model.dart';
import '../../util/QuizeConfig/leaderboard_crud_model.dart';

class LeaderBoradCard extends StatelessWidget {
  final int index;
  final bool _isShown = true;
  final LeaderBoardModel model;
  const LeaderBoradCard({Key? key, required this.model, required this.index}) : super(key: key);

  void _deleteItem(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: const Text('Please Confirm'),
            content: const Text('Are you sure to remove the item?'),
            actions: [
              // The "Yes" button
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    Provider.of<LeaderBoardCrudModel>(context, listen: false).deleteLeaderboardItem(model.id.toString());
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

    Color getTheRightColor(int index) {
      print(index);
      // if (model.version.toString() == 'Gold') {
      //   return Colors.amber;
      // }
      // else if(model.version.toString() == 'Silver'){
      //   return Colors.black38;
      // }
      // else if(model.version.toString() == 'Bronze'){
      //   return Colors.redAccent;
      // }
      if(index == 0){
        return Colors.amber;
      }else if(index == 1){
        return Colors.black38;
      }else if(index == 2){
        return Colors.redAccent;
      }
      return Colors.green;

    }


    return Card(
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0.0),
      ),
      child: Container(
        width: MediaQuery.of(context).size.width,
        // padding: EdgeInsets.only()
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:<Widget> [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children:<Widget> [
                Container(
                  height: 60.0,
                  width: 5.0,
                  color: getTheRightColor(index),
                  // margin: EdgeInsets.only(right: 0, left: 0),
                ),
                SizedBox(width: 5.0),
                Container(
                  width: 55.0,
                  height: 55.0,
                  // color: Colors.green,
                  child: CircleAvatar(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.green,
                    // backgroundImage: AssetImage("images/bright.jpg"),
                    backgroundImage: NetworkImage
                      (model.image.toString()),
                    // ("https://images.unsplash.com/photo-1457449940276-e8deed18bfff?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80"),
                  ),
                ),
                SizedBox(width: 5.0),
                Container(
                  width: 150,
                  // color: Colors.purple,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:<Widget> [
                      Text(model.name.toString(), style: TextStyle(color: Colors.black, fontSize: 18.0, fontWeight: FontWeight.bold)),
                      Text(model.place.toString() + 'place', style: TextStyle(color: Colors.grey)),
                      // Text(place[index], style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                ),
              ],
            ),

            Container(
                margin: EdgeInsets.only(left: 5.0),
                // color: Colors.pink,
                child: Row(
                    children: [
                      Ink(
                        decoration: ShapeDecoration(
                            shape: CircleBorder(), color: Colors.white),
                        child: IconButton(
                            onPressed: _isShown == true ? () => _deleteItem(context) : null,
                            icon: Icon(
                              Icons.delete,
                              color: Colors.black,
                              size: 20,
                            )),
                      ),
                    ]
                )
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              width: 60.0,
              height: 60.0,
              // margin: EdgeInsets.all(2),
              color: Colors.teal,
              child: Center(
                  child: Text.rich(
                    TextSpan(
                      // text: "76pts",
                        text: model.score.toString() + 'pts',
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white )
                    ),
                  )
              ),
            ),
          ],
        ),
      ),
    );
  }
}
