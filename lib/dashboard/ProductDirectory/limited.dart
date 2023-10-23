import 'dart:convert';
import 'package:Sigma/constant/apiconstant.dart';
import 'package:Sigma/constant/assetsconstant.dart';
import 'package:Sigma/constant/consstantcolor.dart';
import 'package:Sigma/constant/constantbutton.dart';
import 'package:Sigma/constant/desablebutton.dart';
import 'package:Sigma/constant/textstyleconstant.dart';
import 'package:Sigma/main.dart';
import 'package:Sigma/product/ProductController/ProductadanuController.dart';
import 'package:flutter/material.dart';
import 'package:Sigma/dashboard/ProductDirectory/productView.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;


class Limited extends StatefulWidget {
  const Limited({Key? key}) : super(key: key);

  @override
  State<Limited> createState() => _LimitedState();
}

class _LimitedState extends State<Limited> {

  @override
  Widget build(BuildContext context) {
    final height=MediaQuery.of(context).size.height;
    final width=MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: FutureBuilder<List<ProductadanuController>>(
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
                        // color: Colors.red,
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
                          fontSize: 25,
                          color: black,
                      ),
                    ),
                  ],
                ),
              );
            }
            else {
              return GridView.builder(
                  gridDelegate:  SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 2.5 / 6,
                      crossAxisSpacing: 4,
                      mainAxisSpacing: 4),
                  itemCount: snapshot.data!.length,
                  itemBuilder: (BuildContext ctx, index) {
                    return  Card(elevation: 3,
                      child: Container(
                        height: height*0.3,
                        width:width*0.8,
                        decoration: BoxDecoration( borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: white),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: height*0.22,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: NetworkImage('${snapshot.data![index].image}')
                                  )
                                ),
                              ),
                              Text('${snapshot.data![index].name}',style: F630,
                                maxLines: 2,
                              ),
                              RichText(
                                text: TextSpan(
                                  text: 'Product price: ',
                                  style: NormalText,
                                  children:  <TextSpan>[
                                    TextSpan(text: '${snapshot.data![index].price}', style: days),
                                  ],
                                ),
                              ),
                              SizedBox(height: height*0.01,),
                              RichText(
                                text: TextSpan(
                                  text: 'Daily income: ',
                                  style: NormalText,
                                  children:  <TextSpan>[
                                    TextSpan(text: '${snapshot.data![index].productComm}', style: days),
                                  ],
                                ),
                              ),
                              SizedBox(height: height*0.01,),
                              RichText(
                                text: TextSpan(
                                  text: 'Total income: ',
                                  style: NormalText,
                                  children:  <TextSpan>[
                                    TextSpan(text: '${snapshot.data![index].total_income}', style: days),
                                  ],
                                ),
                              ),
                              SizedBox(height: height*0.01,),
                              RichText(
                                text: TextSpan(
                                  text: 'Complete Cycle: ',
                                  style: NormalText,
                                  children:  <TextSpan>[
                                    TextSpan(text: '${snapshot.data![index].productValidity}', style: days),
                                  ],
                                ),
                              ),
                              Spacer(),
                              snapshot.data![index].Purchasestatus==null?
                              constantbutton(onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>Product_view(view:snapshot.data![index])));
                              }, text: 'Join Project',)
                                  :disablebutton(onTap: () {  }, text: 'Joined',)
                            ],
                          ),
                        ),
                      ),
                    );
                  });
            }
          }),


    );



  }

  Future<List<ProductadanuController>> qwe()  async {
    final prefs = await SharedPreferences.getInstance();
    final userid = prefs.getString("userId");
    print(userid);
    final response = await http
        .get(Uri.parse(Apiconst.ProductAdaniurl+'$userid'));
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body)['data'] as List<dynamic>;
      print(response);
      print('kkkkkkkkkkkkkkkkkkkkkkkk');
      return jsonData.map((item) => ProductadanuController.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }
}
