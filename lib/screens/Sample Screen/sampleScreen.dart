import 'package:flutter/material.dart';

class SampleScreen extends StatelessWidget {
  const SampleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SavedQuizComponent(),
              SavedQuizComponent(),
              SavedQuizComponent(),
              SavedQuizComponent(),
              SavedQuizComponent(),
              SavedQuizComponent(),
              SavedQuizComponent(),
              SavedQuizComponent(),
              SavedQuizComponent(),
              SavedQuizComponent(),
              SavedQuizComponent(),
              SavedQuizComponent(),
            ],
          ),
        ),
      ),
    );
    ;
  }
}

class SavedQuizComponent extends StatelessWidget {
  const SavedQuizComponent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Material(
        //borderRadius: 20,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Container(
          // decoration: BoxDecoration(
          //   borderRadius: BorderRadius.circular(50),
          // ),
          child: Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Column(
                    children: [Text("Hi 1"), Text("Hi 2")],
                  ),
                ),
                // SizedBox(
                //   width: ,
                // ),
                Container(
                  padding: EdgeInsets.all(5),
                  child: Row(
                    children: [
                      Ink(
                        decoration: ShapeDecoration(
                            shape: CircleBorder(), color: Colors.blue),
                        child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.edit,
                              color: Colors.white,
                            )),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Ink(
                        decoration: ShapeDecoration(
                            shape: CircleBorder(), color: Colors.red),
                        child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.delete,
                              color: Colors.white,
                            )),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
