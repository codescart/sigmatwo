
// import 'package:chess_app/screen/Dashboard/More.dart';
// import 'package:chess_app/screen/Dashboard/youtube.dart';
// import 'package:chess_app/screen/home/home1.dart';


import 'package:Sigma/constant/consstantcolor.dart';
import 'package:Sigma/dashboard/HomeDirectory/home.dart';
import 'package:Sigma/dashboard/MineDirectory/accountcontainer.dart';
import 'package:Sigma/dashboard/MineDirectory/mine.dart';
import 'package:Sigma/dashboard/NewsDirectory/news.dart';
import 'package:Sigma/dashboard/NewsDirectory/newslistview.dart';
import 'package:Sigma/dashboard/ProductDirectory/product.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import '../home/home.dart';


class bottom extends StatefulWidget {
  const bottom({Key ?key}) : super(key: key);

  @override
  State<bottom> createState() => _bottomState();
}

class _bottomState extends State<bottom> {
  final pages = [
     Home(),
    Product_page(),
    News(),
    Details_Page(),
    // First_home_page(),
    // Youtube(),
    // Details(),
  ];

  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final shouldPop = await showDialog<bool>(
          context: context,
          builder: (context) {
            return AlertDialog(
              shape:RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              shadowColor: Colors.black,
              title: Text('Are you sure?', style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.bold,
                color: black,
              ),),
              content: Text('Do you want to exit from App', style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.bold,
                color: black,
              ),),
              actionsAlignment: MainAxisAlignment.spaceBetween,
              actions: [
                TextButton(
                  onPressed: () {
                    SystemNavigator.pop();
                  },
                  child: const Text('Yes'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context, false);
                  },
                  child: const Text('No'),
                ),
              ],
            );
          },
        );
        return shouldPop!;
      },
      child: Scaffold(
        body: pages[pageIndex],
        bottomNavigationBar: buildMyNavBar(context),
      ),
    );
  }

  Container buildMyNavBar(BuildContext context) {
    return Container(
      height: 65,
      decoration:  BoxDecoration(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
        gradient: LinearGradient(
            colors: [bgcolor,lightblue],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter
        )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              IconButton(
                enableFeedback: false,
                onPressed: () {
                  setState(() {
                    pageIndex = 0;
                  });
                },
                icon: pageIndex == 0
                    ? const Icon(
                  Icons.home_filled,
                  color: lightred,
                  size: 20,
                )
                    : const Icon(
                  Icons.home_outlined,
                  color: black,
                  size: 20,
                ),
              ),
              pageIndex == 0?
              Text('Home' ,style: TextStyle(fontSize: 10,
                  color: lightred,fontWeight: FontWeight.bold
              ),):
              Text('Home' ,style: TextStyle(fontSize: 10,
                  color: black,fontWeight: FontWeight.bold
              ),),
            ],
          ),
          Column(
            children: [
              IconButton(
                enableFeedback: false,
                onPressed: () {
                  setState(() {
                    pageIndex = 1;
                  });
                },
                icon: pageIndex == 1
                    ? const Icon(
                  Icons.widgets,
                  color: lightred,
                  size: 20,
                )
                    : const Icon(
                  Icons.widgets_outlined,
                  color: black,
                  size: 20,
                ),
              ),
              pageIndex == 1?
              Text('Product' ,style: TextStyle(fontSize: 10,
                  color: lightred,fontWeight: FontWeight.bold
              ),):
              Text('Product' ,style: TextStyle(fontSize: 10,
                  color: black,fontWeight: FontWeight.bold
              ),),
            ],
          ),
          Column(
            children: [
              IconButton(
                enableFeedback: false,
                onPressed: () {
                  setState(() {
                    pageIndex = 2;
                  });
                },
                icon: pageIndex == 2
                    ? const Icon(
                  Icons.newspaper,
                  color: lightred,
                  size: 20,
                )
                    : const Icon(
                  Icons.newspaper_outlined,
                  color:black,
                  size: 20,
                ),
              ),
              pageIndex == 2?
              Text('News' ,style: TextStyle(fontSize: 10,
                  color: lightred,fontWeight: FontWeight.bold
              ),):
              Text('News' ,style: TextStyle(fontSize: 10,
                  color: black,fontWeight: FontWeight.bold
              ),),
            ],
          ),

          // Column(
          //   children: [
          //     IconButton(
          //       enableFeedback: false,
          //       onPressed: () {
          //         setState(() {
          //           pageIndex = 3;
          //         });
          //       },
          //       icon: pageIndex == 3
          //           ? const Icon(
          //         Icons.text_snippet,
          //         color: lightred,
          //         size: 20,
          //
          //       )
          //           : const Icon(
          //         Icons.text_snippet_outlined,
          //         color: black,
          //         size: 20,
          //       ),
          //     ),
          //     pageIndex == 3?
          //     Text('Status' ,style: TextStyle(fontSize: 10,
          //         color: lightred,fontWeight: FontWeight.bold
          //     ),):
          //     Text('Status' ,style: TextStyle(fontSize: 10,
          //         color: black,fontWeight: FontWeight.bold
          //     ),),
          //   ],
          // ),
          Column(
            children: [
              IconButton(
                enableFeedback: false,
                onPressed: () {
                  setState(() {
                    pageIndex = 3;
                  });
                },
                icon: pageIndex == 3
                    ? const Icon(
                  Icons.person,
                  color: lightred,
                  size: 20,
                )
                    : const Icon(
                  Icons.person_outline,
                  color: black,
                  size: 20,
                ),
              ),
              pageIndex == 3?
              Text('Mine' ,style: TextStyle(fontSize: 10,
                  color: lightred,fontWeight: FontWeight.bold
              ),):
              Text('Mine' ,style: TextStyle(fontSize: 10,
                  color: black,fontWeight: FontWeight.bold
              ),),
            ],
          ),
        ],
      ),
    );
  }
}
