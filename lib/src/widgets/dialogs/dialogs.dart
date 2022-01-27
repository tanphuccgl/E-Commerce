import 'package:flutter/material.dart';
import 'package:flutter_dialogs/flutter_dialogs.dart';

class XDialog {
  static showAlertSuccess(BuildContext context,{required String content}) => showPlatformDialog(
        context: context,
        builder: (context) => BasicDialogAlert(
          title: const Text("Success"),
          content:
              Text(content),
          actions: <Widget>[
            BasicDialogAction(
              title: const Text("OK"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      );
}
