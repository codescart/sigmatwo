import 'dart:convert';

import 'package:Sigma/Widgets/rectanglebutton.dart';
import 'package:Sigma/buttonconstant/backbutton.dart';
import 'package:Sigma/constant/apiconstant.dart';
import 'package:Sigma/constant/assetsconstant.dart';
import 'package:Sigma/constant/flushbar.dart';
import 'package:Sigma/constant/launchermsg.dart';
import 'package:Sigma/dashboard/HomeDirectory/withdrawlrecord.dart';
import 'package:Sigma/dashboard/MineDirectory/Bindbankaccount.dart';
import 'package:flutter/material.dart';
import 'package:Sigma/constant/consstantcolor.dart';
import 'package:Sigma/constant/textstyleconstant.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class Withdraw_Page extends StatefulWidget {
  const Withdraw_Page({Key? key}) : super(key: key);

  @override
  State<Withdraw_Page> createState() => _Withdraw_PageState();
}

class _Withdraw_PageState extends State<Withdraw_Page> {
  TextEditingController amount = TextEditingController();
  TextEditingController password = TextEditingController();
  int _selectedItemIndex = 10; // Initialize with a value that won't match any index
  bool _isButtonEnabled = false;
  List<int> dataItems = [115, 500, 1000, 2000, 5000, 10000, 49999];
  void _handleTextChange() {
    setState(() {
      _selectedItemIndex = 10; // Reset selected index
      _isButtonEnabled = amount.text.isNotEmpty;
    });
  }

  void _handleListItemSelected(int index) {
    setState(() {
      _selectedItemIndex = dataItems[index];
      amount.text = dataItems[index].toString(); // Update TextFormField text
      _isButtonEnabled = true;
    });
  }

  @override
  void initState() {
    accountview();
    super.initState();
  }

