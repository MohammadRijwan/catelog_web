import 'package:flutter/services.dart';
import 'package:images_picker/images_picker.dart';

class ImagesPickerDep {
  late List<Media> file = [];

  ///  pick image from gallery
  Future<List<Media>> pickImagesOrVideoFromGallery(
      {int noOfImages = 6,
      bool isVideo = false,
      bool isCropEnable = false}) async {
    return await _imagesPicker(
        count: noOfImages, isVideo: isVideo, isCropEnable: isCropEnable);
  }

  ///  pick image from camera
  Future<List<Media>> pickImagesOrVideoFromCamera(
      {bool isCropEnable = false, bool isVideo = false}) async {
    return await _pickImagesOrVideoFromCamera(
        isCropEnable: isCropEnable, isVideo: isVideo);
  }

  ///  pick multiple image
  Future<List<Media>> pickMultipleImage(
      {bool isCropEnable = false, bool isVideo = false}) async {
    return await _imagesPicker(
        count: 5, isVideo: isVideo, isCropEnable: isCropEnable);
  }

  /// private function
  Future<List<Media>> _imagesPicker({
    int count = 1,
    required bool isVideo,
    required bool isCropEnable,
  }) async {
    List<Media>? pickedFileList = [];
    try {
      pickedFileList = await ImagesPicker.pick(
        count: count,
        pickType: isVideo ? PickType.video : PickType.image,
        language: Language.System,
        quality: 0.5,
        cropOpt: isCropEnable ? CropOption() : null,
      );
    } on PlatformException catch (e) {
      print(e);
    }
    return pickedFileList!;
  }

  Future<List<Media>> _pickImagesOrVideoFromCamera(
      {required bool isCropEnable, required bool isVideo}) async {
    List<Media>? pickedFileList = [];
    try {
      pickedFileList = await ImagesPicker.openCamera(
        pickType: isVideo ? PickType.video : PickType.image,
        language: Language.System,
        quality: 0.5,
        cropOpt: isCropEnable
            ? CropOption(
                cropType: CropType.rect,
                aspectRatio: CropAspectRatio.wh16x9,
              )
            : null,
      );
    } on PlatformException catch (e) {
      print(e);
    }
    return pickedFileList!;
  }
}
