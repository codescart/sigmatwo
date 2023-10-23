import 'dart:convert';

import 'package:Sigma/Widgets/circularprogressbutton.dart';
import 'package:Sigma/Widgets/rectanglebutton.dart';
import 'package:Sigma/buttonconstant/backbutton.dart';
import 'package:Sigma/constant/apiconstant.dart';
import 'package:Sigma/constant/assetsconstant.dart';
import 'package:Sigma/constant/consstantcolor.dart';
import 'package:Sigma/constant/flushbar.dart';
import 'package:Sigma/constant/textstyleconstant.dart';
import 'package:Sigma/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class Account_details extends StatefulWidget {
  const Account_details({Key? key}) : super(key: key);

  @override
  State<Account_details> createState() => _Account_detailsState();
}

bool _loading = false;

class _Account_detailsState extends State<Account_details> {
  TextEditingController account_no = TextEditingController();
  TextEditingController IFSC = TextEditingController();
  TextEditingController Bank_Name = TextEditingController();
  TextEditingController UPI = TextEditingController();
  TextEditingController Ac_holder = TextEditingController();

  @override
  void initState() {
    accountview();
    Acdetail();
    super.initState();
  }

  Acdetail() {
    account_no.text = Account == null ? '' : Account['account_no'].toString();
    IFSC.text = Account == null ? '' : Account['ifsc'].toString();
    Bank_Name.text = Account == null ? '' : Account['bank_name'].toString();
    UPI.text = Account == null ? '' : Account['upi'].toString();
    Ac_holder.text = Account == null ? '' : Account['name'].toString();
  }

