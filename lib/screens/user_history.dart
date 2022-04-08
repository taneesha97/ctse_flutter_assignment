import 'package:ctse_assignment_1/components/UserHistory/userHistoryCard.dart';
import 'package:ctse_assignment_1/components/leaderboard/leaderboard_card.dart';
import 'package:ctse_assignment_1/models/result_quiz.dart';
import 'package:ctse_assignment_1/models/user_history_model.dart';
import 'package:ctse_assignment_1/screens/profile_ui.dart';
import 'package:ctse_assignment_1/util/Quiz_Result/quiz_result_crud_model.dart';
import 'package:ctse_assignment_1/util/UserHistory/user_history_crud_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import '../models/leaderboard_model.dart';
import '../styles.dart';
import '../util/QuizeConfig/leaderboard_crud_model.dart';

class UserHistory extends StatefulWidget {

  String id;
  UserHistory({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  _UserHistoryState createState() => _UserHistoryState();
}

class _UserHistoryState extends State<UserHistory> {
  List<ResultQuiz> docs1 = [];

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    Stream<List<ResultQuiz>> list = Provider.of<UserHistoryCrudModel>(context, listen: false)
        .readUserHistoryDetails(widget.id);
    // Stream Version.
    // Stream<List<UserHistoryModel>> list =
    //     Provider.of<UserHistoryModel>(context, listen: false)
    //         .getListOfLeaderBoxes;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          elevation: 0,
          toolbarHeight: 10,
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                  right: 10,
                  top: 10,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,

                      children: [
                        Text(
                          "User History",
                          style: Styles.textSectionHeader,
                        ),
                        SizedBox(width: 90,),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.red, // background
                            onPrimary: Colors.white,
                            padding: const EdgeInsets.all(10.0),
                            fixedSize: const Size(100, 20),
                            // foreground
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProfileUI()),
                            );
                          },
                          child: const Text(
                            'Profile',
                            style: TextStyle(
                                fontSize: 10, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              
              Flexible(
                child: StreamBuilder<List<ResultQuiz>>(
                    stream: list,
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Text("Error");
                      } else if (snapshot.hasData) {
                        final data = snapshot.requireData;
                        return
                          ListView.builder(
                              itemCount: data.length,
                              shrinkWrap: true,
                              itemBuilder: (BuildContext context, int index) =>
                                  UserHistoryCard(index: index, model: data[index])
                          );

                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    }),
              ),
            ],
          ),
        ));
  }
}
