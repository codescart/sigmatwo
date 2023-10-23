import 'package:Sigma/main.dart';
import 'package:flutter/material.dart';
import 'package:Sigma/constant/assetsconstant.dart';
import 'package:Sigma/constant/consstantcolor.dart';
import 'package:Sigma/constant/constantbutton.dart';
import 'package:Sigma/constant/textstyleconstant.dart';
import 'package:Sigma/dashboard/ProductDirectory/limited.dart';
import 'package:Sigma/dashboard/ProductDirectory/weekly.dart';

class Product_page extends StatefulWidget {
  const Product_page({Key? key}) : super(key: key);

  @override
  State<Product_page> createState() => _Product_pageState();
}

class _Product_pageState extends State<Product_page>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final height=MediaQuery.of(context).size.height;
    final width=MediaQuery.of(context).size.width;
    TabController _tabContrller = TabController(length: 2, vsync: this);
    return SafeArea(
        child: Scaffold(
      backgroundColor: bgcolor,
      appBar: AppBar(
        flexibleSpace: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(5),
                    bottomRight: Radius.circular(5)),
                gradient: LinearGradient(
                    colors: [lightblue, bgcolor],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter))),
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Container(
          height: height * 0.03,
          decoration:
              BoxDecoration(image: DecorationImage(image: AssetImage(Adani))),
        ),
        bottom: TabBar(
            controller: _tabContrller,
            unselectedLabelColor: black,
            labelColor: lightblue,
            // indicatorSize: TabBarIndicatorSize.label,
            indicatorColor: Colors.transparent,
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: white,
            ),
            tabs: [
              Container(
                width: width * 0.99,
                child: Tab(
                 // text: ("AMBANI"),
                  text: ("SIGMA-I"),
                ),
              ),
              Container(
                width: width * 0.99,
                child: Tab(
                  text: ("SIGMA -Ⅱ"),
                //  text: ("AMBANI-Ⅱ"),
                ),
              ),
            ]),
      ),
      body: TabBarView(
        controller: _tabContrller,
        children: [
          Limited(),
          Tk_Product()
        ],
      ),
    ));
  }
}
