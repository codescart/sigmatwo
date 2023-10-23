import 'dart:convert';

import 'package:Sigma/constant/apiconstant.dart';
import 'package:Sigma/constant/flushbar.dart';
import 'package:Sigma/main.dart';
import 'package:Sigma/product/ProductController/MYPROJECTCONTROLLER.dart';
import 'package:flutter/material.dart';
import 'package:Sigma/constant/consstantcolor.dart';
import 'package:Sigma/constant/textstyleconstant.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class myprojectview extends StatefulWidget {
  final myprojectcontroller view;
  const myprojectview({required this.view});

  @override
  State<myprojectview> createState() => _myprojectviewState();
}

class _myprojectviewState extends State<myprojectview> {
  @override
  Widget build(BuildContext context) {
    final height=MediaQuery.of(context).size.height;
    final width=MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
          backgroundColor: bgcolor,
          appBar: AppBar(
              flexibleSpace: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [lightblue, bgcolor],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter))),
              centerTitle: true,
              title: Text('${widget.view.name}')),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              shrinkWrap: true,
              children: [
                Card(
                  elevation: 3,
                  child: Container(
                    height: height * 0.2,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage('${widget.view.image}')
                        ),
                        color: white),
                  ),
                ),
                Card(
                  elevation: 3,
                  child: Container(
                    height: height * 0.20,
                    width: width * 0.99,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: white),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text("Time Remaining",
                                    style: TextStyle(fontWeight: FontWeight.w900,fontSize: 15),),
                                  Text('${widget.view.timeremaining}',
                                      style: TextStyle(color: lightblue,fontWeight: FontWeight.w700,fontSize: 13)),
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    "Purchase Date",
                                    style: TextStyle(fontWeight: FontWeight.w900,fontSize: 15),
                                  ),
                                  Text('${widget.view.purchaseDate}' ,
                                      style: TextStyle(color: lightblue,fontWeight: FontWeight.w700,fontSize: 13)),
                                ],
                              ),
                              Column(
                                children: [
                                  Text("Expiry Date",
                                    style: TextStyle(fontWeight: FontWeight.w900,fontSize: 15),
                                  ),
                                  Text(
                                    '${widget.view.purchaseExpdate}',
                                    style: TextStyle(color: lightblue,fontWeight: FontWeight.w700,fontSize: 13),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ),
                        Divider(thickness: 2,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text("Price",
                                  style: TextStyle(fontWeight: FontWeight.w900,fontSize: 15),),
                                Text('₹ '+'${widget.view.price}',
                                    style: TextStyle(color: lightblue,fontWeight: FontWeight.w700,fontSize: 13)),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  "Daily income",
                                  style: TextStyle(fontWeight: FontWeight.w900,fontSize: 15),
                                ),
                                Text('₹ '+'${widget.view.productComm}' ,
                                    style: TextStyle(color: lightblue,fontWeight: FontWeight.w700,fontSize: 13)),
                              ],
                            ),
                            Column(
                              children: [
                                Text("Total earning",
                                  style: TextStyle(fontWeight: FontWeight.w900,fontSize: 15),
                                ),
                                Text(
                                  '₹ '+ '${widget.view.totalIncome}',
                                  style: TextStyle(color: lightblue,fontWeight: FontWeight.w700,fontSize: 13),
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Project description",
                  style: F630,
                ),
                SizedBox(
                  height: 20,
                ),
                Card(
                  elevation: 3,
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: white),
                    child: Padding(
                      padding:  EdgeInsets.all(8.0),
                      child: HtmlWidget(
                        '${widget.view.description}',
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
  bool loading =false;
  Productpurches()async {
    final prefs = await SharedPreferences.getInstance();
    final userid = prefs.getString("userId");
    setState(() {
      loading=true;
    });
    final response =  await http.post(Uri.parse(Apiconst.Productpurches),

      headers:<String ,String>{
        "Content-Type":"application/json; charset=UTF-8",
      },
      body: jsonEncode(<String ,String>{
        'userid':	'$userid',
        'productid':	'${widget.view.id}',
        'purchaseamount':	'${widget.view.price}',
        'purchasexpdays':	'${widget.view.productValidity}',
      }),
    );
    var data = jsonDecode(response.body);
    print(data);
    print('qqqqqqqqqqqqqqqqqq');
    if(data["status"]=='200'){

      setState(() {
        loading=false;
      });
      Navigator.pop(context);
    }
    else{
      setState(() {
        loading= false;
      });
      Utils.flushBarErrorMessage( data["msg"],context,white);
    }

  }
}
