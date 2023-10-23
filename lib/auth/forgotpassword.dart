import 'dart:convert';

import 'package:Sigma/Widgets/circularprogressbutton.dart';
import 'package:Sigma/Widgets/loginbutton.dart';
import 'package:Sigma/auth/login.dart';
import 'package:Sigma/buttonconstant/backbutton.dart';
import 'package:Sigma/constant/assetsconstant.dart';
import 'package:Sigma/constant/consstantcolor.dart';
import 'package:Sigma/constant/flushbar.dart';
import 'package:Sigma/constant/textstyleconstant.dart';
import 'package:Sigma/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../constant/apiconstant.dart';

class Forgot_Password extends StatefulWidget {
  const Forgot_Password({Key? key}) : super(key: key);

  @override
  State<Forgot_Password> createState() => _Forgot_PasswordState();
}

class _Forgot_PasswordState extends State<Forgot_Password> {
  Color focusedBorderColor = Colors.black;
  Color fillColor =  Colors.red;
  Color borderColor = Colors.black;
  final defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: const TextStyle(
      fontSize: 22,
      color: Color.fromRGBO(30, 60, 87, 1),
    ),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(19),
      border: Border.all(color:Colors.white),
    ),
  );


  bool loading =false;
  bool Verify =false;
  bool Verified =false;
  bool unVerified =false;
  bool showNewField =false;
  bool showNewtab =false;
  bool showNumbertab =false;


  bool oldpass = false;
  bool newpass = false;
  bool confirmpass = false;
  bool _loading = false;

  TextEditingController newpassword = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();
  var code="";
  TextEditingController numberforget = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final height=MediaQuery.of(context).size.height;
    final width=MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
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
            title: Container(
              height: height*0.03,
              decoration: BoxDecoration(image: DecorationImage(image: AssetImage(Adani))),
            ),
          ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            if(showNumbertab==false)
            Padding(
              padding:  EdgeInsets.all(8.0),
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
                elevation: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 18.0,top: 18,bottom: 18),
                        child: Text('Forgot Password',style: TextStyle(fontSize:16.sp,fontWeight: FontWeight.w900),),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 18.0,top: 18),
                      child: Text('Registerd Number',style: TextStyle(fontSize:13.sp,fontWeight: FontWeight.w900),),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: numberforget,
                        keyboardType: TextInputType.number,
                        maxLength: 10,
                        style: F630,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.phone_iphone),
                            suffixIcon: Verify==false?
                            TextButton(onPressed: () {
                              forgetnumber(numberforget.text);
                              },
                              child: Text('Verify',
                              style: TextStyle(fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),),
                            ):Verified==true?
                            TextButton(onPressed: () {},
                              child: Text('Verified✔',style: TextStyle(
                                  fontSize: 14,fontWeight: FontWeight.bold,
                                  color: Colors.green),),):
                            unVerified==true?
                            TextButton(onPressed: () {     forgetnumber(numberforget.text); },
                              child: Text('Unverify',style: TextStyle(
                                  fontSize: 14,fontWeight: FontWeight.bold,
                                  color: Colors.red),),):
                            TextButton(onPressed: () {},
                              child: Container(
                                height: 10,
                                width: 10,
                                child: CircularProgressIndicator(
                                  strokeWidth: 5,

                                ),
                              )
                            ),


                            counter: Offstage(),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1, color: Colors.black),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                width: 1,
                              ),
                            ),
                            hintText: "Enter  mobile number"),
                      ),
                    ),
                    if (showNewField)
                      Padding(
                        padding: const EdgeInsets.only(left: 18.0,top: 18),
                        child: Text('OTP',style: TextStyle(fontSize:13.sp,fontWeight: FontWeight.w900),),
                      ),
                    if (showNewField)
                    Padding(
                      padding: const EdgeInsets.only(left: 18,right: 18),
                      child: Center(
                        child: Container(
                          height: 40,
                          child: Pinput(
                            onChanged: (value) {
                              setState(() {
                                code = value;
                              });
                            },
                            onSubmitted: (String pin) {
                              // Check if the PIN is complete (e.g., 6 digits)
                              if (pin.length == 6) {
                                // Show the button or perform any other action
                                print('PIN is complete: $pin');
                              }
                            },
                            length: 6,
                            pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                            showCursor: true,
                            focusedPinTheme: defaultPinTheme.copyWith(
                              decoration: defaultPinTheme.decoration!.copyWith(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color:Colors.black),
                              ),
                            ),
                            submittedPinTheme: defaultPinTheme.copyWith(
                              decoration: defaultPinTheme.decoration!.copyWith(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color:Colors.black),
                              ),
                            ),
                            errorPinTheme: defaultPinTheme.copyBorderWith(

                              border: Border.all(color: Colors.redAccent),
                            ),
                            disabledPinTheme: defaultPinTheme.copyWith(
                              decoration: defaultPinTheme.decoration!.copyWith(
                                color:Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color:Colors.black),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    if (code.length == 6)
                    loading==false?
                    Center(
                      child: Login_button(onTap: () {
                        _verifyOtpCode(code);
                      }, text: 'OTP VERIFY',),
                    ):
                    Center(child: Circularbutton()),
                    SizedBox(
                      height: height * 0.02,
                    ),


                  ],
                ),
              ),
            ),

            SizedBox(
              height: height * 0.05,
            ),
            if(showNewtab)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
                elevation: 5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 18.0,top: 18,bottom: 18),
                        child: Text('Change Password',style: TextStyle(fontSize:16.sp,fontWeight: FontWeight.w900),),
                      ),
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
                    _loading==false?
                    Center(
                      child: Login_button(onTap: () {
                        forgetpasswords(numberforget.text,newpassword.text,confirmpassword.text);
                      }, text: 'UPDATE',),
                    ):
                    Center(child: Circularbutton()),
                    SizedBox(
                      height: height * 0.02,
                    ),

                  ],
                ),
              ),
            )

          ],
        ),
      ),
    ));
  }
  /// send number otp
    String otp='11111';
  forgetnumber(String numberforget,)async {
    setState(() {
      Verify=true;
    });
    final response = await http.post(Uri.parse(Apiconst.forgetnumber),
      headers: <String ,String>{
        "Content-Type":"application/json; charset=UTF-8",
      },
      body: jsonEncode(<String ,String>{
        "mobile": numberforget,
       // "password": passController,
      }),
    );
    var data = jsonDecode(response.body);
    print(data);
    print('qqqqqqqqqqqqqqqqqq');
    if(data["status"]=='200'){
      setState(() {
        Verified=true;
        showNewField=true;
         otp= data['otp'].toString();

        //  Verify= false;
      });
     // _verifyOtpCode(code,);
      Utils.flushBarsuccessMessage( data["msg"],context,white);

    }
    else{
      setState(() {
        unVerified= true;
      });
      Utils.flushBarErrorMessage( data["msg"],context,white);
    }

  }

  /// verify otp
  _verifyOtpCode(String code, )async {
    print(code);
    print("hhhhhhh");
    print(code);

    if (otp == code) {

      Utils.flushBarsuccessMessage('OTP Matched Successfully', context, Colors.white);
      setState(() {
        showNewtab=true;
        showNumbertab= true;
      });
    }
    else {
      setState(() {
        showNewtab=false;
      });
      Utils.flushBarErrorMessage('Incorrect OTP', context, Colors.white);
    }
  }



/// Change Password
  forgetpasswords(String numberforget,String newpassword,String confirmpassword)async {
    setState(() {
      _loading=true;
    });
    final response = await http.post(Uri.parse(Apiconst.forgetpassword),
      headers: <String ,String>{
        "Content-Type":"application/json; charset=UTF-8",
      },
      body: jsonEncode(<String ,String>{
        "mobile": numberforget,
        "newpassword":newpassword,
        "confirmpassword":confirmpassword

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
      Utils.flushBarsuccessMessage( data["msg"],context,white);
    }
    else{
      setState(() {
        _loading=false;
      });
      Utils.flushBarErrorMessage( data["msg"],context,white);
    }

  }
}
