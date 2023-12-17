import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ElevatedFillButton extends StatelessWidget {
  final String label;
  final Function onButtonTap;
  final double? fontSize;

  const ElevatedFillButton(
      {Key? key, required this.label, required this.onButtonTap, this.fontSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          onButtonTap();
        },
        child: Text(
          label,
          style: TextStyle(
            color: Colors.white,
            fontSize: fontSize ?? 18.sp,
            fontWeight: FontWeight.w600,
            // fontFamily: Constant().font,
          ),
        ),
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
                Theme.of(context).primaryColor),
            padding: MaterialStateProperty.all<EdgeInsets>(
              EdgeInsets.symmetric(horizontal: 40, vertical: 10),
            ),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    side: BorderSide(color: Theme.of(context).primaryColor)))));
  }
}

class ElevatedWithOutFillButton extends StatelessWidget {
  final String label;
  final Function onButtonTap;
  final double? fontSize;

  const ElevatedWithOutFillButton(
      {Key? key, required this.label, required this.onButtonTap, this.fontSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onButtonTap();
      },
      child: Text(
        label,
        style: TextStyle(
          color: Colors.black,
          fontSize: fontSize ?? 18.sp,
          fontWeight: FontWeight.w600,
          // fontFamily: Constant().font,
        ),
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
        padding: MaterialStateProperty.all<EdgeInsets>(
          EdgeInsets.symmetric(horizontal: 40, vertical: 10),
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
            side: BorderSide(color: Theme.of(context).primaryColor),
          ),
        ),
      ),
    );
  }
}
