// import 'package:Sigma/Widgets/rectanglebutton.dart';
// import 'package:Sigma/constant/consstantcolor.dart';
// import 'package:Sigma/constant/constantbutton.dart';
// import 'package:Sigma/constant/textstyleconstant.dart';
// import 'package:flutter/material.dart';
//
// class Aquatic extends StatefulWidget {
//   const Aquatic({Key? key}) : super(key: key);
//
//   @override
//   State<Aquatic> createState() => _AquaticState();
// }
//
// class _AquaticState extends State<Aquatic> {
//   @override
//   Widget build(BuildContext context) {
//     final width = MediaQuery.of(context).size.width;
//     final height = MediaQuery.of(context).size.height;
//     return ListView.builder(itemCount: 7,
//         shrinkWrap: true,
//         // physics: NeverScrollableScrollPhysics(),
//         itemBuilder: (BuildContext context,int index){
//       return Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           children: [
//             Container(
//               height: height*0.35,
//               width:width*0.6,
//               decoration: BoxDecoration( borderRadius: BorderRadius.all(Radius.circular(10)),
//                   color: white),
//               child: Column(crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Card(elevation: 3,
//                     child: Container(
//                       height: height*0.16,
//                       width: width*0.9,
//
//                       decoration: BoxDecoration( borderRadius: BorderRadius.only(bottomRight: Radius.circular(15),
//                           bottomLeft: Radius.circular(15)),
//                           color: Colors.white),
//                     ),
//                   ),
//                   Text("F-630",style: F630,),
//
//                   RichText(
//                     text: TextSpan(
//                       text: 'Term: ',
//                       style: terms,
//                       children: const <TextSpan>[
//                         TextSpan(text: '45Days', style: days),
//
//                       ],
//                     ),
//                   ),
//                   SizedBox(height: height*0.01,),
//                   RichText(
//                     text: TextSpan(
//                       text: 'Daily income: ',
//                       style: terms,
//                       children: const <TextSpan>[
//                         TextSpan(text: 'Rs38', style: days),
//
//                       ],
//                     ),
//                   ),
//                   SizedBox(height: height*0.01,),
//                   RichText(
//                     text: TextSpan(
//                       text: 'Total revenue: ',
//                       style: terms,
//                       children: const <TextSpan>[
//                         TextSpan(text: 'Rs1710', style: days),
//
//                       ],
//                     ),
//                   ),
//                   constantbutton(onTap: () {  }, text: 'Join Project',)
//                 ],
//               ),
//             ),
//           ],
//         ),
//       );
//         }
//         ) ;
//   }
// }
