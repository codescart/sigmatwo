import 'package:Sigma/auth/login.dart';
import 'package:Sigma/auth/register.dart';
import 'package:Sigma/constant/assetsconstant.dart';
import 'package:Sigma/constant/consstantcolor.dart';
import 'package:Sigma/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sliding_switch/sliding_switch.dart';


class Background_desigen extends StatefulWidget {
  const Background_desigen({super.key});

  @override
  State<Background_desigen> createState() => _Background_desigenState();
}

class _Background_desigenState extends State<Background_desigen> {
  bool _isSecondPage = false;

  void _toggleSwitch(bool value) {
    setState(() {
      _isSecondPage = value;
    });
  }
  @override
  Widget build(BuildContext context) {
final height=MediaQuery.of(context).size.height;
final width=MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () async {
        final shouldPop = await showDialog<bool>(
          context: context,
          builder: (context) {
            return AlertDialog(
              shape:RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              shadowColor: Colors.black,
              title: Text('Are you sure?', style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.bold,
                color: black,
              ),),
              content: Text('Do you want to exit from App', style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.bold,
                color: black,
              ),),
              actionsAlignment: MainAxisAlignment.spaceBetween,
              actions: [
                TextButton(
                  onPressed: () {
                    SystemNavigator.pop();

                  },
                  child: const Text('Yes'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context, false);
                  },
                  child: const Text('No'),
                ),
              ],
            );
          },
        );
        return shouldPop!;
      },
      child: Scaffold(
         backgroundColor: bgcolor,

        body: ListView(
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            children: [
              Card(elevation: 3,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomRight: Radius.circular(30),
                    bottomLeft: Radius.circular(30))),
                child: Container(
                  height: height*0.4,
                  width: width*1,
                  decoration: BoxDecoration(image: DecorationImage(image: AssetImage(Adani),scale: 3),
                      borderRadius: BorderRadius.only(bottomRight: Radius.circular(30),
                      bottomLeft: Radius.circular(30)),
                      gradient: LinearGradient(
                          colors: [lightblue, bgcolor],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter)
                      // color: bgcolor
                  ),
                  child: Column(mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        padding: EdgeInsets.all(20),
                        child: SlidingSwitch(
                          value: _isSecondPage,
                          width: 280,
                          onChanged: _toggleSwitch,
                          height: 45,
                          animationDuration: const Duration(milliseconds: 400),
                          onTap: () {},
                          onDoubleTap: () {},
                          onSwipe: () {},
                          textOff: "Log In",
                          textOn: "Sign Up",
                          colorOn: white,
                          colorOff: white,
                          background: lightgray,
                          buttonColor: black,
                          inactiveColor: black,
                        ),
                      ),

                    ],
                  ),


                ),
              ),
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    color: Colors.red,
                    //next card
                    child: Column(
                      children: [
                        SizedBox(height: 120,),

                        // SizedBox(height: 5,),



                      ],
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.all(8.0),
                    child:  Container(
                        height: 350,
                        decoration: BoxDecoration( borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.transparent),
                        child: _isSecondPage?Register() : Login()),
                  ),
                ],
              )
            ]),
      ),
    );
  }
}

