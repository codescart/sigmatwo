import 'dart:convert';

import 'package:Sigma/Widgets/circularprogressbutton.dart';
import 'package:Sigma/Widgets/rectanglebutton.dart';
import 'package:Sigma/buttonconstant/backbutton.dart';
import 'package:Sigma/buttonconstant/circularbutton2.dart';
import 'package:Sigma/constant/apiconstant.dart';
import 'package:Sigma/constant/assetsconstant.dart';
import 'package:Sigma/constant/flushbar.dart';
import 'package:Sigma/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart'as http;

import '../../constant/consstantcolor.dart';


class Changepassword extends StatefulWidget {
  const Changepassword({Key? key}) : super(key: key);

  @override
  State<Changepassword> createState() => _ChangepasswordState();
}

class _ChangepasswordState extends State<Changepassword> {

  bool oldpass = false;
  bool newpass = false;
  bool confirmpass = false;
  bool _loading = false;
  TextEditingController oldpassword = TextEditingController();
  TextEditingController newpassword = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final height=MediaQuery.of(context).size.height;
    final width=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
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
        title: Container(
          height: height*0.03,
          decoration: BoxDecoration(image: DecorationImage(image: AssetImage(Adani))),
        ),
      ),
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
          children: [
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.r)
              ),
              elevation: 4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 18.0,top: 18),
                    child: Text('Old Password',style: TextStyle(fontSize:13.sp,fontWeight: FontWeight.w900),),
                  ),
                  Padding(
                    padding:  EdgeInsets.all(8.0),
                    child: TextField(
                        controller: oldpassword,
                        obscureText: !oldpass,
                        decoration: InputDecoration(

                          prefixIcon: Icon(Icons.password),
                          suffixIcon: IconButton(
                            icon: Icon(
                              // Based on passwordVisible state choose the icon
                              oldpass
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.grey,
                            ),
                            onPressed: () {
                              // Update the state i.e. toogle the state of passwordVisible variable
                              setState(() {
                                oldpass = !oldpass;
                              });
                            },
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(width: 1, color: Colors.black),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              width: 1,
                            ),
                          ),
                          hintText: "Enter your password",
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 18.0,top: 18),
                    child: Text('New Password',style: TextStyle(fontSize:13.sp,fontWeight: FontWeight.w900),),
                  ),
                  Padding(
                    padding:  EdgeInsets.all(8.0),
                    child: TextField(
                        controller: newpassword,
                        obscureText: !newpass,
                        decoration: InputDecoration(

                          prefixIcon: Icon(Icons.password),
                          suffixIcon: IconButton(
                            icon: Icon(
                              // Based on passwordVisible state choose the icon
                              newpass
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.grey,
                            ),
                            onPressed: () {
                              // Update the state i.e. toogle the state of passwordVisible variable
                              setState(() {
                                newpass = !newpass;
                              });
                            },
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(width: 1, color: Colors.black),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              width: 1,
                            ),
                          ),
                          hintText: "Enter your password",
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 18.0,top: 18),
                    child: Text('Confirm Password',style: TextStyle(fontSize:13.sp,fontWeight: FontWeight.w900),),
                  ),
                  Padding(
                    padding:  EdgeInsets.all(8.0),
                    child: TextField(
                        controller: confirmpassword,
                        obscureText: !confirmpass,
                        decoration: InputDecoration(

                          prefixIcon: Icon(Icons.password),
                          suffixIcon: IconButton(
                            icon: Icon(
                              // Based on passwordVisible state choose the icon
                              confirmpass
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.grey,
                            ),
                            onPressed: () {
                              // Update the state i.e. toogle the state of passwordVisible variable
                              setState(() {
                                confirmpass = !confirmpass;
                              });
                            },
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(width: 1, color: Colors.black),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              width: 1,
                            ),
                          ),
                          hintText: "Enter your password",
                        )),
                  ),
                  SizedBox(height: 50.h,),
                  _loading == false
                      ? CustomButton(
                    text: 'UPDATE',
                    textColor: Colors.white,
                    onTap: () async {
                      Changepass(oldpassword.text,newpassword.text,confirmpassword.text);
                    },
                  )
                      :
                  Center(child: Circularbutton2())
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  Changepass(String oldpassword,String newpassword, String confirmpassword)async {
    final prefs = await SharedPreferences.getInstance();
    final userid = prefs.getString("userId");
    setState(() {
      _loading=true;
    });

    final response =  await http.post(Uri.parse(Apiconst.Change_Password),
      headers:<String ,String>{
        "Content-Type":"application/json; charset=UTF-8",
      },
      body: jsonEncode(<String ,String>{

        "userid":'$userid',
        "oldpassword":oldpassword,
        "newpassword":newpassword,
        "confirmpassword":confirmpassword,
      }),
    );
    var data = jsonDecode(response.body);
    print(data);
    print('qqqqqqqqqqqqqqqqqq');
    if(data["status"]=='200'){

      setState(() {
        _loading=false;
      });
      Navigator.pop(context);
      Utils.flushBarsuccessMessage(data["msg"],context,white);
    }
    else{
      setState(() {
        _loading= false;
      });
      Utils.flushBarErrorMessage( data["msg"],context,white);
    }

  }

}
