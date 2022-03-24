import 'package:flutter/material.dart';

import '../../styles.dart';

showAltertDialog(BuildContext context, Function function1, Function function2, String message) {
  // Delete Button
  Widget deleteButton = TextButton(
      onPressed: () {
        function1();
      },
      child: Text("Delete"));

  // Cancel Button
  Widget cancelButton = TextButton(
      onPressed: () {
        function2();
      },
      child: Text("Cancel"));

  // Alert dialog window.
  AlertDialog alert = AlertDialog(
    title: Text("Warning!"),
    content: Text(
      message,
      style: Styles.textSectionSubBody,
    ),
    actions: [
      deleteButton,
      cancelButton,
    ],
  );

  // Trigger the alert dialog.
  showDialog(
    context: context,
    builder: (BuildContext context){
      return alert;
    }
  );
}
