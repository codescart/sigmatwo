import 'package:Sigma/constant/assetsconstant.dart';
import 'package:Sigma/constant/consstantcolor.dart';
import 'package:Sigma/constant/textstyleconstant.dart';
import 'package:Sigma/main.dart';
import 'package:flutter/material.dart';



class News_List extends StatefulWidget {
  const News_List({Key? key}) : super(key: key);

  @override
  State<News_List> createState() => _News_ListState();
}

class _News_ListState extends State<News_List> {
  @override
  Widget build(BuildContext context) {
    final height=MediaQuery.of(context).size.height;
    final width=MediaQuery.of(context).size.width;
    return ListView.builder(itemCount: 6,
        shrinkWrap: true,
         physics: NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context,int index){
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(elevation: 3,
          child: Container(
            height: height*0.22,
            width: width*0.5,
            decoration: BoxDecoration( borderRadius: BorderRadius.all(Radius.circular(5)),
                color: white),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Fairburn partner with aquaculture company",style: text,),
                  Text("07/08/2023 12:36:29",style: terms,),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Container(
                          height: height*0.1,
                          width: width*0.3,
                            decoration: BoxDecoration( image: DecorationImage(image: AssetImage(Aboutus)),
                                borderRadius: BorderRadius.all(Radius.circular(5)),
                                color: white)
                        ),
                      ),
                      SizedBox(width: width*0.03,),
                      Container(
                          width: width*0.54,
                          height: height*0.1,
                          child: Text("API stands for Application Programming Interface. In the context of APIs, the word Application refers to...."))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
