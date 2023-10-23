import 'dart:convert';

import 'package:Sigma/Widgets/rectanglebutton.dart';
import 'package:Sigma/constant/apiconstant.dart';
import 'package:Sigma/constant/assetsconstant.dart';
import 'package:Sigma/constant/consstantcolor.dart';
import 'package:Sigma/constant/launchermsg.dart';
import 'package:Sigma/constant/textstyleconstant.dart';
import 'package:Sigma/dashboard/HomeDirectory/gridview.dart';
import 'package:Sigma/dashboard/HomeDirectory/slider.dart';
import 'package:Sigma/dashboard/HomeDirectory/team_commisionhome.dart';
import 'package:Sigma/main.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:http/http.dart'as http;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Widget build(BuildContext context) {
    final height=MediaQuery.of(context).size.height;
    final width=MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
      backgroundColor: bgcolor,
      floatingActionButton: InkWell(
        onTap: (){
         Launcher.openwhatsapp(context);
        },
        child: CircleAvatar(

          backgroundColor:Colors.transparent,
          radius: 28,

          backgroundImage: AssetImage(whatsaap), ),
      ),
      appBar: AppBar(
        backgroundColor:Colors.transparent,
        flexibleSpace: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
                gradient: LinearGradient(
                    colors: [lightblue, bgcolor],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter))),
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Container(
          height: height * 0.03,
          decoration:
              BoxDecoration(image: DecorationImage(image: AssetImage(Adani))),
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        children: [
          SizedBox(
            height: height * 0.05,
          ),
          SliderPage(),

          Grid_ViewPage(),
          SizedBox(
            height: height * 0.03,
          ),
          teamcommission(),

          // Tab_Page(),
        ],
      ),
    ));
  }


}
