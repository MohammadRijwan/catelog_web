import 'dart:io';

import 'package:catelog_web/src/core/util/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:media_thumbnail/media_thumbnail.dart';
import 'package:path_provider/path_provider.dart';

class CommonVideoContainer extends StatefulWidget {
  final String productVideo;
  final Function onVideoPlay;
  final Function onVideoDelete;
  final bool isDeletable;

  const CommonVideoContainer(
      {super.key,
      required this.onVideoPlay,
      required this.onVideoDelete,
      this.isDeletable = false,
      required this.productVideo});

  @override
  State<CommonVideoContainer> createState() => _CommonVideoContainerState();
}

class _CommonVideoContainerState extends State<CommonVideoContainer> {
  String? videoFile;

  @override
  void initState() {
    // initPlatformState();
    super.initState();
  }

  Future<void> initPlatformState() async {
    videoFile = null;
    String? platformVersion;
    try {
      final thumbnailPath = await getCacheDir();
      platformVersion = await MediaThumbnail.videoThumbnail(widget.productVideo,
          "$thumbnailPath/${DateTime.now().millisecond.toString()}.png");
    } catch (ex) {
      debugPrint(ex.toString());
    }

    if (!mounted) return;

    setState(() {
      videoFile = platformVersion;
    });
  }

  Future<String?> getThumbnail({required String videoPath}) async {
    String? platformVersion;
    try {
      final thumbnailPath = await getCacheDir();
      platformVersion = await MediaThumbnail.videoThumbnail(videoPath,
          "$thumbnailPath/${DateTime.now().microsecondsSinceEpoch.toString()}.jpg");
    } catch (ex) {
      debugPrint(ex.toString());
    }
    return platformVersion;
  }

  Future<String> getCacheDir([String? subDir]) async {
    var parentPath = (await getTemporaryDirectory()).path;
    return createSubDirIfNotExist(parentPath, subDir);
  }

  Future<String> createSubDirIfNotExist(String currentPath,
      [String? subDir]) async {
    if (subDir == null || subDir.isEmpty) {
      return currentPath;
    }
    var parentPath = currentPath;
    final dirs = subDir.split('/');
    for (final p in dirs) {
      final path = '$parentPath/$p';
      var dir = Directory(path);
      if (!dir.existsSync()) {
        await dir.create();
      }
      parentPath = path;
    }
    return parentPath;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String?>(
      future: getThumbnail(videoPath: widget.productVideo),
      builder: (context, snapshot) => Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height: 220.h,
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(6.0),
              child: Stack(
                children: [
                  Container(
                    width: 220.h,
                    height: 220.h,
                    color: colorPrimary,
                    child: snapshot.data != null
                        ? Image.file(
                            File(snapshot.data!),
                            fit: BoxFit.cover,
                          )
                        : const Padding(
                            padding: EdgeInsets.all(40.0),
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: InkWell(
                      onTap: () {
                        widget.onVideoPlay();
                      },
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        padding: const EdgeInsets.all(5),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                        child: const Icon(
                          Icons.play_arrow,
                          color: colorPrimary,
                          size: 50.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (widget.isDeletable)
            Positioned(
              right: 3.0,
              top: 0.0,
              child: InkWell(
                onTap: () {
                  widget.onVideoDelete();
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
      ),
    );
  }
}
