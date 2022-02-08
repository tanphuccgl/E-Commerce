import 'package:flutter/material.dart';
import 'package:flutter_dialogs/flutter_dialogs.dart';

import 'package:flutter/cupertino.dart';

import '../../config/routes/coordinator.dart';

class XDialog {
  static get context => XCoordinator.context;

  // TODO: add a function show Alert
  static showAlertSuccess({required String content}) => showPlatformDialog(
        context: context,
        builder: (context) => BasicDialogAlert(
          title: const Text("Success"),
          content: Text(content),
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
