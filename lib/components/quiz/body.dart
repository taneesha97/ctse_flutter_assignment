import 'package:ctse_assignment_1/Controllers/QuestionController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
                ),
                SizedBox(
                  height: 8,
                ),
                ProgressBar(),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}

class ProgressBar extends StatelessWidget {
  const ProgressBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 35,
        // decoration: BoxDecoration(
        // border: Border.all(color: Color(0xFF3F4768), width: 3),
        //   borderRadius: BorderRadius.circular(50),
        // ),
        child: GetBuilder<QuestionController>(
          init: QuestionController(),
          builder: (controller) {
            return Stack(
              children: [
                LayoutBuilder(
                  builder: (context, constraints) => Container(
                    // from 0 to 1 it takes 60s
                    width: constraints.maxWidth * controller.animation.value,
                    decoration: BoxDecoration(
                      // gradient: kPrimaryGradient,
                      color: Color(0xFF3F4768),
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                            "${(controller.animation.value * 60).round()} sec"),
                        //SvgPicture.asset("assets/icons/clock.svg"),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ));
  }
}
