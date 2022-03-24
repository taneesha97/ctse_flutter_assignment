import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controllers/QuestionController.dart';

class ProgressBar extends StatelessWidget {

  int time;
  ProgressBar({
    Key? key,
    required this.time
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 35,
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
                      color: Color(0xFF66DBCC),
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
                          "${(controller.animation.value * time).round()} sec",
                          style: TextStyle(color: Colors.black),
                        ),

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
