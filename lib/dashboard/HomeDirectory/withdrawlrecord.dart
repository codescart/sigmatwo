import 'dart:convert';
import 'package:Sigma/buttonconstant/backbutton.dart';
import 'package:Sigma/constant/apiconstant.dart';
import 'package:Sigma/constant/assetsconstant.dart';
import 'package:Sigma/constant/consstantcolor.dart';
import 'package:Sigma/constant/constantbutton.dart';
import 'package:Sigma/constant/textstyleconstant.dart';
import 'package:Sigma/dashboard/MineDirectory/myprojectview.dart';
import 'package:Sigma/product/homedcontroller/withdrawlcontroller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class withdrawlrecord extends StatefulWidget {
  const withdrawlrecord({Key? key}) : super(key: key);

  @override
  State<withdrawlrecord> createState() => _withdrawlrecordState();
}

class _withdrawlrecordState extends State<withdrawlrecord> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
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
          title: Text('WITHDRAWL RECORD',
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 20.sp,
              color: black,
            ), )
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder<List<withdrawlhistoryrecord>>(
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 200,
                        width: 700,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage(Recharge),
                            )
                        ),
                      ),
                      Text(
                        "No Deposit History",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25.sp,
                          color: black,
                        ),
                      ),

                    ],
                  ),
                );
              }
              else {
                return ListView.builder(

                    itemCount: snapshot.data!.length,
                    itemBuilder: (BuildContext ctx, index) {
                      return  Card(elevation: 3,
                        child: ListTile(
                          title: Text('ORDER NO.: '+'${snapshot.data![index].orderNumber}',
                              style: TextStyle(fontSize: 14.sp,
                                  fontWeight: FontWeight.w900)),
                          subtitle: Text('${snapshot.data![index].createdAt}'),
                          trailing: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('₹ '+'${snapshot.data![index].amount}',
                                  style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w900)
                              ),
                              snapshot.data![index].status=='0'?
                              Container(
                                height: 20.h,
                                width: 70.w,
                                decoration: BoxDecoration(
                                  color: lightblue,
                                  borderRadius: BorderRadius.circular(5)
                                ),
                                child:Center(child: Text('PENDING',
                                  style: TextStyle(fontSize: 10.sp,fontWeight: FontWeight.w900),)),
                              )
                              :snapshot.data![index].status=='1'
                                  ?Container(
                                height: 20.h,
                                width: 70.w,
                                decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(5)
                                ),
                                child:Center(child: Text('SUCCESS',
                                  style: TextStyle(fontSize: 10.sp,fontWeight: FontWeight.w900),)),
                              ):Container(
                                height: 20.h,
                                width: 70.w,
                                decoration: BoxDecoration(
                                    color: Colors.redAccent,
                                    borderRadius: BorderRadius.circular(5)
                                ),
                                child:Center(child: Text('FAILED',
                                  style: TextStyle(fontSize: 10.sp,fontWeight: FontWeight.w900),)),
                              )
                            ],
                          ),
                        )
                      );
                    });
              }
            }),
      ),
    );
  }

  Future<List<withdrawlhistoryrecord>> qwe()  async {
    final prefs = await SharedPreferences.getInstance();
    final userid = prefs.getString("userId");
    print(userid);
    final response = await http.post(
        Uri.parse(Apiconst.withdraw_history),
      headers:<String ,String>{
        "Content-Type":"application/json; charset=UTF-8",
      },
      body: jsonEncode(<String ,String>{
        "userid": '$userid',
      }),
    );
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body)['data'] as List<dynamic>;
      print(response);
      print('kkkkkkkkkkkkkkkkkkkkkkkk');
      return jsonData.map((item) => withdrawlhistoryrecord.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }
}
