import 'package:Sigma/constant/assetsconstant.dart';
import 'package:Sigma/constant/launchermsg.dart';
import 'package:Sigma/dashboard/dashboard.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:Sigma/constant/consstantcolor.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';




class Utils {
  static void flushBarErrorMessage(String message, BuildContext context,Color messageColor) {
    showFlushbar(
      context: context,
      flushbar: Flushbar(
        message: message,
        messageColor: messageColor,
        forwardAnimationCurve: Curves.decelerate,
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
        padding: const EdgeInsets.all(15),
        duration: const Duration(seconds: 3),
        flushbarPosition: FlushbarPosition.TOP,
        backgroundColor: lightred,
        borderRadius: BorderRadius.circular(20),
        positionOffset: 20,
        icon: const Icon(
          Icons.error_outline,
          size: 30,
          color: Colors.white,
        ),
      )..show(context),
    );
  }

  static void flushBarsuccessMessage(String message, BuildContext context,Color messageColor) {
    showFlushbar(
      context: context,
      flushbar: Flushbar(
        message: message,
        messageColor: messageColor,
        forwardAnimationCurve: Curves.decelerate,
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
        padding: const EdgeInsets.all(15),
        duration: const Duration(seconds: 3),
        flushbarPosition: FlushbarPosition.TOP,
        backgroundColor: Colors.green,
        borderRadius: BorderRadius.circular(20),
        positionOffset: 20,
        icon: const Icon(
          Icons.check_circle_outline_outlined,
          size: 30,
          color: Colors.white,
        ),
      )..show(context),
    );
  }



  static void SuccessPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 0,
          backgroundColor: Colors.white,
          content: Container(
            height: 230.r,
            child: Column(
              children: [
                Container(
                  height: 80.r,
                  width: 80.r,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage(
                            sucesspop,
                          ))),
                ),
                Text(
                  'Your Payment Will be updated \n within 2 minutes',
                  style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w900,
                      color: black),
                ),
                Spacer(),
                Text(
                  'If any Payment related support  :',
                  style: TextStyle(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w500,
                      color: black),
                ),
                TextButton(
                  onPressed: () {
                    Launcher.openwhatsapp(context);
                    // openteligram();
                  },
                  child: Text(
                    'Whatsapp Link',
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w500,
                        color: black),
                  ),
                ),
                Spacer(),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(
                          builder: (context)=> bottom()));
                    },
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(10.0),
                        ),
                        primary: lightblue,
                        elevation: 10,
                        textStyle: TextStyle(fontWeight: FontWeight.bold)),
                    child: Text('Go Back')),
              ],
            ),
          ),
        );
      },
    );
  }
  static void RechargePopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 0,
          backgroundColor: Colors.white,
          content: Container(
            height: 230.r,
            child: Column(
              children: [
                Container(
                  height: 80.r,
                  width: 80.r,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage(
                            sucesspop,
                          ))),
                ),
                Center(
                  child: Text(
                    'Your recharge has been \n   done successfully',
                    style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w900,
                        color: black),
                  ),
                ),
                Spacer(),
                Text(
                  'If any Payment related support  :',
                  style: TextStyle(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w500,
                      color: black),
                ),
                TextButton(
                  onPressed: () {
                   Launcher.openwhatsapp(context);
                  },
                  child: Text(
                    'Whatsapp Link',
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w500,
                        color: black),
                  ),
                ),
                Spacer(),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(
                          builder: (context)=> bottom()));
                    },
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(10.0),
                        ),
                        primary: lightblue,
                        elevation: 10,
                        textStyle: TextStyle(fontWeight: FontWeight.bold)),
                    child: Text('Go Back')),
              ],
            ),
          ),
        );
      },
    );
  }
  static void ReedemPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 0,
          backgroundColor: Colors.white,
          content: Container(
            height: 200.r,
            child: Column(
              children: [
                Container(
                  height: 80.r,
                  width: 80.r,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage(
                            sucesspop,
                          ))),
                ),

                Spacer(),

                TextButton(
                  onPressed: () {
                    // openteligram();
                  },
                  child: Text(
                    'Telegram Link',
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontSize: 8.sp,
                        fontWeight: FontWeight.w500,
                        color: black),
                  ),
                ),
                Spacer(),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(10.0),
                        ),
                        primary: lightblue,
                        elevation: 10,
                        textStyle: TextStyle(fontWeight: FontWeight.bold)),
                    child: Text('Go Back')),
              ],
            ),
          ),
        );
      },
    );
  }

}