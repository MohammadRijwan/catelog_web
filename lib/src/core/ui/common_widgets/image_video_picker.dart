import 'package:catelog_web/src/core/util/theme.dart';
import 'package:flutter/material.dart';

class ImageVideoPickerWidget extends StatelessWidget {
  final Function pickVideo;
  final Function pickImage;

  const ImageVideoPickerWidget(
      {super.key, required this.pickVideo, required this.pickImage});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showBottomSheet(
          context: context,
          builder: (ctx) => Container(
            color: Colors.white,
            width: MediaQuery.of(ctx).size.width,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: InkWell(
                        onTap: () {
                          Navigator.pop(ctx);
                        },
                        child: const Icon(Icons.close)),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    pickImage();
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Container(
                      color: Colors.black12,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Add Images',
                              style: Theme.of(ctx)
                                  .textTheme
                                  .displayMedium!
                                  .copyWith(fontSize: 16),
                            ),
                            const Icon(
                              Icons.add_a_photo_outlined,
                              size: 25,
                              color: colorPrimary,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    pickVideo();
                    Navigator.pop(ctx);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Container(
                      color: Colors.black12,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Add Videos',
                              style: Theme.of(ctx)
                                  .textTheme
                                  .displayMedium!
                                  .copyWith(
                                    fontSize: 16,
                                  ),
                            ),
                            const SizedBox(width: 10),
                            const Icon(
                              Icons.video_collection_outlined,
                              size: 25,
                              color: colorPrimary,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        );
      },
      child: const Icon(
        Icons.add_a_photo_outlined,
        color: colorPrimary,
      ),
    );
  }
}
