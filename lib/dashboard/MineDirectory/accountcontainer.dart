import 'package:Sigma/constant/consstantcolor.dart';
import 'package:Sigma/constant/textstyleconstant.dart';
import 'package:Sigma/main.dart';
import 'package:flutter/material.dart';

class Account_Cont extends StatefulWidget {
  final earns;
   Account_Cont({required this.earns}) ;

  @override
  State<Account_Cont> createState() => _Account_ContState();
}

class _Account_ContState extends State<Account_Cont> {
  @override
  Widget build(BuildContext context) {
    final height=MediaQuery.of(context).size.height;
    final width=MediaQuery.of(context).size.width;
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
        Radius.circular(20),
      )),
      child: Container(
        height: height * 0.19,
        width: width * 0.9,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(18),
          ),
          color: white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("Total earning", style: NormalText),
                  Text("Team income", style: NormalText),
                  Text('Income today', style: NormalText),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(widget.earns["totalearning"]==null?"0.0":
                  widget.earns["totalearning"].toString(),
                  style: Rs0,
                ),
                 Text(widget.earns["teamEarning"]==null?"0.0":
                     widget.earns["teamEarning"].toString(), style: Rs0),
                 Text(widget.earns["todayEarning"]==null?"0.0":
                     widget.earns["todayEarning"].toString(), style: Rs0),
              ],
            ),
            SizedBox(
              height: height * 0.03,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("Project", style: NormalText),
                Text("Recharge", style: NormalText),
                Text('Withdraws', style: NormalText),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(widget.earns["project"]==null?"0.0":
                    widget.earns["project"].toString(), style: Rs0),
                Text(widget.earns["recharge"]==null?"0.0":
                    widget.earns["recharge"].toString(), style: Rs0),
                Text(widget.earns["withdraw"]== null?"0.0":
                    widget.earns["withdraw"].toString(), style: Rs0),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
