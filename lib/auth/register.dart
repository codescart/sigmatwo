import 'dart:convert';

import 'package:Sigma/Widgets/circularprogressbutton.dart';
import 'package:Sigma/Widgets/loginbutton.dart';
import 'package:Sigma/constant/apiconstant.dart';
import 'package:Sigma/constant/flushbar.dart';
import 'package:Sigma/dashboard/dashboard.dart';
import 'package:Sigma/main.dart';
import 'package:flutter/material.dart';
import 'package:Sigma/constant/consstantcolor.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:pinput/pinput.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constant/textstyleconstant.dart';
bool _passwordVisible = false;
class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  Color focusedBorderColor = Colors.black;
  Color fillColor =  Colors.red;
  Color borderColor = Colors.black;
  var code="";
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
  TextEditingController nameController = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController referal = TextEditingController();
  bool loading=false;

  bool Verify =false;
  bool Verified =false;
  bool unVerified =false;
  bool showNewField =false;
  bool showNewtab =false;
  bool showNumbertab =false;
  @override
  Widget build(BuildContext context) {
    final height=MediaQuery.of(context).size.height;
    final width=MediaQuery.of(context).size.width;
    return Card(
      elevation: 0,
      child: Container(
        alignment: Alignment.center,
        height: height * 2,
        width: width * 1,
        color: bgcolor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if(showNumbertab==false)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: nameController,
                      keyboardType: TextInputType.number,
                      maxLength: 10,
                    //  style: F630,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.phone_iphone),

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
                          hintText: "Enter mobile number"),
                    ),
                  ),

                  Verify==false?
                  Center(
                    child: Login_button(onTap: () {
                      Numberotp(nameController.text);
                    },
                     text: 'Verify',
                    ),
                  ):Verified==true?
                  Center(
                    child: Login_button(
                      onTap: () {  },
                      text: 'Verified✔',
                 ),
                  ):
                  Center(
                    child: unVerified==true?
                    Login_button(
                      onTap: () {  Numberotp(nameController.text); },
                      text: 'Unverify',
                    ):
                    Center(child: Circularbutton()),
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
                ],
              ),
            if(showNewtab)
            Column(
              children: [
                Padding(
                  padding:  EdgeInsets.all(8.0),
                  child: TextField(
                      controller: password,
                      obscureText: !_passwordVisible,
                      decoration: InputDecoration(

                        prefixIcon: Icon(Icons.password),
                        suffixIcon: IconButton(
                          icon: Icon(
                            // Based on passwordVisible state choose the icon
                            _passwordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.grey,
                          ),
                          onPressed: () {
                            // Update the state i.e. toogle the state of passwordVisible variable
                            setState(() {
                              _passwordVisible = !_passwordVisible;
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
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                      controller: referal,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.pin),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(width: 1, color: Colors.black),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            width: 1,
                          ),
                        ),
                        hintText: "Enter referal code ",
                      )),
                ),
                SizedBox(
                  height: height * 0.07,
                ),
                loading==false?
                Login_button(onTap: () {
                  Register(nameController.text,password.text,referal.text); }, text: 'Sign In',):
                Circularbutton(),
              ],
            ),

          ],
        ),
      ),
    );
  }

  String otp='11111';
  Numberotp(String nameController,)async {
    setState(() {
      Verify=true;
    });
    final response = await http.post(Uri.parse(Apiconst.registerotp),
      headers: <String ,String>{
        "Content-Type":"application/json; charset=UTF-8",
      },
      body: jsonEncode(<String ,String>{
        "mobile": nameController,
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
  Register(String nameController,String password,String referal )async {
    setState(() {
      loading=true;
    });
    final response =  await http.post(Uri.parse(Apiconst.Registerurl),
      headers:<String ,String>{
        "Content-Type":"application/json; charset=UTF-8",
      },
      body: jsonEncode(<String ,String>{
        "mobile": nameController,
        "password": password,
        "refcode": referal,

      }),
    );
    var data = jsonDecode(response.body);
    if(data["status"]=="200"){
      final prefs = await SharedPreferences.getInstance();
      final key = 'userId';
      final userId = data['id'].toString();
      prefs.setString(key, userId);
      print(userId);
      print('qqqqqqqqqqqqqqqq');
      setState(() {
        loading=false;
      });
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => bottom()));
    }
    else{
      setState(() {
        loading= false;
      });
      Utils.flushBarErrorMessage( data["msg"],context,white);
    }

  }
}
