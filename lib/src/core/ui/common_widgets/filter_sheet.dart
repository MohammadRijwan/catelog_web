// import 'package:catalogue/src/core/domain/common/app_enum.dart';
// import 'package:catalogue/src/core/ui/theme.dart';
// import 'package:catalogue/src/feature/home/ui/home_vm.dart';
// import 'package:flutter/material.dart';
//
// int titleSort = 0;
// int dateSort = 0;
// int productPrice = 0;
//
// class FilterSheet extends StatefulWidget {
//   final HomeVm homeVm;
//
//   const FilterSheet({Key? key, required this.homeVm}) : super(key: key);
//
//   @override
//   State<FilterSheet> createState() => _FilterSheetState();
// }
//
// class _FilterSheetState extends State<FilterSheet> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(16),
//         ),
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.all(12.0),
//             child: Stack(
//               children: [
//                 Column(
//                   children: [
//                     Container(
//                       height: 3,
//                       width: 100,
//                       decoration: BoxDecoration(
//                         color: Colors.black.withOpacity(0.4),
//                         borderRadius: BorderRadius.circular(16),
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 35,
//                     ),
//                     Align(
//                       alignment: Alignment.centerLeft,
//                       child: Text(
//                         'Sort By Name',
//                         style: Theme.of(context).textTheme.headline3,
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 25,
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         InkWell(
//                           onTap: () async {
//                             setState(() {
//                               titleSort = 1;
//                               dateSort = 0;
//                               productPrice = 0;
//                             });
//                             widget.homeVm.shortList(SortProductBy.NameAtoZ);
//                           },
//                           child: Container(
//                             padding: const EdgeInsets.all(10),
//                             decoration: BoxDecoration(
//                               border: Border.all(),
//                               color: titleSort == 1
//                                   ? colorPrimary
//                                   : Colors.transparent,
//                               borderRadius: BorderRadius.circular(6),
//                             ),
//                             child: Text(
//                               'A to Z',
//                               style: Theme.of(context)
//                                   .textTheme
//                                   .headline4!
//                                   .copyWith(
//                                     color: titleSort == 1
//                                         ? Colors.white
//                                         : Colors.black,
//                                   ),
//                             ),
//                           ),
//                         ),
//                         const SizedBox(
//                           width: 15,
//                         ),
//                         InkWell(
//                           onTap: () async {
//                             setState(() {
//                               titleSort = 2;
//                               dateSort = 0;
//                               productPrice = 0;
//                             });
//                             widget.homeVm.shortList(SortProductBy.NameZtoA);
//                           },
//                           child: Container(
//                             padding: const EdgeInsets.all(10),
//                             decoration: BoxDecoration(
//                               border: Border.all(),
//                               color: titleSort == 2
//                                   ? colorPrimary
//                                   : Colors.transparent,
//                               borderRadius: BorderRadius.circular(6),
//                             ),
//                             child: Text(
//                               'Z to A',
//                               style: Theme.of(context)
//                                   .textTheme
//                                   .headline4!
//                                   .copyWith(
//                                     color: titleSort == 2
//                                         ? Colors.white
//                                         : Colors.black,
//                                   ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(
//                       height: 35,
//                     ),
//                     Align(
//                       alignment: Alignment.centerLeft,
//                       child: Text(
//                         'Sort By Date',
//                         style: Theme.of(context).textTheme.headline3,
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 25,
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         InkWell(
//                           onTap: () async {
//                             setState(() {
//                               dateSort = 1;
//                               titleSort = 0;
//                               productPrice = 0;
//                             });
//                             widget.homeVm.shortList(SortProductBy.DateOldToNew);
//                           },
//                           child: Container(
//                             padding: const EdgeInsets.all(10),
//                             decoration: BoxDecoration(
//                               border: Border.all(),
//                               color: dateSort == 1
//                                   ? colorPrimary
//                                   : Colors.transparent,
//                               borderRadius: BorderRadius.circular(6),
//                             ),
//                             child: Text(
//                               'Oldest to Newest',
//                               style: Theme.of(context)
//                                   .textTheme
//                                   .headline4!
//                                   .copyWith(
//                                     color: dateSort == 1
//                                         ? Colors.white
//                                         : Colors.black,
//                                   ),
//                             ),
//                           ),
//                         ),
//                         const SizedBox(
//                           width: 15,
//                         ),
//                         InkWell(
//                           onTap: () async {
//                             setState(() {
//                               dateSort = 2;
//                               titleSort = 0;
//                               productPrice = 0;
//                             });
//                             widget.homeVm.shortList(SortProductBy.DateNewToOld);
//                           },
//                           child: Container(
//                             padding: const EdgeInsets.all(10),
//                             decoration: BoxDecoration(
//                               border: Border.all(),
//                               color: dateSort == 2
//                                   ? colorPrimary
//                                   : Colors.transparent,
//                               borderRadius: BorderRadius.circular(6),
//                             ),
//                             child: Text(
//                               'Newest to Oldest',
//                               style: Theme.of(context)
//                                   .textTheme
//                                   .headline4!
//                                   .copyWith(
//                                     color: dateSort == 2
//                                         ? Colors.white
//                                         : Colors.black,
//                                   ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(
//                       height: 35,
//                     ),
//                     Align(
//                       alignment: Alignment.centerLeft,
//                       child: Text(
//                         'Sort By Event Venue',
//                         style: Theme.of(context).textTheme.headline3,
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 25,
//                     ),
//                     Row(
//                       children: [
//                         InkWell(
//                           onTap: () async {
//                             setState(() {
//                               titleSort = 0;
//                               dateSort = 0;
//                               productPrice = 1;
//                             });
//                             widget.homeVm
//                                 .shortList(SortProductBy.EventVenueAtoZ);
//                           },
//                           child: Container(
//                             padding: const EdgeInsets.all(10),
//                             decoration: BoxDecoration(
//                               border: Border.all(),
//                               color: productPrice == 1
//                                   ? colorPrimary
//                                   : Colors.transparent,
//                               borderRadius: BorderRadius.circular(6),
//                             ),
//                             child: Text(
//                               'A to Z',
//                               style: Theme.of(context)
//                                   .textTheme
//                                   .headline4!
//                                   .copyWith(
//                                     color: productPrice == 1
//                                         ? Colors.white
//                                         : Colors.black,
//                                   ),
//                             ),
//                           ),
//                         ),
//                         const SizedBox(
//                           width: 15,
//                         ),
//                         InkWell(
//                           onTap: () async {
//                             setState(() {
//                               titleSort = 0;
//                               dateSort = 0;
//                               productPrice = 2;
//                             });
//                             widget.homeVm
//                                 .shortList(SortProductBy.EventVenueZtoA);
//                           },
//                           child: Container(
//                             padding: const EdgeInsets.all(10),
//                             decoration: BoxDecoration(
//                               border: Border.all(),
//                               color: productPrice == 2
//                                   ? colorPrimary
//                                   : Colors.transparent,
//                               borderRadius: BorderRadius.circular(6),
//                             ),
//                             child: Text(
//                               'Z to A',
//                               style: Theme.of(context)
//                                   .textTheme
//                                   .headline4!
//                                   .copyWith(
//                                     color: productPrice == 2
//                                         ? Colors.white
//                                         : Colors.black,
//                                   ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     )
//                   ],
//                 ),
//                 Positioned(
//                   right: -10.0,
//                   top: -10.0,
//                   child: IconButton(
//                     onPressed: () {
//                       Navigator.pop(context);
//                     },
//                     icon: Icon(Icons.close_rounded),
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ));
//   }
// }
