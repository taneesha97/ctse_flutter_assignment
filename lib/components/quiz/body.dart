import 'package:flutter/material.dart';

import 'options.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          SizedBox(
            height: 8,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 4),
            padding: EdgeInsets.all(12),
            width: double.infinity,
            decoration: BoxDecoration(
                color: Color.fromARGB(196, 151, 151, 163),
                borderRadius: BorderRadius.circular(25)),
            child: Column(
              children: [
                Text.rich(
                  TextSpan(
                      text: "1",
                      style: Theme.of(context).textTheme.headline6,
                      // .copyWith(color: Colors.black54
                      // ),
                      children: [
                        TextSpan(
                          text: "/10",
                          style: Theme.of(context).textTheme.headline6,
                        )
                      ]),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "Guess the Movie",
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(color: Colors.blueGrey),
                ),
                SizedBox(
                  height: 8,
                ),
                Image.asset(
                  "assets/images/movie1.jpg",
                  height: 150,
                  width: 300,
                ),
                SizedBox(
                  height: 8,
                ),
                ListView.builder(
                  itemCount: 4,
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
