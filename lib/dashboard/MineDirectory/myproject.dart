import 'dart:convert';
import 'package:Sigma/buttonconstant/backbutton.dart';
import 'package:Sigma/constant/apiconstant.dart';
import 'package:Sigma/constant/assetsconstant.dart';
import 'package:Sigma/constant/consstantcolor.dart';
import 'package:Sigma/constant/constantbutton.dart';
import 'package:Sigma/constant/desablebutton.dart';
import 'package:Sigma/constant/flushbar.dart';
import 'package:Sigma/constant/textstyleconstant.dart';
import 'package:Sigma/dashboard/MineDirectory/myprojectview.dart';
import 'package:Sigma/main.dart';
import 'package:Sigma/product/ProductController/MYPROJECTCONTROLLER.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;


class myproject_page extends StatefulWidget {
  const myproject_page({Key? key}) : super(key: key);

  @override
  State<myproject_page> createState() => _myproject_pageState();
}

class _myproject_pageState extends State<myproject_page> {
  bool loading=true;

  @override
  Widget build(BuildContext context) {
    final height=MediaQuery.of(context).size.height;
    final width=MediaQuery.of(context).size.width;
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
        title: Text('MY PROJECT',
          style: TextStyle(
          fontWeight: FontWeight.w900,
          fontSize: 20.sp,
          color: black,
        ), )
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder<List<myprojectcontroller>>(
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
                      Text(
                        "No data available",
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
                return GridView.builder(
                    gridDelegate:  SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 200,
                        childAspectRatio: 2.5 / 6,
                        crossAxisSpacing: 4,
                        mainAxisSpacing: 4),
                    itemCount: snapshot.data!.length,
                    itemBuilder: (BuildContext ctx, index) {
                      return  Card(elevation: 3,
                        child: InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>myprojectview(view:snapshot.data![index])));
                          },
                          child: Container(
                            decoration: BoxDecoration( borderRadius: BorderRadius.all(Radius.circular(10)),
                                color: white),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: height*0.20,
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
                                         TextSpan(text: '${snapshot.data![index].totalIncome}', style: days),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: height*0.01,),
                                  RichText(
                                    text: TextSpan(
                                      text: 'Term: ',
                                      style: NormalText,
                                      children:  <TextSpan>[
                                        TextSpan(text: '${snapshot.data![index].timeremaining}'+'/'+'${snapshot.data![index].productValidity}', style: days),
                                      ],
                                    ),
                                  ),
                                  Spacer(),
                                  snapshot.data![index].status=="1"?
                                  constantbutton(onTap: () {
                                    Redeem(pid:"${snapshot.data![index].productId}",
                                    DailyIncom:"${snapshot.data![index].productComm}");
                                  }, text: 'REDEEM',):
                                      disablebutton(onTap: () {  }, text: 'Redeem',)
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    });
              }
            }),
      ),
    );
  }

  Future<List<myprojectcontroller>> qwe()  async {
    final prefs = await SharedPreferences.getInstance();
    final userid = prefs.getString("userId");
    print(userid);
    final response = await http
        .get(Uri.parse(Apiconst.MYPROJECT+'$userid'));
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body)['data'] as List<dynamic>;
      print(response);
      print('kkkkkkkkkkkkkkkkkkkkkkkk');
      return jsonData.map((item) => myprojectcontroller.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }


  Redeem(  {required String pid, required String DailyIncom, })async {
    final prefs = await SharedPreferences.getInstance();
    final userid = prefs.getString("userId");
    setState(() {
      loading=true;
    });
    final response =  await http.post(Uri.parse(Apiconst.Reedemproduct),
      headers:<String ,String>{
        "Content-Type":"application/json; charset=UTF-8",
      },
      body: jsonEncode(<String ,String>{
        "userid": "$userid",
        "productid": pid,
        "dailycomm":DailyIncom,
      }),
    );
    var data = jsonDecode(response.body);
    print(data);
    print('qqqqqqqqqqqqqqqqqq');
    if(data["status"]=='200'){

      setState(() {
        loading=false;
      });
    Utils.SuccessPopup(context);

    }
    else{
      setState(() {
        loading= false;
      });
      Utils.flushBarErrorMessage( data["msg"],context,white);
    }

  }

}
