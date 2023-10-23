import 'dart:convert';

import 'package:Sigma/constant/apiconstant.dart';
import 'package:Sigma/constant/assetsconstant.dart';
import 'package:Sigma/constant/consstantcolor.dart';
import 'package:Sigma/constant/flushbar.dart';
import 'package:Sigma/dashboard/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:upi_india/upi_india.dart';
import 'package:http/http.dart' as http;
class addcash extends StatefulWidget {
  final amount;
  addcash({required this.amount});
  @override
  _addcashState createState() => _addcashState();
}

class _addcashState extends State<addcash> {

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
    var long2 = double.parse(widget.amount.toString());
    return _upiIndia.startTransaction(
      app: app,
      receiverUpiId: "merchant969855.augp@aubank",
      receiverName: '100X Bet',
      transactionRefId: 'Razorpay0256',
      transactionNote: '100x',
      amount: long2,
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

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Column(
      children: <Widget>[
        Container(
          child: Center(child: Text("PAY USING",
            style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.w900
            ),
          )),
        ),
        SizedBox(height: 20,),
        Expanded(
          child: displayUpiApps(),
        ),
        Expanded(
          child: FutureBuilder(
            future: _transaction,
            builder: (BuildContext context, AsyncSnapshot<UpiResponse> snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text(
                      _upiErrorHandler(snapshot.error.runtimeType),
                      style: header,
                    ), // Print's text message on screen
                  );
                }
                // If we have data then definitely we will have UpiResponse.
                // It cannot be null
                UpiResponse _upiResponse = snapshot.data!;
                // Data in UpiResponse can be null. Check before printing
                String txnId = _upiResponse.transactionId ?? 'N/A';
                String resCode = _upiResponse.responseCode ?? 'N/A';
                String txnRef = _upiResponse.transactionRefId ?? 'N/A';
                String status = _upiResponse.status ?? 'N/A';
                String approvalRef = _upiResponse.approvalRefNo ?? 'N/A';
                _checkTxnStatus(status);
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      displayTransactionData('Transaction Id', txnId,),
                      displayTransactionData('Response Code', resCode),
                      displayTransactionData('Reference Id', txnRef),
                      displayTransactionData('Status', status.toUpperCase()),
                      displayTransactionData('Approval No', approvalRef),
                    ],
                  ),
                );
              } else
                return Center(
                  child: Text(''),
                );
            },
          ),
        )
      ],
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
        "amount": widget.amount,
      }),
    );
    var data = jsonDecode(response.body);
    print(data);
    print('qqqqqqqqqqqqqqqqqq');
    if(data["status"]=='200'){
     Utils.RechargePopup(context);
    }
    else{

      Utils.flushBarErrorMessage( data["msg"],context,white);
    }

  }

}




