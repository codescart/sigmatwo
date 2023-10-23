import 'package:Sigma/buttonconstant/backbutton.dart';
import 'package:Sigma/constant/assetsconstant.dart';
import 'package:Sigma/constant/consstantcolor.dart';
import 'package:Sigma/constant/textstyleconstant.dart';
import 'package:Sigma/main.dart';
import 'package:Sigma/product/newscontroller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:url_launcher/url_launcher.dart';

class News_Readmore extends StatefulWidget {
  final newscontroller newsdata;

   News_Readmore(this.newsdata);

  @override
  State<News_Readmore> createState() => _News_ReadmoreState();
}

class _News_ReadmoreState extends State<News_Readmore> {
  @override
  Widget build(BuildContext context) {
    final height=MediaQuery.of(context).size.height;
    final width=MediaQuery.of(context).size.width;
    return SafeArea(child: Scaffold(
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
          title: Text(   "${widget.newsdata.title}",
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 20.sp,
              color: black,
            ), )
      ),
      body: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
        children: [
          Container(
            height: height*0.2,
            width: width*0.8,
            decoration: BoxDecoration(
              image: DecorationImage(image: NetworkImage("${widget.newsdata.image}")
                  ,fit: BoxFit.fill,
              ),
                borderRadius:
            BorderRadius.all(Radius.circular(10)),),
          ),
          SizedBox(height: height*0.03,),
          ListTile(
            onTap: () async {
              final url = "${widget.newsdata.url}";
              if (await canLaunch(url)) {
              await launch(url, forceWebView: true, enableJavaScript: true);
              } else {
              throw 'Could not launch $url';
              }
  },
            title: Text("${widget.newsdata.url}",style: line,),
            trailing: Icon(Icons.web),
          ),
          SizedBox(height: height*0.03,),
          HtmlWidget(
              "${widget.newsdata.name}"
          ),
        ],
      ),
    ));
  }
}
