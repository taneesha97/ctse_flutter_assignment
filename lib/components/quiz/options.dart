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
          Color getTheRightColor() {
            if (qnController.isAnswered) {
              if (index == qnController.correctAns) {
                return Colors.green;
              } else if (index == qnController.selectedAns &&
                  qnController.selectedAns != qnController.correctAns) {
                return Colors.red;
              }
            }
            return Colors.grey;
          }

          IconData getTheRightIcon() {
            return getTheRightColor() == Colors.red ? Icons.close : Icons.done;
          }

          return Center(
            child: Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Material(
                borderRadius: BorderRadius.circular(15),
                color: Color.fromARGB(255, 0, 238, 255),
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
