import 'package:flutter/material.dart';

class MovieTicketBothSidesClipper extends CustomClipper<Path> {
  double bottom = 50;
  double hole = 12;
  @override
  Path getClip(Size size) {
    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(0.0, size.height - 100.0 - hole)
      ..arcToPoint(
        Offset(0, size.height - 100.0),
        clockwise: true,
        radius: Radius.circular(1),
      )
      ..moveTo(0, 0)
      ..lineTo(0.0, size.height - 80.0 - hole)
      ..arcToPoint(
        Offset(0, size.height - 80.0),
        clockwise: true,
        radius: Radius.circular(1),
      )
      ..moveTo(0, 0)
      ..lineTo(0.0, size.height - 55.0 - hole)
      ..arcToPoint(
        Offset(0, size.height - 55.0),
        clockwise: true,
        radius: Radius.circular(1),
      )
      ..moveTo(0, 0)
      ..lineTo(0.0, size.height - 30.0 - hole)
      ..arcToPoint(
        Offset(0, size.height - 30.0),
        clockwise: true,
        radius: Radius.circular(1),
      )
      ..moveTo(0, 0)
      ..lineTo(0.0, size.height - 10.0 - hole)
      ..arcToPoint(
        Offset(0, size.height - 10.0),
        clockwise: true,
        radius: Radius.circular(1),
      )

      ..lineTo(0.0, size.height)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width, size.height - 100.0)
      ..arcToPoint(
        Offset(size.width, size.height - 100.0 - hole),
        clockwise: true,
        radius: Radius.circular(1),
      )
      ..lineTo(size.width, size.height - 80.0)
      ..arcToPoint(
        Offset(size.width, size.height - 80.0 - hole),
        clockwise: true,
        radius: Radius.circular(1),
      )..lineTo(size.width, size.height - 55.0)
      ..arcToPoint(
        Offset(size.width, size.height - 55.0 - hole),
        clockwise: true,
        radius: Radius.circular(1),
      )..lineTo(size.width, size.height - 30.0)
      ..arcToPoint(
        Offset(size.width, size.height - 30.0 - hole),
        clockwise: true,
        radius: Radius.circular(1),
      )..lineTo(size.width, size.height - 10.0)
      ..arcToPoint(
        Offset(size.width, size.height - 10.0 - hole),
        clockwise: true,
        radius: Radius.circular(1),
      );


    path.lineTo(size.width, 0.0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper old) {
    return old != this;
  }
}
