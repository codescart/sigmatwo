
import 'dart:convert';
import 'package:Sigma/Widgets/circularprogressbutton.dart';
import 'package:Sigma/Widgets/loginbutton.dart';
import 'package:Sigma/auth/forgotpassword.dart';
import 'package:Sigma/constant/apiconstant.dart';
import 'package:Sigma/constant/consstantcolor.dart';
import 'package:Sigma/constant/flushbar.dart';
import 'package:Sigma/constant/launchermsg.dart';
import 'package:Sigma/constant/textstyleconstant.dart';
import 'package:Sigma/dashboard/HomeDirectory/home.dart';
import 'package:Sigma/dashboard/dashboard.dart';
import 'package:Sigma/main.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:shared_preferences/shared_preferences.dart';



class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}
bool _passwordVisible = false;
class _LoginState extends State<Login> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passController = TextEditingController();

  bool _debugLocked = false;
  // bankview();
  bool loading =false;
  @override
  Widget build(BuildContext context) {
    final height=MediaQuery.of(context).size.height;
    final width=MediaQuery.of(context).size.width;
    return Card(elevation: 0,
      child: Container(alignment: Alignment.center,
        height: height*2,
        width: width*1,
         color: bgcolor,
        child: Column(
          children: [
            Padding(
              padding:  EdgeInsets.all(8.0),
              child: TextFormField(
                controller: nameController,
                keyboardType: TextInputType.number,
                maxLength: 10,
                style: F630,
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
                    hintText: "Enter  mobile number"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                style: F630,
                  controller: passController,
                  obscureText: !_passwordVisible,
                  decoration: InputDecoration(prefixIcon: Icon(Icons.password),
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
                      borderSide: BorderSide(
                          width: 1, color: Colors.black),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        width: 1,
                      ),
                    ),
                    hintText: "Enter your password",)

              ),
            ),
            SizedBox(height: height*0.07,),

            loading==false?
            Login_button(onTap: () {
              Login(nameController.text,passController.text); }, text: 'Sign In',):
            Circularbutton(),
            SizedBox(height: height*0.01,),
            Align(
              alignment: Alignment.bottomRight,
              child: TextButton(onPressed: (){
              }, child:
              TextButton( onPressed: () {
               // Launcher.openwhatsapp(context);
                Navigator.push(context,MaterialPageRoute(builder: (context)=>Forgot_Password()));
                },
                  child: Text("Forgot Password ?",style:line,))),
            )

          ],
        ),

      ),
    );
  }
  Login(String nameController,String passController)async {
    setState(() {
       loading=true;
    });
    print(nameController);
    print(passController);
    print('qqqqqqqqqqqqqq');
    final response =  await http.post(Uri.parse(Apiconst.loginurl),
        headers:<String ,String>{
            "Content-Type":"application/json; charset=UTF-8",
          //  "Access-Control-Allow-Methods": "POST, OPTIONS,GET",
        },
        body: jsonEncode(<String ,String>{
        "mobile": nameController,
        "password": passController,
    }),
    );
    var data = jsonDecode(response.body);
    print(data);
    print('qqqqqqqqqqqqqqqqqq');
    if(data["status"]=='200'){

      setState(() {
        loading=false;
      });
      final prefs = await SharedPreferences.getInstance();
      final key = 'userId';
      final userId = data['id'];
      prefs.setString(key, userId);
      print(userId);
      print('');
      Future.delayed(const Duration(milliseconds: 500), () {
        setState(() {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => bottom()),
                  (route) => false);
        });
      });
      //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => bottom()));
    }
    else{
      setState(() {
        loading= false;
      });
      Utils.flushBarErrorMessage( data["msg"],context,white);
    }

  }
}
