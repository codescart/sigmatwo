import 'dart:async';

import 'package:Sigma/auth/backgrounddesigen.dart';
import 'package:Sigma/constant/assetsconstant.dart';
import 'package:Sigma/constant/consstantcolor.dart';
import 'package:Sigma/dashboard/dashboard.dart';
import 'package:Sigma/main.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splash_SCreen extends StatefulWidget {
  const Splash_SCreen({Key? key}) : super(key: key);

  @override
  State<Splash_SCreen> createState() => _Splash_SCreenState();
}

class _Splash_SCreenState extends State<Splash_SCreen> {
  @override
  void initState() {
    super.initState();
    harsh();
  }

  harsh()async{
    final prefs = await SharedPreferences.getInstance();
    final userid=prefs.getString("userId")??'0';
    print('nnnnnnnnnnnnnnn');
    print(userid);
    print('mmmmmmmmmmmmmmm');

    print('oooooooooooooo');

    userid !='0'?Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => bottom()))
        : Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => Background_desigen(),
      ),
    );

    // Timer(Duration(seconds: 3),
    //       ()=> userid !='0'?Navigator.pushReplacement(
    //       context, MaterialPageRoute(builder: (context) => bottom()))
    //       : Navigator.pushReplacement(
    //     context,
    //     MaterialPageRoute(
    //       builder: (context) => Background_desigen(),
    //     ),
    //   ),
    // );
  }
  @override
  Widget build(BuildContext context) {
     width = MediaQuery.of(context).size.width;
     height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: bgcolor,
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [lightblue, bgcolor],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter)),
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: height*0.15,),
            Center(
              child: Container(
                height: height*0.075,
                width: width*0.75,

                decoration: BoxDecoration(image: DecorationImage(
                    image: AssetImage(Adani),fit: BoxFit.fill)),
              ),
            ),
            SizedBox(height: height*0.15,),
            CircularProgressIndicator(
              color: black,
              strokeWidth: 6,

            )
          ],
        ),
      ),
    );
  }
}
