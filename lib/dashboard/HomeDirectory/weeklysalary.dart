import 'dart:convert';


import 'package:Sigma/buttonconstant/backbutton.dart';
import 'package:Sigma/constant/apiconstant.dart';

import 'package:flutter/material.dart';
import 'package:Sigma/constant/consstantcolor.dart';
import 'package:Sigma/constant/textstyleconstant.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class WEEKLYSALARY extends StatefulWidget {
  const WEEKLYSALARY({Key? key}) : super(key: key);

  @override
  State<WEEKLYSALARY> createState() => _WEEKLYSALARYState();
}

class _WEEKLYSALARYState extends State<WEEKLYSALARY> {


  @override
  void initState() {
    weeklysalary();
    super.initState();
  }





  @override
  Widget build(BuildContext context) {

    return SafeArea(
        child: Scaffold(
          backgroundColor: bgcolor,
          appBar: AppBar(
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
            leading: CustomBackButton(),
            centerTitle: true,
            title: Text(
              'WEEKLY SALARY',
              style: TextStyle(
                  fontSize: 20.sp, fontWeight: FontWeight.w900, color: black),
            ),

          ),
          body:map==null?
          Center(child: CircularProgressIndicator()):
          ListView(
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            children: [
              Center(
                child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                          child: HtmlWidget(
                            map['weekly_salary']
                          ),
                        ),
              )

            ],

          ),
        ));
  }


  var  map;
  weeklysalary() async {
    final prefs = await SharedPreferences.getInstance();
    final userid = prefs.getString("userId");
    final response = await http.get(
      Uri.parse(Apiconst.weekly_salary),

    );
    var data = jsonDecode(response.body);
    print(data);
    print("mmmmmmmmmmmm");
    if (data['status'] == '200') {
      setState(() {
        map = data['data'];
      });
    }
  }

}
