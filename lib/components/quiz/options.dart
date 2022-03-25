import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../Controllers/QuestionController.dart';

class Options extends StatelessWidget {
  final String? text;
  final int? index;
  final VoidCallback? press;

  const Options({
    Key? key,
    this.text,
    this.index,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuestionController>(
        init: QuestionController(),
        builder: (qnController) {
          // Color getTheRightColor() {
          //   if (qnController.isAnswered) {
          //     if (index.toString() == qnController.correctAns) {
          //       return Colors.green;
          //     }
          //     else if (index == qnController.selectedAns &&
          //         qnController.selectedAns != qnController.correctAns) {
          //       return Colors.red;
          //     }
          //   }else{
          //     return const Color.fromARGB(255, 0, 238, 255);
          //   }
          //   return const Color.fromARGB(255, 0, 238, 255);
          // }

          Color getTheRightColor() {
            if (qnController.isAnswered) {
              if (index == (int.parse(qnController.correctAns) - 1)) {
                return Colors.green;
              } else if (index.toString() == qnController.selectedAns &&
                  qnController.selectedAns != (int.parse(qnController.correctAns) - 1).toString()) {
                return Colors.red;
              }
            }
            return Color.fromARGB(255, 0, 238, 255);
            // };
          }

          return Center(
            child: Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Material(
                borderRadius: BorderRadius.circular(15),
                color: getTheRightColor(),
                child: InkWell(
                  onTap: press,
                  borderRadius: BorderRadius.circular(25),
                  child: Container(
                    margin: EdgeInsets.only(bottom: 7),
                    padding: EdgeInsets.only(top: 7, bottom: 7),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text(
                            "$text",
                            style:
                                TextStyle(color: Colors.black, fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
