import 'dart:convert';

import 'package:Sigma/constant/apiconstant.dart';
import 'package:Sigma/constant/assetsconstant.dart';
import 'package:Sigma/constant/consstantcolor.dart';
import 'package:Sigma/constant/textstyleconstant.dart';
import 'package:Sigma/dashboard/MineDirectory/accountcontainer.dart';
import 'package:Sigma/main.dart';
import 'package:Sigma/recharge/Rechargeamount.dart';
import 'package:flutter/material.dart';
import 'package:Sigma/dashboard/MineDirectory/elementcontainer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
class Details_Page extends StatefulWidget {
  const Details_Page({Key? key}) : super(key: key);

  @override
  State<Details_Page> createState() => _Details_PageState();
}

class _Details_PageState extends State<Details_Page> {
  @override
  Widget build(BuildContext context) {
    final height=MediaQuery.of(context).size.height;
    final width=MediaQuery.of(context).size.width;
    return SafeArea(child: Scaffold(
      backgroundColor: bgcolor,
      appBar: AppBar(
        backgroundColor:Colors.transparent,
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
        centerTitle: true,
        title: Container(
          height: height*0.03,
          decoration: BoxDecoration(image: DecorationImage(image: AssetImage(Adani))),
        ),
      ),
      body: map==null?Center(child: CircularProgressIndicator()):
      earn== null?Center(child: CircularProgressIndicator()):
      ListView(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(vertical: 15,horizontal: 15),
        children: [
          ListTile(
            leading: Card(elevation: 3,
              shape: RoundedRectangleBorder( borderRadius: BorderRadius.all(Radius.circular(30),)),
              child: CircleAvatar(radius: 30,backgroundColor: white,
                child: Icon(Icons.person),
              ),
            ),
            title:Text(
              map['mobile']==null?'':
              map['mobile'],style: F630,) ,
            subtitle:Text(map['userids']==null?"ID: ":
            "ID: "+map['userids'],style: NormalText,) ,
          ),
          Divider(),
          ListTile(
            onTap: (){
              Navigator.push(context,
                  MaterialPageRoute(
                      builder: (context)=>recharge()));
              },
            leading: Image.asset(wallet),
            title:     Text(map['wallet']== null?"₹0.0":
              '₹'+map['wallet'].toString(),style: ConstText,),
            subtitle:    Text("Wallet"),
            trailing: Text("Recharge >",style: NormalText,),
          ),
          ListTile(
            leading: Image.asset(Bonus),
            title:Text(earn['bonus']==null?"₹0.0":
              '₹'+ earn['bonus'].toString(),style: ConstText,),
            subtitle:    Text("Bonus"),),
          SizedBox(height: height*0.03,),
          Account_Cont(earns: earn),
          SizedBox(height: height*0.03,),
          Elements_cont(),
        ],
      ),
    )
    );
  }

  @override
  void initState() {
    viewprofile();
    Earning();
    super.initState();
  }
 var  map;
  viewprofile() async {
    final prefs = await SharedPreferences.getInstance();
    final userid = prefs.getString("userId");
    final response = await http.get(
      Uri.parse(Apiconst.profileview+'$userid'),

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
  var earn;
  Earning() async {
    final prefs = await SharedPreferences.getInstance();
    final userid = prefs.getString("userId");
    final response = await http.get(
      Uri.parse(Apiconst.Earnings+'$userid'),

    );
    var data = jsonDecode(response.body);
    print(data);
    print("🍔🍔🍔🍔🍔🍔🍔🍔🍔");
    if (data['status'] == '200') {
      setState(() {
        earn = data['data'];
      });
    }
  }
}
