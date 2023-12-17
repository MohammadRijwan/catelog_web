import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';

class FilePickerDep {
  ///  pick image from gallery
  Future<List<File>> pickImagesOrVideo(
      {int noOfImages = 6,
      bool isVideo = false,
      bool isCropEnable = false,
      bool isMultiple = false}) async {
    return await filePicker(
        type: isVideo ? FileType.video : FileType.image,
        isMultiple: isMultiple);
  }

  Future<List<File>> filePicker({
    required FileType type,
    bool isMultiple = false,
  }) async {
    List<File> fileList = [];
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: type,
        allowMultiple: isMultiple,
        allowCompression: true,
      );
      if (result != null) {
        result.files.forEach((element) {
          fileList.add(File(element.path!));
        });
      }
    } on PlatformException catch (e) {
      print(e);
    }
    return fileList;
  }
}
