import 'dart:io';

import 'package:catelog_web/src/core/ui/common_widgets/video_controller_service.dart';
import 'package:catelog_web/src/core/util/theme.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerScreen extends StatefulWidget {
  final String productVideos;

  const VideoPlayerScreen({super.key, required this.productVideos});

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  final VideoControllerService _videoControllerService =
      CachedVideoControllerService(DefaultCacheManager());
  TargetPlatform? _platform;
  late VideoPlayerController _videoPlayerController1;

  ChewieController? _chewieController;

  @override
  void initState() {
    super.initState();
    initializePlayer();
  }

  Future<void> initializePlayer() async {
    _videoPlayerController1 = widget.productVideos != null
        ? VideoPlayerController.file(File(widget.productVideos))
        : await _videoControllerService
            .getControllerForVideo(widget.productVideos);

    await Future.wait([
      _videoPlayerController1.initialize(),
    ]);
    _createChewieController();
    setState(() {});
  }

  void _createChewieController() {
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController1,
      autoPlay: true,
      looping: false,
      hideControlsTimer: const Duration(seconds: 1),
      showControls: true,
      autoInitialize: true,
      allowedScreenSleep: false,
      allowFullScreen: true,
      fullScreenByDefault: false,
      useRootNavigator: true,
    );
  }

  @override
  void dispose() {
    _videoPlayerController1.dispose();

    _chewieController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: _chewieController != null &&
                _chewieController!.videoPlayerController.value.isInitialized
            ? Chewie(
                controller: _chewieController!,
              )
            : const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SpinKitCircle(color: colorPrimary),
                  SizedBox(height: 20),
                  Text('Loading'),
                ],
              ),
      ),
    );
  }
}
