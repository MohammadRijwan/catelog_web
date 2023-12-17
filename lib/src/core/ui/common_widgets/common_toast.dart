import 'package:catelog_web/main.dart';
import 'package:catelog_web/src/core/util/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CommonToast {
  static showToast(
      {required String message, bool isError = false, Toast? toastLength}) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: toastLength ?? Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: isError
            ? HexColor('#ec4c24')
            : Theme.of(navigatorKey.currentContext!).primaryColor,
        textColor: Colors.white,
        fontSize: 18.sp);
  }
}
