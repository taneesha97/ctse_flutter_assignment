import 'package:flutter/material.dart';

class ExampleList extends StatefulWidget {
  const ExampleList({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _ExampleListState createState() => _ExampleListState();
}

class _ExampleListState extends State<ExampleList> {

  late List<String> categories;
  late List<String> time;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    categories = [];
    time = [];
    // time = [];
  }

  addCategories() {
    categories.add("Romance");
    categories.add("Thriller");
    categories.add("Horror");
    categories.add("Animation");
    categories.add("Romance");
    categories.add("Action");
  }

  addTimes() {
    categories.add("20Min");
    categories.add("15Min");
    categories.add("10Min");
    categories.add("5Min");
    categories.add("20Min");
    categories.add("10Min");
  }

  Widget showList(){
    return ListView.builder(
      padding: EdgeInsets.all(10),
      itemCount: categories.length,
      itemBuilder: (BuildContext context, int index){
        return rowItem(context, index);
      },
    );
  }

  Widget rowItem(context, index){
    return Dismissible(
      key: Key(categories[index]),
      onDismissed: (direction){

      },
      child: Card(
        child: ListTile(
          title: Text(categories[index]),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: showList(),
      ),
    );
  }
}
