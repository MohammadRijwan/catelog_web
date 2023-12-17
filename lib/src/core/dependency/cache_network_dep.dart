import 'package:cached_network_image/cached_network_image.dart';
import 'package:catelog_web/src/core/util/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CustomCacheNetworkImage extends StatelessWidget {
  final String imageUrl;
  final bool isScrollerWhite;
  final BoxFit? boxFit;
  final Widget? errorWidget;

  const CustomCacheNetworkImage(
      {super.key,
      required this.imageUrl,
      this.boxFit,
      this.errorWidget,
      this.isScrollerWhite = false});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      fit: boxFit ?? BoxFit.contain,
      imageUrl: imageUrl,
      placeholder: (context, url) => const Padding(
        padding: EdgeInsets.all(15.0),
        child: SpinKitCircle(color: colorPrimary),
      ),
      errorWidget: (context, url, error) => Container(
        height: 50.0,
        width: 50.0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: errorWidget ??
              Image.asset(
                'assets/Common_Icons/Group (7).png',
                color: colorPrimary,
              ),
        ),
      ),
    );
  }
}
