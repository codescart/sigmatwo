import 'dart:convert';

import 'package:Sigma/Widgets/rectanglebutton.dart';
import 'package:Sigma/constant/apiconstant.dart';
import 'package:Sigma/constant/assetsconstant.dart';
import 'package:Sigma/constant/consstantcolor.dart';
import 'package:Sigma/constant/textstyleconstant.dart';
import 'package:Sigma/dashboard/HomeDirectory/viewallcommision.dart';
import 'package:Sigma/main.dart';
import 'package:Sigma/product/ProductController/teamcommission_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart'as http;


class teamcommission extends StatefulWidget {
  const teamcommission({Key? key}) : super(key: key);

  @override
  State<teamcommission> createState() => _teamcommissionState();
}

class _teamcommissionState extends State<teamcommission> {
  @override
  Widget build(BuildContext context) {
    final height=MediaQuery.of(context).size.height;
    final width=MediaQuery.of(context).size.width;
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 3,
        child: Container(
          height: height * 0.18,
          width: width * 0.01,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: white),
          child: Column(
            children: [
              Container(
                height: height * 0.08,
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
                              fontSize: width/20,
                              color: black,
                            ),
                          ),
                        );
                      }

                     else {
                        return ListView.builder(
                          scrollDirection: Axis.horizontal,
                            itemCount: snapshot.data!.length,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (BuildContext context,int index){
                            return Card(
                              elevation: 3,
                              child: Container(
                                alignment: AlignmentDirectional.center,
                                height: height * 0.054,
                                width: width * 0.28,
                                decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                                    color: lightgray),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text( snapshot.data![index].commission==null?"0%":
                                      '${snapshot.data![index].lavelStage}'+'-''${snapshot.data![index].commission}'+'%',
                                      style: Lv1,
                                    ),snapshot.data![index].count==null?Text("0"):
                                    Text('${snapshot.data![index].count}')
                                  ],
                                ),
                              ),
                            );
                          }
                        );
                      }

                  }
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              CustomButton(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context)=>View_all_team_commission()));
                },
                text: 'View team commissions',
              )
            ],
          ),
        ),
      ),
    );
  }
  Future<List<teamcommisioncontroller>> qwe()  async {
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
}
