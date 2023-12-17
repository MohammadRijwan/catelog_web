import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommonImageContainer extends StatelessWidget {
  final String productPhoto;
  final Function onImageTap;
  final Function onImageDelete;
  final bool isImageDeletable;

  const CommonImageContainer(
      {required this.productPhoto,
      required this.onImageTap,
      required this.onImageDelete,
      this.isImageDeletable = false,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(
          onTap: () {
            onImageTap();
          },
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height: 220.h,
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(6.0),
              child: Image.file(
                File(productPhoto),
                errorBuilder: (context, ss, _) {
                  return Center(
                    child: Icon(
                      Icons.error_outlined,
                      color: Theme.of(context).primaryColor,
                    ),
                  );
                },
                width: MediaQuery.of(context).size.width * 0.8,
                height: 220.h,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        if (isImageDeletable)
          Positioned(
            right: 3.0,
            top: 0.0,
            child: InkWell(
              onTap: () {
                onImageDelete();
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  shape: BoxShape.circle,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.close_rounded,
                    color: Colors.white,
                    size: 20.sp,
                  ),
                ),
              ),
            ),
          )
      ],
    );
  }
}
