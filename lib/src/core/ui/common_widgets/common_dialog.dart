import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'elevated_fill_button.dart';

commonDialog({
  required BuildContext context,
  required Function onYesTap,
  required Function onNoTap,
  required String title,
  required String description,
}) {
  return showDialog(
    context: context,
    builder: (ctx) => AlertDialog(
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 22.sp,
        fontWeight: FontWeight.w600,
      ),
      title: Center(child: Text(title)),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(
              // color: AppColorsTheme.lightGrey,
              fontSize: 18.sp,
              fontWeight: FontWeight.w400,
              // fontFamily: Constant().font,
            ),
          ),
          SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedFillButton(
                label: 'Yes',
                onButtonTap: () {
                  Navigator.pop(context);
                  onYesTap();
                },
              ),
              ElevatedWithOutFillButton(
                onButtonTap: () {
                  Navigator.pop(context);
                },
                label: 'No',
              ),
            ],
          )
        ],
      ),
    ),
  );
}
