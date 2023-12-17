// import 'package:catalogue/src/core/ui/common_widgets/product_widget.dart';
// import 'package:catalogue/src/feature/product/domain/model/product.dart';
// import 'package:flutter/material.dart';
//
// class ProductCard extends StatelessWidget {
//   final Product product;
//   final Widget productImage;
//   final int cartQty;
//   final Function onCardDoubleTap;
//   final Function onSingleTap;
//   final Function onAddItemToCart;
//   final Function onRemoveItemFromCart;
//   final bool isOpen;
//
//   const ProductCard({
//     Key? key,
//     required this.product,
//     required this.onCardDoubleTap,
//     required this.isOpen,
//     required this.onSingleTap,
//     required this.onAddItemToCart,
//     required this.onRemoveItemFromCart,
//     this.cartQty = 0,
//     required this.productImage,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;
//     return InkWell(
//       onDoubleTap: () => onCardDoubleTap(),
//       onTap: () {
//         onSingleTap();
//       },
//       child: Container(
//         margin: const EdgeInsets.all(5),
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Container(
//                 decoration: BoxDecoration(
//                     border: Border.all(
//                       color: Colors.orange,
//                     ),
//                     borderRadius: const BorderRadius.all(Radius.circular(20))),
//                 padding:
//                     const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
//                 child: InkWell(
//                   onTap: () => onCardDoubleTap(),
//                   child: ProductWidget(
//                     product: product,
//                     cartQty: cartQty,
//                     onDeleteTap: () {},
//                     onAddItemToCart: onAddItemToCart,
//                     onRemoveItemFromCart: onRemoveItemFromCart,
//                     productImage: productImage,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
