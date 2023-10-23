import 'dart:convert';

import 'package:Sigma/constant/apiconstant.dart';
import 'package:Sigma/constant/consstantcolor.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;

class SliderPage extends StatefulWidget {
  const SliderPage({Key? key}) : super(key: key);

  @override
  State<SliderPage> createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  @override
  Widget build(BuildContext context) {
    final height=MediaQuery.of(context).size.height;
    final width=MediaQuery.of(context).size.width;
    return CarouselSlider(
      options: CarouselOptions(
        height: 150,
        aspectRatio: 16/9,
        viewportFraction: 0.9,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 3),
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        enlargeFactor: 0.3,

        scrollDirection: Axis.horizontal,
      ),
      items: state_data.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
                width:width,
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 2,color: black),
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(i["image"])
                  )
                ),
            );
          },
        );
      }).toList(),
    );
  }
  @override
  void initState() {
    state();
    super.initState();
  }

  List state_data = [];

  Future<String> state() async {
    final res = await http.get(
        Uri.parse(Apiconst.Sliderurl)
    );
    final resBody = json.decode(res.body)['data'];
    print("hhhhhhhhhhhhh");
    print(resBody);
    setState(() {
      state_data = resBody;
    });



    return "Sucess";
  }
}
