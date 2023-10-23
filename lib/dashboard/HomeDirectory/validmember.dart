import 'dart:convert';

import 'package:Sigma/buttonconstant/backbutton.dart';
import 'package:Sigma/constant/consstantcolor.dart';
import 'package:Sigma/constant/textstyleconstant.dart';
import 'package:Sigma/dashboard/HomeDirectory/bonusrecord.dart';
import 'package:Sigma/product/ProductController/teamcommission_controller.dart';
import 'package:Sigma/product/homedcontroller/commissioncontrolletr.dart';
import 'package:Sigma/product/homedcontroller/validmyteamcontroller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart'as http;
import '../../constant/apiconstant.dart';



class Valid_Member extends StatefulWidget {
  @override
  _Valid_MemberState createState() => _Valid_MemberState();
}

class _Valid_MemberState extends State<Valid_Member> {
  int _selectedCategoryIndex = 0;
  Color _containerColor = Colors.white;

  void _changeCategory(int index) {
    setState(() {
      _selectedCategoryIndex = index;
      _containerColor = lightblue; // Change container color when category is tapped
    });
  }

  @override
  Widget build(BuildContext context) {

    return ListView(
        shrinkWrap: true,

        children: [
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Container(
              width: 300,
              height: 40,

              decoration: BoxDecoration(
                border: Border.all(width: 1,color: lightblue),
                color: _containerColor,
              ),
              child: FutureBuilder<List<teamcommisioncontroller>>(
                  future: qwe(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    else if (snapshot.hasError) {
                      return Center(
                        child: Text('Error: ${snapshot.error}'),
                      );
                    }
                    else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return Center(
                        child: Text(
                          "No Data Avilable",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15.sp,
                            color: black,
                          ),
                        ),
                      );
                    }
                    else  {
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: snapshot.data!.length, // Number of categories
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              _changeCategory(index);
                            },
                            child: Container(
                              width: 100,
                              color: _selectedCategoryIndex == index ? lightblue : Colors.white,

                              child: Center(child: Text('${snapshot.data![index].lavelStage}'+'-'''
                                  '${snapshot.data![index].commission}'+'%'+"("+'${snapshot.data![index].count}'+")",
                                style: Lv1,)),
                            ),
                          );
                        },
                      );}
                  }
              ),
            ),
          ),
          SizedBox(height: 10,),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                      width:80,
                      child: Center(child: Text("account".toUpperCase(),style: Lv1,))),
                  Text("level".toUpperCase(),style: Lv1,),
                  Text("registration time".toUpperCase(),style: Lv1,),


                ],
              ),
              SizedBox(height: 10,),
              FutureBuilder<List<Valid_My_TeamController>>(
                  future: _comision(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    else if (snapshot.hasError) {
                      return Center(
                        child: Text('Error: ${snapshot.error}'),
                      );
                    }
                    else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return Center(
                        child: Text(
                          "No Data Avilable",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15.sp,
                            color: black,
                          ),
                        ),
                      );
                    }
                    else  {
                      return ListView.builder(
                        physics: BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: snapshot.data!.length, // Number of categories
                        itemBuilder: (context, index) {
                          return   Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [

                                    Text('${snapshot.data![index].mobile}',style: Lv1,),
                                    Text('${snapshot.data![index].lavelStage}'.toUpperCase(),style: Lv1,),
                                    Text('${snapshot.data![index].createdAt}',style: Lv1,),
                                  ],
                                ),
                              ),
                              Divider(thickness: 1.5,)
                            ],
                          );
                        },
                      );}
                  }
              ),
            ],
          )

        ],
      );

  }
  Future<List<teamcommisioncontroller>> qwe()  async {
    _selectedCategoryIndex;
    final prefs = await SharedPreferences.getInstance();
    final userid = prefs.getString("userId");
    print(userid);
    final response = await http.get(
        Uri.parse(Apiconst.teamcomission+'$userid'));
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body)['data'] as List<dynamic>;
      print(response);
      print('kkkkkkkkkkkkkkkkkkkkkkkk');
      return jsonData.map((item) => teamcommisioncontroller.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }
  Future<List<Valid_My_TeamController>> _comision()  async {

    var ind=_selectedCategoryIndex.toString();
    final prefs = await SharedPreferences.getInstance();
    final userid = prefs.getString("userId");
    print(userid);
    print( _selectedCategoryIndex);
    print("🍕🍕🍕🍕🍕🍕🍕🍕🍕🍕🍕");
    final response = await http.get(
        Uri.parse(Apiconst.Myteamactive+'$userid&index=$ind'));
    final data =json.decode(response.body);
    print(data);
    if (data['status'] == "200") {
      final jsonData = json.decode(response.body)['data'] as List<dynamic>;
      print(jsonData);

      return jsonData.map((item) => Valid_My_TeamController.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }
}
