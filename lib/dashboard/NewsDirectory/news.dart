import 'dart:convert';

import 'package:Sigma/constant/apiconstant.dart';
import 'package:Sigma/constant/assetsconstant.dart';
import 'package:Sigma/constant/consstantcolor.dart';
import 'package:Sigma/constant/textstyleconstant.dart';
import 'package:Sigma/dashboard/NewsDirectory/newsreadmore.dart';
import 'package:Sigma/main.dart';
import 'package:Sigma/product/newscontroller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:http/http.dart' as http;

class News extends StatefulWidget {
  const News({Key? key}) : super(key: key);

  @override
  State<News> createState() => _NewsState();
}

class _NewsState extends State<News> {

  final videoURL="https://www.youtube.com/watch?v=cFKmaY7bVU8";
  late YoutubePlayerController _controller;
  @override
  void initState() {
    final videoID = YoutubePlayer.convertUrlToId(videoURL);
    _controller=YoutubePlayerController(initialVideoId:videoID !);
    vediourl();
    // TODO: implement initState
    super.initState();
  }
  var  map;
  vediourl() async {

    final response = await http.get(
      Uri.parse(Apiconst.newsvideo),
    );
    var data = jsonDecode(response.body);
    print(data);
    print("mmmmmmmmmmmm");
    if (data['status'] == '200') {
      setState(() {
        map = data['url'];
      });
    }
    print(data['url']);
  }

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
        centerTitle: true,
        title: Container(
          height: height*0.03,
          decoration: BoxDecoration(image: DecorationImage(image: AssetImage(Adani))),
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        children: [
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Container(
          //     height: height*0.2,
          //     width: width*0.5,
          //     child:  YoutubePlayer(controller: _controller,
          //       // showVideoProgressIndicator: true,
          //       ),
          //
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("News",style:text ,),
          ),
          FutureBuilder<List<newscontroller>>(
              future: qwe(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                else if (snapshot.hasError) {
                  return Center(
                    child: Text('Error: ${snapshot.error}'),
                  );
                }
                else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(
                    child: Text(
                      "No Data Avilable",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: height/20,
                        color: black,
                      ),
                    ),
                  );
                }
                else {
                  return ListView.builder(
                      itemCount: snapshot.data!.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (BuildContext context,int index){

                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(elevation: 3,
                            child: Container(
                              decoration: BoxDecoration( borderRadius: BorderRadius.all(Radius.circular(5)),
                                  color: white),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("${snapshot.data![index].title!.toUpperCase()}",style: text,),
                                    Text("${snapshot.data![index].date}",style: terms,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: Container(
                                              height: height*0.1,
                                              width: width*0.3,
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      image: NetworkImage("${snapshot.data![index].image}")),
                                                  borderRadius: BorderRadius.all(Radius.circular(5)),
                                                  color: white)
                                          ),
                                        ),

                                        Container(
                                            height: height*0.125,
                                            width: width*0.5,
                                            child: Center(child: buildTruncatedText('${snapshot.data![index].name}',snapshot.data![index]))),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      });
                }
              }
          ),
        ],      ),
    ));
  }
  Future<List<newscontroller>> qwe()  async {
    final prefs = await SharedPreferences.getInstance();
    final userid = prefs.getString("userId");
    print(userid);
    final response = await http.get(
        Uri.parse(Apiconst.news));
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body)['data'] as List<dynamic>;
      final urllink = json.decode(response.body)['url'];
      print(response);
      print(urllink);
      print('kkkkkkkkkkkkkkkkkkkkkkkk');
      return jsonData.map((item) => newscontroller.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }


  Widget buildTruncatedText(String text,newscontroller newsdata) {
    final int wordLimit = 3; // Change this to your desired word limit
    final List<String> words = text.split(' ');
    final String truncatedText =
    words.take(wordLimit).join(' ');

    if (words.length > wordLimit) {
      return Column(
        children: [
          HtmlWidget(truncatedText + ' ...',),
          Spacer(),

          Align(
            alignment: Alignment.bottomRight,
            child: TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                    builder: (context)=>News_Readmore(newsdata)));
                // Action for "Read more" option
              },
              child: Text('Read more'),
            ),
          ),
        ],
      );
    } else {
      return Text(truncatedText);
    }
  }

}
