import 'package:another_flushbar/flushbar.dart';
import 'package:catelog_web/src/core/util/theme.dart';
import 'package:flutter/material.dart';

class AppNotification {
  showNotification(
      {required BuildContext context, required String text, required isError}) {
    return Flushbar(
      message: text,
      flushbarStyle: FlushbarStyle.GROUNDED,
      margin: const EdgeInsets.all(10),
      messageSize: 14,
      messageColor: Colors.white,
      backgroundColor: isError ? Colors.red.withOpacity(0.6) : Colors.green,
      flushbarPosition: FlushbarPosition.TOP,
      duration: const Duration(seconds: 4),
      leftBarIndicatorColor: colorPrimary,
    )..show(context);
  }
}
