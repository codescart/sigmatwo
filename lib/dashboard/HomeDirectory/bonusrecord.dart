import 'dart:convert';
import 'package:Sigma/buttonconstant/backbutton.dart';
import 'package:Sigma/constant/apiconstant.dart';
import 'package:Sigma/constant/assetsconstant.dart';
import 'package:Sigma/constant/consstantcolor.dart';
import 'package:Sigma/constant/constantbutton.dart';
import 'package:Sigma/constant/textstyleconstant.dart';
import 'package:Sigma/dashboard/MineDirectory/myprojectview.dart';
import 'package:Sigma/product/ProductController/bonuscontroller.dart';
import 'package:Sigma/product/homedcontroller/withdrawlcontroller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;


class Bonus_Record extends StatefulWidget {
  const Bonus_Record({Key? key}) : super(key: key);

  @override
  State<Bonus_Record> createState() => _Bonus_RecordState();
}

class _Bonus_RecordState extends State<Bonus_Record> {

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
          title: Text('BONUS RECORD',
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 20.sp,
              color: black,
            ), )
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder<List<Bonus_Record_Controller>>(
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
                            title: Text('CODE.: '+'${snapshot.data![index].code}',
                                style: TextStyle(fontSize: 14.sp,
                                    fontWeight: FontWeight.w900)),
                            subtitle: Text('${snapshot.data![index].created_at}'),
                            trailing:  Text('₹ '+'${snapshot.data![index].amount}',
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w900)
                            ),
                          )
                      );
                    });
              }
            }),
      ),
    );
  }

  Future<List<Bonus_Record_Controller>> qwe()  async {
    final prefs = await SharedPreferences.getInstance();
    final userid = prefs.getString("userId");
    print(userid);
    final response = await http.post(
      Uri.parse(Apiconst.Get_reedemedbonus),
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
      return jsonData.map((item) => Bonus_Record_Controller.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }

}
