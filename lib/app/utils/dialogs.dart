import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class Dialogs {
  static alert(BuildContext context,
      {@required String title, @required String description}) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: Text(title),
              content: Text(description),
              actions: [
                TextButton(onPressed: () => Get.back(), child: Text('OK'))
              ],
            ));
  }
}

abstract class ProgressDialog {
  static show(BuildContext context) {
    showCupertinoModalPopup(
        context: context,
        builder: (_) {
          return WillPopScope(
            child: Container(
              color: Colors.white.withOpacity(0.9),
              width: double.infinity,
              height: double.infinity,
              child: Center(child: Image.asset('assets/truck.gif')),
            ),
            onWillPop: () async => false,
          );
        });
  }

  static dismiss(BuildContext context) {
    Navigator.pop(context);
  }
}
