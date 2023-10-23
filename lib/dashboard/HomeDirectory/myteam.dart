import 'package:Sigma/buttonconstant/backbutton.dart';
import 'package:Sigma/constant/consstantcolor.dart';
import 'package:Sigma/dashboard/HomeDirectory/invalidmember.dart';
import 'package:Sigma/dashboard/HomeDirectory/validmember.dart';
import 'package:Sigma/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class My_Team extends StatefulWidget {
  const My_Team({Key? key}) : super(key: key);

  @override
  State<My_Team> createState() => _My_TeamState();
}

class _My_TeamState extends State<My_Team> with TickerProviderStateMixin{


  @override
  Widget build(BuildContext context) {
    final height=MediaQuery.of(context).size.height;
    final width=MediaQuery.of(context).size.width;
    TabController _tabContrller = TabController(length: 2, vsync: this);
    return SafeArea(child: Scaffold(
      backgroundColor: bgcolor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        flexibleSpace: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
                gradient: LinearGradient(
                    colors: [lightblue,bgcolor],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter
                )
            )
        ),
        automaticallyImplyLeading: false,
        leading: CustomBackButton(),
        centerTitle: true,
        title: Text('MY TEAM',
          style: TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 20.sp,
            color: black,
          ), ),

      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Container(
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(10),
                 color: lightgray2
               ),

                child: TabBar(
                  controller: _tabContrller,
                  unselectedLabelColor:black,
                  labelColor: lightblue,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicatorColor: lightblue,

                  tabs: [
                    Tab(
                      text: ("Invalid Member"),
                    ),
                    // Tab(
                    //   text: ("ONCOMING"),
                    // ),
                    Tab(
                      text: ("Valid Member"),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            height: height*0.77,
            child:  TabBarView(controller: _tabContrller, children: [
              Invalid_Member(),
              Valid_Member(),

            ]),
          )
        ],
      ),
    ));
  }
}
