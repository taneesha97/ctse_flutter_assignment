import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          SizedBox(
            height: 8,
          ),
          Text.rich(
            TextSpan(
                text: "Question 1",
                style: Theme.of(context).textTheme.headline4,
                // .copyWith(color: Colors.black54
                // ),
                children: [
                  TextSpan(
                    text: "/10",
                    style: Theme.of(context).textTheme.headline5,
                  )
                ]),
          ),
          Divider(
            thickness: 1.5,
          ),
          SizedBox(
            height: 8,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 4),
            padding: EdgeInsets.all(4),
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(25)),
            child: Column(
              children: [
                Text(
                  "Guess the Movie",
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(color: Colors.blueGrey),
                ),
                SizedBox(
                  height: 4,
                ),

                ListView.builder(
                  itemCount: 5,
                  shrinkWrap: true,
                  itemBuilder: (context, index) => Options(),
                )
              ],
            ),
          ),
        ],
      ),
    ));
  }
}

class Options extends StatelessWidget {
  const Options({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        child: InkWell(
          child: Container(
            margin: EdgeInsets.only(bottom: 8),
            padding: EdgeInsets.only(top: 8, bottom: 8),
            //color: Color.fromARGB(255, 0, 238, 255),
            decoration: BoxDecoration(
              border: Border.all(color: Color.fromARGB(255, 13, 213, 227)),
              borderRadius: BorderRadius.circular(15),
              color: Color.fromARGB(255, 0, 238, 255),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    "Colombo",
                    style: TextStyle(color: Colors.black45, fontSize: 16),
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
