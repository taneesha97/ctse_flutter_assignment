import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/list_view/card_view.dart';
import '../models/quize_list_model.dart';
import '../util/QuizeConfig/quize_list_crud_model.dart';

class QuizeList extends StatefulWidget {
  @override
  _QuizeListState createState() => _QuizeListState();
}
//
class _QuizeListState extends State<QuizeList> {

  List<QuizList> docs1 = [];

  List category = ["Romantic", "Horror","Thriller","Animation","Romantic","Romantic", "Horror","Thriller","Animation","Romantic"];
  List time = ["20min", "10min","20min","15min","20min", "10min","20min", "10min","20min","15min"];

  @override
  void initState() {
    super.initState();
    Provider.of<QuizListCrudModel>(context, listen: false)
        .readQuizList()
        .then((value) => {
      setState(() {
        docs1 = value;
      }),
    });
  }

  Widget deleteItems(){
    return Container(
      alignment: Alignment.centerRight,
      padding: EdgeInsets.only(right: 20),
      color: Colors.red,
      child: Icon(Icons.delete, color: Colors.white),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Quize List",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
        color: Colors.black12,
        child: ListView.builder(
            itemCount: docs1.length,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) =>
                CardView1(index: index, text1 : docs1[index].category.toString() , text2: int.parse(docs1[index].time.toString()), id: docs1[index].id.toString(), questions: int.parse(docs1[index].questions.toString())),
        ),
      ),

    );
  }
}

