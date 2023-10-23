import 'dart:convert';
import 'package:Sigma/buttonconstant/backbutton.dart';
import 'package:Sigma/constant/apiconstant.dart';
import 'package:Sigma/constant/assetsconstant.dart';
import 'package:Sigma/constant/consstantcolor.dart';
import 'package:Sigma/main.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart'as http;


class Refer_Earn extends StatefulWidget {
  // final onrefer;
  // const Refer_Earn({Key? key, this.onrefer}) : super(key: key);
  @override
  State<Refer_Earn> createState() => _Refer_EarnState();
}
class _Refer_EarnState extends State<Refer_Earn> {
  @override
  Widget build(BuildContext context) {
    final height=MediaQuery.of(context).size.height;
    final width=MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
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
              leading: CustomBackButton(),
              centerTitle: true,
              title: Text('REFER & EARN',
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: height/35,
                  color: black,
                ), )
          ),
          body: map==null?Center(child: CircularProgressIndicator()):

          kIsWeb?Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height:height/3,
                width: width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(30),
                        bottomLeft: Radius.circular(30)),
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(refer_earn),
                    )
                  // ,color: primaryColor
                ),
              ),
              SizedBox(
                height:height/ 15,
              ),
              Text(
                'SHARE AND EARN MORE!',
                style: TextStyle(
                    color: black,
                    fontSize: height/35,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: height/30,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(25, 0, 15, 0),
                child: Text("Invite your friend to play our app and you'll get 1% of the joining fees everytime your referred user join a paid contest above ₹50.This will be added to your bonus balance so,you use it to jooin any contest.",
                    style: TextStyle(color: black, fontSize: 12)),
              ),
              SizedBox(
                height: height/40,
              ),
              DottedBorder(
                color: lightred,
                strokeWidth: 2,
                radius: Radius.circular(12),
                dashPattern: [
                  5,
                  5,
                ],
                child: Container(
                  alignment: Alignment.center,
                  height:  height/20,
                  color: gray,
                  child: Text(
                    map['refer_code'],

                    style: TextStyle(

                      color: black,
                      fontSize:  height/30,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height/30,
              ),
             Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Container(
                  height: height/20,
                  width: width/2.2,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: lightblue),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: InkWell(
                    onTap: ()async {
                      Share.share('${map['refurl']+map['refer_code']}', subject: 'Sigma!');
                    },
                    child: Row(
                      children: [
                        CircleAvatar(
                            radius: 20,
                            backgroundColor: gray,
                            child: Icon(
                              Icons.share,
                              color: white,
                            )),
                        SizedBox(
                          width: width/35,
                        ),
                        Text("Share the code",
                            style: TextStyle(
                              color: black,
                              fontSize: height/20,
                              fontWeight: FontWeight.w700,
                            ))
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ):
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: height/3,
                width: width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(30),
                        bottomLeft: Radius.circular(30)),
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(refer_earn),
                    )
                  // ,color: primaryColor
                ),
              ),
              SizedBox(
                height: height/30,
              ),
              Text(
                'SHARE AND EARN MORE!',
                style: TextStyle(
                    color: black,
                    fontSize: height/35,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: height/40,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(25, 0, 15, 0),
                child: Text("Invite your friend to play our app and you'll get 1% of the joining fees everytime your referred user join a paid contest above ₹50.This will be added to your bonus balance so,you use it to jooin any contest.",
                    style: TextStyle(color: black, fontSize: 12)),
              ),
              SizedBox(
                height: height/25,
              ),
              DottedBorder(
                color: lightred,
                strokeWidth: 2,
                radius: Radius.circular(12),
                dashPattern: [
                  5,
                  5,
                ],
                child: Container(
                  alignment: Alignment.center,
                  height: height/20,
                  color: gray,
                  child: Text(
                    map['refer_code'],
                    style: TextStyle(
                      color: black,
                      fontSize: height/30,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height/30,
              ),
             Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Container(
                  height: height/20,
                  width: width/2.2,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: lightblue),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: InkWell(
                    onTap: ()async {
                      share();
                    },
                    child: Row(
                      children: [
                        CircleAvatar(
                            radius: 20,
                            backgroundColor: gray,
                            child: Icon(
                              Icons.share,
                              color: white,
                            )),
                        SizedBox(
                          width: width/35,
                        ),
                        Text("Share the code",
                            style: TextStyle(
                              color: black,
                              fontSize: height/55,
                              fontWeight: FontWeight.w700,
                            ))
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  @override
  void initState() {
    REFER_EARN();
    super.initState();
  }
  var map;

  REFER_EARN() async {
    final prefs = await SharedPreferences.getInstance();
    final userid = prefs.getString("userId");
    final response =  await http.post(
      Uri.parse(Apiconst.REFEREARN),
      headers:<String ,String>{
        "Content-Type":"application/json; charset=UTF-8",
      },
      body: jsonEncode(<String ,String>{
        "userid": '$userid',

      }),
    );
    var data = jsonDecode(response.body);
    print(data);
    print("mmmmmmmmmmmm");
    if (data['status'] == '200') {
      setState(() {
        map = data;

      });

    }
  }

  String referalCode = 'initialData';
  Future<void> share() async {
    await FlutterShare.share(
        title: 'Referrel Code : ' + map['refurl']+map['refer_code'],
        text: 'Join Now & Get Exiting Prizes. here is my Referrel Code : ' +
            map['refurl']+map['refer_code'],
        linkUrl: '',
        chooserTitle: 'Referrel Code : ' + map['refurl']+map['refer_code'],);
  }
}
