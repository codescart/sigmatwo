import 'package:Sigma/main.dart';
import 'package:flutter/material.dart';
import 'package:Sigma/constant/consstantcolor.dart';
import 'package:Sigma/constant/constantbutton.dart';
import 'package:Sigma/constant/textstyleconstant.dart';


class Invitation_Page extends StatefulWidget {
  const Invitation_Page({Key? key}) : super(key: key);

  @override
  State<Invitation_Page> createState() => _Invitation_PageState();
}

class _Invitation_PageState extends State<Invitation_Page> {
  @override
  Widget build(BuildContext context) {
    final height=MediaQuery.of(context).size.height;
    final width=MediaQuery.of(context).size.width;
    return SafeArea(child: Scaffold(
      backgroundColor: bgcolor,
      appBar: AppBar(
          flexibleSpace: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [lightblue,bgcolor],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter
                  )
              )
          ),
          centerTitle: true,
          title:Text("Project")
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Card(elevation: 3,
              child: Container(
                height: height*0.35,
                width:width*0.99,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: white),
                child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Invitation code",style: F630,),
                    Text("448520",style: ConstText,),
                    Text("invite link",style: text,),
                    Container(alignment: Alignment.center,
                      height: height*0.07,
                      width: width*0.7,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color:gray,

                          ),
                          borderRadius: BorderRadius.all(Radius.circular(2)),
                          color: white),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("https://www.Sigma.co/h5/register/448520",style: NormalText,),
                      ),
                    ),
                    constantbutton(onTap: () {  }, text: 'Copy invitation link',),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