  var Account;
  accountview() async {
    final prefs = await SharedPreferences.getInstance();
    final userid = prefs.getString("userId");
    print(userid);
    final response = await http.post(
      Uri.parse(Apiconst.ACCOUNTVIEW),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "userid": '$userid',
      }),

    );
    var data = jsonDecode(response.body);
    print(data);
    print("mmmmmmmmmmmm");
    if (data['status'] == '200') {
      setState(() async {
        Account = data['data'];
        Acdetail();
        final prefs2 = await SharedPreferences.getInstance();
        final key1 = 'acId';
        final acId = Account['id'];
        prefs2.setString(key1, acId);
        print(acId);
        print('kkkkkkkkkkkkkkkkkkkkkkkkk');
      });
    }
  }

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
          body: ListView(
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.all(20.r),
            children: [
              SizedBox(
                height: 50.h,
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.r)
                ),
                elevation: 5,
                child:ListView(
                  shrinkWrap: true,
                  padding: EdgeInsets.symmetric(horizontal: 15.r,vertical: 15.r),
                  children: [
                    TextField(
                      controller: Ac_holder,
                      // focusNode: focusyear,
                      keyboardType: TextInputType.name,
                      textAlignVertical: TextAlignVertical.bottom,
                      style: const TextStyle(color: black),
                      cursorColor: const Color(0xFF075E54),
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person),
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
                          hintText: "Enter A/c holder name"),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    TextField(
                      controller: account_no,
                      // focusNode: focusyear,
                      keyboardType: TextInputType.name,
                      textAlignVertical: TextAlignVertical.bottom,
                      style: const TextStyle(color: black),
                      cursorColor: const Color(0xFF075E54),
                      decoration: InputDecoration(

                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              width: 1, color: Colors.black),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            width: 1,
                          ),),
                        prefixIcon: Icon(
                          Icons.account_balance,
                          color: black,
                        ),
                        hintText: "Account NO",
                        hintStyle: TextStyle(
                          color: black,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    TextField(
                      controller: Bank_Name,
                      // focusNode: focusyear,
                      keyboardType: TextInputType.name,
                      textAlignVertical: TextAlignVertical.bottom,
                      style: const TextStyle(color: black),
                      cursorColor: const Color(0xFF075E54),
                      decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              width: 1, color: Colors.black),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            width: 1,
                          ),),

                        prefixIcon: Icon(
                          Icons.account_balance_outlined,
                          color:black,
                        ),
                        hintText: "Bank Name",
                        hintStyle: TextStyle(
                          color: black,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    // SizedBox(
                    //   height: 20.h,
                    // ),
                    // TextField(
                    //   controller: Branch,
                    //   // focusNode: focusyear,
                    //   keyboardType: TextInputType.name,
                    //   textAlignVertical: TextAlignVertical.bottom,
                    //   style: const TextStyle(color: black),
                    //   cursorColor: const Color(0xFF075E54),
                    //   decoration: InputDecoration(
                    //     focusedBorder: UnderlineInputBorder(
                    //       borderSide: BorderSide(
                    //           width: 1, color: Colors.black),
                    //     ),
                    //     enabledBorder: UnderlineInputBorder(
                    //       borderSide: BorderSide(
                    //         width: 1,
                    //       ),),
                    //     prefixIcon: Icon(
                    //       Icons.account_balance_sharp,
                    //       color: Colors.black,
                    //     ),
                    //     hintText: "Branch Name",
                    //     hintStyle: TextStyle(
                    //       color: black,
                    //       fontSize: 15,
                    //     ),
                    //   ),
                    // ),
                    SizedBox(
                      height: 20.h,
                    ),
                    TextField(
                      controller: IFSC,
                      // focusNode: focusyear,

                      keyboardType: TextInputType.name,
                      textAlignVertical: TextAlignVertical.bottom,
                      style: const TextStyle(color: black),
                      cursorColor: const Color(0xFF075E54),
                      decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              width: 1, color: Colors.black),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            width: 1,
                          ),),

                        prefixIcon: Icon(
                          Icons.pin,
                          color: black,
                        ),
                        hintText: "IFSC Code",
                        hintStyle: TextStyle(
                          color: black,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //   crossAxisAlignment: CrossAxisAlignment.center,
                    //   children: [
                    //     Container(
                    //       height: 2,
                    //       width: 130.w,
                    //       color: black,
                    //     ),
                    //     Text(
                    //       'OR',
                    //       style:
                    //       TextStyle(
                    //           fontWeight: FontWeight.w900,
                    //           fontSize: 14.sp,
                    //           color: black
                    //       ),
                    //     ),
                    //     Container(
                    //       height: 2,
                    //       width: 130.w,
                    //       color: black,
                    //     ),
                    //   ],
                    // ),
                    // SizedBox(
                    //   height: 20.h,
                    // ),
                    // TextField(
                    //   controller: UPI,
                    //   // focusNode: focusyear,
                    //   keyboardType: TextInputType.name,
                    //   textAlignVertical: TextAlignVertical.bottom,
                    //   style: const TextStyle(color: black),
                    //   cursorColor: const Color(0xFF075E54),
                    //   decoration: InputDecoration(
                    //     focusedBorder: UnderlineInputBorder(
                    //       borderSide: BorderSide(
                    //           width: 1, color: Colors.black),
                    //     ),
                    //     enabledBorder: UnderlineInputBorder(
                    //       borderSide: BorderSide(
                    //         width: 1,
                    //       ),),
                    //     prefixIcon: Icon(
                    //       Icons.pin_end,
                    //       color: black,
                    //     ),
                    //     hintText: "UPI ID",
                    //     hintStyle: TextStyle(
                    //       color: black,
                    //       fontSize: 15,
                    //     ),
                    //   ),
                    // ),
                    SizedBox(
                      height: 20.h,
                    ),
                    _loading == false
                        ? CustomButton(
                          text: 'UPDATE',
                          textColor: Colors.white,
                          onTap: () async {
                            Addaccount(account_no.text, IFSC.text,
                                Bank_Name.text, Ac_holder.text);
                          },
                        )
                        :Circularbutton()
                  ],
                ),
              )

            ],
          ),
        ));
  }

  Addaccount(String account_no, String IFSC, String Bank_Name,
      String Ac_holder) async {
    final prefs = await SharedPreferences.getInstance();
    final userid = prefs.getString("userId");
    setState(() {
      _loading = true;
    });

    final response = await http.post(
      Uri.parse(Apiconst.ADDACCOUNT),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{

        "name": Ac_holder,
        "accountno": account_no,
        "ifsc": IFSC,
        "bankname": Bank_Name,
        "userid": '${userid}',
      }),
    );

    var data = jsonDecode(response.body);
    print(data);
    print('aaaaaaaaaaaaaaaaa');
    print('rrrrrrrrrrrrrrrrrr');

    if (data["status"] == "200") {
      final prefs2 = await SharedPreferences.getInstance();
      final key1 = 'acId';
      final acId = data['id'].toString();
      prefs2.setString(key1, acId);
      print(acId);
      print('nnnnnnnnnnnnnnnnnnnnnnnn');
      setState(() {
        _loading = false;
      });
      Navigator.pop(context);
      Utils.flushBarsuccessMessage(data['msg'], context, black);
    } else {
      setState(() {
        _loading = false;
      });
      Utils.flushBarErrorMessage(data['msg'], context, black);
      print("Error");
    }
  }
}
