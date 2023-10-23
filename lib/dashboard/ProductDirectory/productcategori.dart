import 'package:Sigma/constant/consstantcolor.dart';
import 'package:Sigma/constant/textstyleconstant.dart';
import 'package:Sigma/main.dart';
import 'package:flutter/material.dart';

class Product_Catogery extends StatefulWidget {
  const Product_Catogery({Key? key}) : super(key: key);

  @override
  State<Product_Catogery> createState() => _Product_CatogeryState();
}

class _Product_CatogeryState extends State<Product_Catogery> {
  @override
  Widget build(BuildContext context) {
    final height=MediaQuery.of(context).size.height;
    final width=MediaQuery.of(context).size.width;
    return Scaffold(
      body:  Column(
        children: [
          Container(
            height:height*0.1 ,
            width: width*0.4,
            color: lightred,
            child: Padding(
              padding: const EdgeInsets.only(left: 3),
              child: Container(alignment: Alignment.center,
                height: height*0.1,
                width: width*0.3,
                color: white,
                child: Text("Hot sale",style: weekly,),
              ),
            ),
          )
        ],
      ),
    );
      Column(
      children: [
        Container(
          height:height*0.1 ,
          width: width*0.4,
          color: lightred,
          child: Text("hii"),
        )

      ],
    );
  }
}
