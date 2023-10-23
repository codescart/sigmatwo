import 'dart:convert';

import 'package:Sigma/Widgets/rectanglebutton.dart';
import 'package:Sigma/buttonconstant/backbutton.dart';
import 'package:Sigma/constant/apiconstant.dart';
import 'package:Sigma/constant/assetsconstant.dart';
import 'package:Sigma/constant/consstantcolor.dart';
import 'package:Sigma/constant/flushbar.dart';
import 'package:Sigma/constant/textstyleconstant.dart';
import 'package:Sigma/dashboard/HomeDirectory/bonusrecord.dart';
import 'package:Sigma/dashboard/HomeDirectory/withdrawlrecord.dart';
import 'package:Sigma/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart'as http;

class Bonus_Page extends StatefulWidget {
  const Bonus_Page({Key? key}) : super(key: key);


  @override
  State<Bonus_Page> createState() => _Bonus_PageState();
}

class _Bonus_PageState extends State<Bonus_Page> {
  bool _loading=true;
  TextEditingController bonusController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final height=MediaQuery.of(context).size.height;
    final width=MediaQuery.of(context).size.width;
    return SafeArea(child:
    Scaffold(
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
          title: Text('BONUS',
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 20.sp,
              color: black,
            ), ),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Bonus_Record()));
              },
              child: Text('Record',
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w900,
                      color: black)))
        ],
      ),
      body: Padding(
        padding:  EdgeInsets.all(25.0),
        child: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: height*0.45,
              width: width,
              decoration: BoxDecoration(image: DecorationImage(image:AssetImage(Bonusbgimg),
                  fit: BoxFit.fill
              )),
            ),

            // SizedBox(height: height*0.08,),

            SizedBox(height: height*0.05,),
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
              elevation: 5,
              child: Column(
                children: [
                  SizedBox(height: height*0.03,),
                  Padding(
                    padding:  EdgeInsets.all(8.0),
                    child: TextField(
                      controller: bonusController,
                      decoration: InputDecoration(
                        border:   OutlineInputBorder(),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              width: 1, color: Colors.black),
                        ),
                        focusedBorder:
                        UnderlineInputBorder(
                          borderSide: BorderSide(
                              width: 1, color: Colors.black),
                        ),
                        hintText: "Please enter Bonus code",
                      ),
                    ),
                  ),
                  SizedBox(height: height*0.03,),
                  CustomButton(onTap: () {
                    Bonus(bonusController.text);
                  }, text: 'Receive',)
                ],
              ),
            ),

          ],
          ),
        ),
      ),
    ));
  }
Bonus(String bonusController,)async {
    final prefs = await SharedPreferences.getInstance();
    final userid = prefs.getString("userId");
    setState(() {
      _loading=true;
    });

    final response =  await http.post(Uri.parse(Apiconst.Reedembonus),
      headers:<String ,String>{
        "Content-Type":"application/json; charset=UTF-8",
      },
      body: jsonEncode(<String ,String>{

        "userid":'$userid',
       "bonuscode":bonusController,
      }),
    );
    var data = jsonDecode(response.body);
    print(data);
    print('qqqqqqqqqqqqqqqqqq');
    if(data["status"]=='200'){

      setState(() {
        _loading=false;
      });
      Navigator.pop(context);
      Utils.flushBarsuccessMessage(data["msg"],context,white);
    }
    else{
      setState(() {
        _loading= false;
      });
      Utils.flushBarErrorMessage( data["msg"],context,white);
    }

  }
}
