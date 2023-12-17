// import 'package:catalogue/src/feature/product/domain/model/product.dart';
// import 'package:flutter/material.dart';
//
// class ProductWidget extends StatelessWidget {
//   final Product product;
//   final Widget productImage;
//   final Function onDeleteTap;
//   final Function onRemoveItemFromCart;
//   final Function onAddItemToCart;
//   final bool isDeleteEnable;
//   final bool isWhiteFontColor;
//   final bool isCartShow;
//   final int cartQty;
//
//   const ProductWidget({
//     Key? key,
//     required this.product,
//     required this.onDeleteTap,
//     this.isDeleteEnable = false,
//     this.isWhiteFontColor = false,
//     required this.onRemoveItemFromCart,
//     required this.onAddItemToCart,
//     required this.cartQty,
//     this.isCartShow = true,
//     required this.productImage,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             productImage,
//             Padding(
//               padding: const EdgeInsets.only(left: 8.0, top: 4.0),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   ConstrainedBox(
//                     constraints: const BoxConstraints(maxWidth: 150),
//                     child: Text(
//                       '${product.name.toUpperCase()}\n',
//                       style: Theme.of(context)
//                           .textTheme
//                           .displayMedium!
//                           .copyWith(
//                             color:
//                                 isWhiteFontColor ? Colors.white : Colors.black,
//                             fontSize: 18,
//                             fontWeight: FontWeight.bold,
//                           ),
//                       maxLines: 3,
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                   ),
//                   ConstrainedBox(
//                     constraints: const BoxConstraints(maxWidth: 150),
//                     child: Text(
//                       product.desc,
//                       maxLines: 2,
//                       overflow: TextOverflow.ellipsis,
//                       style: Theme.of(context)
//                           .textTheme
//                           .displayMedium!
//                           .copyWith(
//                             color:
//                                 isWhiteFontColor ? Colors.white : Colors.black,
//                             fontSize: 12,
//                             fontWeight: FontWeight.normal,
//                           ),
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   Text(
//                     '₹${product.price}',
//                     style: Theme.of(context).textTheme.displayMedium!.copyWith(
//                           color: isWhiteFontColor ? Colors.white : Colors.black,
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold,
//                         ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//         if (isCartShow)
//           Positioned(
//             bottom: 0.0,
//             right: 0.0,
//             child: Row(
//               children: [
//                 const Text(
//                   'Qty: ',
//                   style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
//                 ),
//                 Container(
//                   decoration: BoxDecoration(
//                       border: Border.all(color: Colors.deepOrange),
//                       borderRadius: BorderRadius.circular(4.0)),
//                   child: Row(
//                     children: [
//                       InkWell(
//                           onTap: () {
//                             onRemoveItemFromCart();
//                           },
//                           child: const Icon(Icons.remove)),
//                       Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                         child: Text(
//                           cartQty.toString(),
//                           style: const TextStyle(
//                               fontSize: 20.0, fontWeight: FontWeight.bold),
//                         ),
//                       ),
//                       InkWell(
//                           onTap: () {
//                             onAddItemToCart();
//                           },
//                           child: const Icon(Icons.add)),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//       ],
//     );
//   }
// }