  bool _passwordVisible = false;
  var Account;
  var walletview;
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
        walletview = data['wallet'];
      });
    }
  }

  @override
  void dispose() {
    amount.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

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
                    colors: [lightblue, bgcolor],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter))),
        automaticallyImplyLeading: false,
        leading: CustomBackButton(),
        centerTitle: true,
        title: Text(
          'WITHDRAWL',
          style: TextStyle(
              fontSize: 20.sp, fontWeight: FontWeight.w900, color: black),
        ),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => withdrawlrecord()));
              },
              child: Text('Record',
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w900,
                      color: black)))
        ],
      ),
      body: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          children: [
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(6))),
              elevation: 5,
              child: ExpansionTile(
                title: Text(
                  'Your Account Details',
                  style: TextStyle(
                      color: black,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w900),
                ),
                children: [
                  Account == null
                      ? Column(
                          children: [
                            ListTile(
                                onTap: () async {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              Account_details()));
                                },
                                leading: Text(
                                  'Add your Account Detail',
                                  style: TextStyle(
                                      color: black,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w900),
                                ),
                                trailing: Icon(Icons.edit)),
                          ],
                        )
                      : Column(
                          children: [
                            ListTile(
                              leading: Text(
                                'Ac holder Name',
                                style: TextStyle(
                                    color: black,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w900),
                              ),
                              trailing: Text(
                                Account['name'] == null
                                    ? ''
                                    : Account['name'].toString(),
                                style: TextStyle(
                                    color: black,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w900),
                              ),
                            ),
                            ListTile(
                              leading: Text(
                                'Acount No',
                                style: TextStyle(
                                    color: black,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w900),
                              ),
                              trailing: Text(
                                Account['account_no'] == null
                                    ? ''
                                    : Account['account_no'].toString(),
                                style: TextStyle(
                                    color: black,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w900),
                              ),
                            ),
                            ListTile(
                              leading: Text(
                                'Bank Name',
                                style: TextStyle(
                                    color: black,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w900),
                              ),
                              trailing: Text(
                                Account['bank_name'] == null
                                    ? ''
                                    : Account['bank_name'].toString(),
                                style: TextStyle(
                                    color: black,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w900),
                              ),
                            ),

                            ListTile(
                              leading: Text(
                                'IFSC Code',
                                style: TextStyle(
                                    color: black,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w900),
                              ),
                              trailing: Text(
                                Account['ifsc'] == null
                                    ? ''
                                    : Account['ifsc'].toString(),
                                style: TextStyle(
                                    color: black,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w900),
                              ),
                            ),
                            Divider(
                              thickness: 2,
                              color: black,
                            ),
                          ],
                        )
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'BALANCE : ',
                  style: F630,
                ),
                Text(
                  walletview == null ? '' : walletview,
                  style: text,
                ),
                Container(
                  height: 15,
                  width: 20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: lightblue,
                  ),
                  child: Center(
                      child: Text(
                    'ALL',
                    style: TextStyle(fontSize: 8, fontWeight: FontWeight.bold),
                  )),
                )
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(6))),
              child: TextField(
                controller: amount,
                textAlign: TextAlign.start,
                keyboardType: TextInputType.number,
                style: TextStyle(color: black),
                onChanged: (text) {
                  _handleTextChange();
                },
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.account_balance_wallet_rounded,
                      color: Colors.grey,
                    ),
                    hintText: "Enter Recharge Ammount",
                    helperStyle:
                        TextStyle(fontSize: 10, color: Colors.grey.shade200),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    )),
                cursorColor: Colors.grey,
              ),
            ),
            SizedBox(
              height: 16,
            ),
            GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 130,
                    childAspectRatio: 3.5 / 1.5,
                    mainAxisSpacing: 5),
                itemCount: dataItems.length,
                itemBuilder: (BuildContext ctx, index) {
                  return GestureDetector(
                    onTap: () {
                      _handleListItemSelected(index);
                    },
                    child: Stack(
                      children: [
                        Card(
                          elevation: 5,
                          color: _selectedItemIndex == dataItems[index]
                              ? lightred
                              : kGreenLightColor,
                          child: Center(
                            child: Text(
                              '₹  ' + dataItems[index].toString(),
                              style: TextStyle(
                                  color: black,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w900),
                            ),
                          ),
                        ),
                        Positioned(
                            top: 5,
                            right: 5,
                            child: _selectedItemIndex == dataItems[index]
                                ? Container(
                                    height: 12.r,
                                    width: 12.r,
                                    child: const CircleAvatar(
                                      child: Icon(
                                        Icons.check_outlined,
                                        size: 10,
                                      ),
                                    ),
                                  )
                                : Container()),
                      ],
                    ),
                  );
                }),
            SizedBox(
              height: 30,
            ),
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(6))),
              child: TextField(
                controller: password,
                textAlign: TextAlign.start,
                obscureText: !_passwordVisible,
                keyboardType: TextInputType.visiblePassword,
                style: TextStyle(color: black),
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.password,
                      color: Colors.grey,
                    ),
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
                    hintText: "Enter Password",
                    helperStyle:
                        TextStyle(fontSize: 10, color: Colors.grey.shade200),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    )),
                cursorColor: Colors.grey,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            _isButtonEnabled
                ? CustomButton(
                    onTap: () {
                      withdrawl(amount.text, password.text);
                    },
                    text: 'WITHDRAL REQUEST')
                : Container(),
            Padding(
              padding:  EdgeInsets.all(8.0),

              child:Account==null?Container(): HtmlWidget(
                  Account['withdraw_terms'].toString()

              ),
            ),
          ]),
    ));
  }

  bool loading = false;
  withdrawl(String amount, String password) async {
    final prefs = await SharedPreferences.getInstance();
    final userid = prefs.getString("userId");
    final prefs2 = await SharedPreferences.getInstance();
    final acId = prefs2.getString("acId");
    print(acId);
    print('llllllllllllllllll');
    setState(() {
      loading = true;
    });
    final response = await http.post(
      Uri.parse(Apiconst.withdralrequest),
      headers: <String, String>{
        "Content-Type": "application/json; charset=UTF-8",
      },
      body: jsonEncode(<String, String>{
        "userid": '$userid',
        "amount": amount,
        "password": password,
        "account_id": '$acId',
      }),
    );
    var data = jsonDecode(response.body);
    print(data);
    print('qqqqqqqqqqqqqqqqqq');
    if (data["status"] == '200') {
      setState(() {
        loading = false;
      });

      Utils.SuccessPopup(context);

      // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => bottom()));
    } else {
      setState(() {
        loading = false;
      });
      Utils.flushBarErrorMessage(data["msg"], context, white);
    }
  }


}
