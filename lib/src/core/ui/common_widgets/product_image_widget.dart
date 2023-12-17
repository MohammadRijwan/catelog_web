// import 'dart:io';
//
// import 'package:catalogue/src/feature/product/domain/usecase/product_usecase.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
//
// class ProductImageWidget extends StatefulWidget {
//   final int productId;
//   const ProductImageWidget({super.key, required this.productId});
//
//   @override
//   State<ProductImageWidget> createState() => _ProductImageWidgetState();
// }
//
// class _ProductImageWidgetState extends State<ProductImageWidget> {
//   File? imageUrl;
//
//   @override
//   void initState() {
//     loadImage();
//     super.initState();
//   }
//
//   loadImage() async {
//     print("Loading  image...");
//     var path = await ProductUseCase().getImagePath(widget.productId);
//     setState(() {
//       imageUrl = File(path);
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     loadImage();
//     return Container(
//       decoration: const BoxDecoration(
//           borderRadius: BorderRadius.all(Radius.circular(16.0))),
//       child: imageUrl != null
//           ? Image.file(
//               imageUrl!,
//               height: 140,
//               errorBuilder: (context, url, error) =>
//                   Image.asset('assets/empty.png'),
//               width: 140,
//               fit: BoxFit.cover,
//             )
//           : const SizedBox(
//               height: 140,
//               width: 140,
//               child: Center(
//                 child: SpinKitCircle(
//                   color: Colors.orange,
//                 ),
//               ),
//             ),
//     );
//   }
// }
