import 'dart:developer';

import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:catelog_web/src/core/ui/common_widgets/video_controller_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class AppInioVideoPlayer extends StatefulWidget {
  final String url;

  AppInioVideoPlayer({Key? key, required this.url}) : super(key: key);

  @override
  _AppInioVideoPlayerState createState() => _AppInioVideoPlayerState();
}

class _AppInioVideoPlayerState extends State<AppInioVideoPlayer> {
  final VideoControllerService _videoControllerService =
      CachedVideoControllerService(DefaultCacheManager());
  late VideoPlayerController _videoPlayerController;
  late CustomVideoPlayerController _customVideoPlayerController;

  bool isPlay = false;
  bool isInitial = true;
  bool isFullScreen = false;
  bool isMuted = false;

  @override
  void initState() {
    super.initState();
    log(widget.url);
    initializePlayer(widget.url + '.mp4');
  }

  getSplitUrl() {
    String result = widget.url.substring(0, widget.url.indexOf('?alt='));
    print(result);
    return result;
  }

  @override
  void dispose() {
    _customVideoPlayerController.dispose();
    // _videoPlayerController.dispose();
    super.dispose();
  }

  Future<void> initializePlayer(String url) async {
    _videoPlayerController =
        await _videoControllerService.getControllerForVideo('$url');
    await Future.wait([
      _videoPlayerController.initialize(),
    ]);
    _createVideoController();
    setState(() {
      isInitial = false;
    });
  }

  void _createVideoController() {
    _customVideoPlayerController = CustomVideoPlayerController(
        context: context,
        videoPlayerController: _videoPlayerController,
        customVideoPlayerSettings: CustomVideoPlayerSettings(
          showFullscreenButton: true,
          settingsButtonAvailable: true,
          showPlayButton: true,
          playbackSpeedButtonAvailable: true,
          settingsButton: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.settings,
              size: 20.sp,
              color: Colors.white,
            ),
          ),
          controlBarDecoration: BoxDecoration(
              color: Colors.black.withOpacity(0.5),
              borderRadius: BorderRadius.all(Radius.circular(6.0))),
          playButton: Icon(
            Icons.play_circle_fill_outlined,
            size: 40.sp,
            color: Colors.white,
          ),
          pauseButton: Icon(
            Icons.pause_circle_filled_outlined,
            size: 40.sp,
            color: Colors.white,
          ),
          controlBarAvailable: true,
          controlBarPadding: const EdgeInsets.all(20),
          autoFadeOutControls: false,
          exitFullscreenOnEnd: true,
          systemUIModeAfterFullscreen: SystemUiMode.manual,
          enterFullscreenButton: Icon(
            Icons.fullscreen,
            size: 25.sp,
            color: Colors.white,
          ),
          exitFullscreenButton: Icon(
            Icons.fullscreen_exit_outlined,
            size: 25.sp,
            color: Colors.white,
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                  ),
                  width: size.width,
                  child: isInitial
                      ? SpinKitCircle(
                          color: Colors.white,
                          size: 80.0,
                        )
                      : CustomVideoPlayer(
                          customVideoPlayerController:
                              _customVideoPlayerController,
                        ),
                ),
              ),
            ),
            // Container(
            //   color: Colors.white,
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       Padding(
            //         padding: const EdgeInsets.symmetric(vertical: 12.0),
            //         child: Row(
            //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //           children: [
            //             Bounce(
            //                 duration: Duration(milliseconds: 500),
            //                 onPressed: () {
            //                   setState(() {
            //                     isMuted = !isMuted;
            //                   });
            //                   if (isMuted) {
            //                     _customVideoPlayerController.videoPlayerController
            //                         .setVolume(0.0);
            //                   } else {
            //                     _customVideoPlayerController.videoPlayerController
            //                         .setVolume(1.0);
            //                   }
            //                 },
            //                 child: Icon(
            //                   isMuted
            //                       ? Icons.volume_off_outlined
            //                       : Icons.volume_up_outlined,
            //                   size: 35.sp,
            //                   color: AppColorsTheme.black,
            //                 )),
            //             Bounce(
            //                 duration: Duration(milliseconds: 500),
            //                 onPressed: () {
            //                   _customVideoPlayerController.videoPlayerController
            //                       .seekTo(Duration(seconds: -10));
            //                 },
            //                 child: Row(
            //                   children: [
            //                     Icon(
            //                       Icons.arrow_back_ios_new_outlined,
            //                       size: 35.sp,
            //                       color: AppColorsTheme.black,
            //                     ),
            //                     Text(
            //                       "10",
            //                       style: TextStyle(
            //                           fontFamily: Constant().font,
            //                           color: AppColorsTheme.black,
            //                           fontWeight: FontWeight.w500,
            //                           fontSize: 14.sp),
            //                     ),
            //                   ],
            //                 )),
            //             Bounce(
            //                 duration: Duration(milliseconds: 500),
            //                 onPressed: () {
            //                   _customVideoPlayerController.videoPlayerController
            //                       .seekTo(Duration(seconds: 10));
            //                 },
            //                 child: Row(
            //                   children: [
            //                     Text(
            //                       "10",
            //                       style: TextStyle(
            //                           fontFamily: Constant().font,
            //                           color: AppColorsTheme.black,
            //                           fontWeight: FontWeight.w500,
            //                           fontSize: 14.sp),
            //                     ),
            //                     Icon(
            //                       Icons.arrow_forward_ios_outlined,
            //                       size: 35.sp,
            //                       color: AppColorsTheme.black,
            //                     ),
            //                   ],
            //                 )),
            //             Bounce(
            //                 duration: Duration(milliseconds: 500),
            //                 onPressed: () {
            //                   _customVideoPlayerController.setFullscreen(true);
            //                 },
            //                 child: Icon(
            //                   Icons.fullscreen,
            //                   size: 35.sp,
            //                   color: AppColorsTheme.black,
            //                 )),
            //           ],
            //         ),
            //       ),
            //       SizedBox(height: 10.h),
            //       // Text(
            //       //   "WEEK 1 DAY 1".toUpperCase(),
            //       //   style: TextStyle(
            //       //       fontFamily: Constant().font,
            //       //       color: Colors.black,
            //       //       fontWeight: FontWeight.w800,
            //       //       fontSize: 18.sp),
            //       // ),
            //       // SizedBox(height: 15.h),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
