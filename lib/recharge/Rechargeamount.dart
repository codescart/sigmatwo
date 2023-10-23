import 'dart:convert';
import 'package:Sigma/buttonconstant/backbutton.dart';
import 'package:Sigma/constant/apiconstant.dart';
import 'package:Sigma/constant/assetsconstant.dart';
import 'package:Sigma/constant/consstantcolor.dart';
import 'package:Sigma/constant/flushbar.dart';
import 'package:Sigma/dashboard/dashboard.dart';
import 'package:Sigma/recharge/add_cash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart'as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:upi_india/upi_india.dart';

import '../dashboard/HomeDirectory/rechargerecord.dart';
import '../dashboard/HomeDirectory/withdrawlrecord.dart';


class recharge extends StatefulWidget {
  const recharge({Key? key}) : super(key: key);

  @override
  State<recharge> createState() => _rechargeState();
}

class _rechargeState extends State<recharge> {
  Future<UpiResponse>? _transaction;
  UpiIndia _upiIndia = UpiIndia();
  List<UpiApp>? apps;

  TextStyle header = TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: black
  );

  TextStyle value = TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 14,
      color: black
  );

  @override
  void initState() {
    _upiIndia.getAllUpiApps(mandatoryTransactionId: false).then((value) {
      setState(() {
        apps = value;
      });
    }).catchError((e) {
      apps = [];
    });
    super.initState();
  }

  Future<UpiResponse> initiateTransaction(UpiApp app) async {



    var long2 = double.parse(amount.toString());
    return _upiIndia.startTransaction(
      app: app,
      receiverUpiId: "merchant969855.augp@aubank",
      receiverName: '100X Bet',
      transactionRefId: 'Razorpay0256',
      transactionNote: '100x',
      amount: 10,
    );
  }

  Widget displayUpiApps() {
    if (apps == null)
      return Center(child: CircularProgressIndicator());
    else if (apps!.length == 0)
      return Center(
        child: Text(
          "No apps found to handle transaction.",
          style: header,
        ),
      );
    else
      return Align(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Wrap(
            children: apps!.map<Widget>((UpiApp app) {
              return GestureDetector(
                onTap:
                app.name=='PhonePe'?(){}:
                    () {
                  _transaction = initiateTransaction(app);
                  setState(() {});
                },
                child: Container(
                  height: 100,
                  width: 100,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.memory(
                        app.icon,
                        height: 60,
                        width: 60,
                      ),
                      Text(app.name),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      );
  }

  String _upiErrorHandler(error) {
    switch (error) {
      case UpiIndiaAppNotInstalledException:
        return 'Requested app not installed on device';
      case UpiIndiaUserCancelledException:
        return 'You cancelled the transaction';
      case UpiIndiaNullResponseException:
        return 'Requested app didn\'t return any response';
      case UpiIndiaInvalidParametersException:
        return 'Requested app cannot handle the transaction';
      default:
        return 'Please Enter Amount';
    }
  }

  void _checkTxnStatus(String status) {
    switch (status) {
      case UpiPaymentStatus.SUCCESS:

        addmony();
        print('Transaction Successful');
        break;
      case UpiPaymentStatus.SUBMITTED:
        print('Transaction Submitted');
        break;
      case UpiPaymentStatus.FAILURE:
        print('Transaction Failed');
        break;
      default:
        print('Received an Unknown transaction status');
    }
  }

  Widget displayTransactionData(title, body) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("$title: ", style: header),
          Flexible(
              child: Text(
                body,
                style: value,
              )),
        ],
      ),
    );
  }
  var wallet;





  TextEditingController amount = TextEditingController();
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
  void dispose() {
    amount.dispose();
    super.dispose();
  }

  var catogery;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
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
        title: Text(
          'RECHARGE',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w900, color: black),
        ),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Recharge_record()));
              },
              child: Text('Record',
                  style: TextStyle(
                      fontSize: height/45,
                      fontWeight: FontWeight.w900,
                      color: black)))
        ],
      ),
      body: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
          children: [
            SizedBox(
              height: height/20,
            ),
            SizedBox(
              height: height/20,
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
                    hintText: "Enter Recharge Amount",
                    helperStyle:
                    TextStyle(fontSize: height/25, color: Colors.grey.shade200),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    )),
                cursorColor: Colors.grey,
              ),
            ),
            SizedBox(
              height: height/20,
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
                                  fontSize: width/25,
                                  fontWeight: FontWeight.w900),
                            ),
                          ),
                        ),
                        Positioned(
                            top: 5,
                            right: 5,
                            child: _selectedItemIndex == dataItems[index]
                                ? Container(
                              height: 12,
                              width: 12,
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
            _isButtonEnabled?
            Container(
              height: height*0.9,
                child: addcash(amount: amount.text,)):
                Container()
          ]),
    );
  }
  addmony()async {
    final prefs = await SharedPreferences.getInstance();
    final userid = prefs.getString("userId");
    final response =  await http.post(Uri.parse(Apiconst.addmoney),
      headers:<String ,String>{
        "Content-Type":"application/json; charset=UTF-8",
      },
      body: jsonEncode(<String ,String>{
        "userid": '$userid',
        "amount": amount.text,
      }),
    );
    var data = jsonDecode(response.body);
    print(data);
    print('qqqqqqqqqqqqqqqqqq');
    if(data["status"]=='200'){

      Navigator.pushReplacement(
          context, MaterialPageRoute(
          builder: (context) => bottom()));

    }
    else{

      Utils.flushBarErrorMessage( data["msg"],context,white);
    }

  }
}


