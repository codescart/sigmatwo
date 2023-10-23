import 'package:Sigma/auth/backgrounddesigen.dart';
import 'package:Sigma/constant/launchermsg.dart';
import 'package:Sigma/dashboard/HomeDirectory/myteam.dart';
import 'package:Sigma/dashboard/MineDirectory/Bindbankaccount.dart';
import 'package:Sigma/dashboard/MineDirectory/change_password.dart';
import 'package:Sigma/dashboard/MineDirectory/fundingdetails.dart';
import 'package:Sigma/dashboard/MineDirectory/myproject.dart';
import 'package:Sigma/dashboard/ProductDirectory/refer_earn.dart';
import 'package:flutter/material.dart';
import 'package:Sigma/constant/assetsconstant.dart';
import 'package:Sigma/constant/consstantcolor.dart';
import 'package:Sigma/constant/textstyleconstant.dart';
import 'package:Sigma/dashboard/HomeDirectory/bonus.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Elements_cont extends StatefulWidget {
  const Elements_cont({Key? key}) : super(key: key);

  @override
  State<Elements_cont> createState() => _Elements_contState();
}

class _Elements_contState extends State<Elements_cont> {
  @override
  Widget build(BuildContext context) {

    return Card(elevation: 3,
      child: Container(

        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(14),)
          ,color: white,),
        child: GridView(

          shrinkWrap: true,
           physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            // crossAxisSpacing: 1.0,
              // mainAxisSpacing: 1.0,
          ),
           // itemCount: 10,
          scrollDirection: Axis.vertical,
          children: [
            InkWell(
              onTap: (){
                print("😂😂😂😂😂");
                Navigator.push(context, MaterialPageRoute(builder: (context)=>myproject_page()));
              },
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(elevation:6,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(80),
                        //set border radius more than 50% of height and width to make circle
                      )
                      ,
                      child: CircleAvatar(
                        radius:22,
                        backgroundColor: Colors.white,
                        child:
                        CircleAvatar(radius: 16,
                          backgroundImage: AssetImage(Project),backgroundColor: Colors.white, ),
                      ),
                    ),
                  ),
                  Center(
                    child: Text('My project',style: gridText,),
                  ),
                  // title: name[index]
                ],
              ),
            ),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Bonus_Page()));
                // _launchEmail();
              },
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(elevation:6,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(80),

                      )
                      ,
                      child: CircleAvatar(
                        radius:22,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(radius: 16,

                          backgroundImage: AssetImage(Bonus),backgroundColor: Colors.white, ),
                      ),
                    ),

                  ),
                  Center(
                    child: Text('Bonus',style: gridText,),
                  ),
                  // title: name[index]
                ],
              ),
            ),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Account_details(
                )));
              },
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(elevation:6,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(80),
                        //set border radius more than 50% of height and width to make circle
                      )
                      ,
                      child: CircleAvatar(
                        radius:22,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(radius: 16,

                          backgroundImage: AssetImage(Bankac),backgroundColor: Colors.white, ),
                      ),
                    ),

                  ),
                  Center(
                    child: Text('Bind bank account',style: gridText,),
                  ),
                  // title: name[index]
                ],
              ),
            ),
            InkWell(
              onTap: (){
                Launcher.openwhatsapp(context);
                // Navigator.push(context, MaterialPageRoute(builder: (context)=>Terms_Condition()));
              },
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(elevation:6,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(80),
                        //set border radius more than 50% of height and width to make circle
                      )
                      ,
                      child: CircleAvatar(
                        radius:22,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(radius: 16,
                          backgroundImage: AssetImage(support),backgroundColor: Colors.white, ),
                      ),
                    ),
                  ),
                  Center(
                    child: Text('Support',style: gridText,),
                  ),
                  // title: name[index]
                ],
              ),
            ),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Changepassword()));
                // Teligram();
              },
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(elevation:6,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(80),
                        //set border radius more than 50% of height and width to make circle
                      )
                      ,
                      child: CircleAvatar(
                        radius:22,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(radius: 16,

                          backgroundImage: AssetImage(changepassword),backgroundColor: Colors.white, ),
                      ),
                    ),
                  ),
                  Center(
                    child: Text('Change Password',style: gridText,),
                  ),
                  // title: name[index]
                ],
              ),
            ),
            InkWell(
              onTap: (){
               Navigator.push(context, MaterialPageRoute(builder: (context)=>Funding_Details()));
              },
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(elevation:6,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(80),
                        //set border radius more than 50% of height and width to make circle
                      )
                      ,
                      child: CircleAvatar(
                        radius:22,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(radius: 16,

                          backgroundImage: AssetImage(Funding),backgroundColor: Colors.white, ),
                      ),
                    ),
                  ),
                  Center(
                    child: Text('Funding details',style: gridText,),
                  ),
                  // title: name[index]
                ],
              ),
            ),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Refer_Earn()));
                // _launchEmail();
              },
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(elevation:6,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(80),
                        //set border radius more than 50% of height and width to make circle
                      )
                      ,
                      child: CircleAvatar(
                        radius:22,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(radius: 16,

                          backgroundImage: AssetImage(Invitation),backgroundColor: Colors.white, ),
                      ),
                    ),
                  ),
                  Center(
                    child: Text('Invitation',style: gridText,),
                  ),
                  // title: name[index]
                ],
              ),
            ),
            InkWell(
              onTap: (){
                 Navigator.push(context, MaterialPageRoute(builder: (context)=>My_Team()));
              },
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(elevation:6,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(80),
                        //set border radius more than 50% of height and width to make circle
                      )
                      ,
                      child: CircleAvatar(
                        radius:22,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(radius: 16,

                          backgroundImage: AssetImage(Teams),backgroundColor: Colors.white, ),
                      ),
                    ),
                  ),
                  Center(
                    child: Text('My teams',style: gridText,),
                  ),
                  // title: name[index]
                ],
              ),
            ),
            InkWell(
              onTap: (){
                showDialog(

                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      shape:RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      elevation: 0,
                      backgroundColor: Colors.white,

                      content:  Container(
                        height: 300.r,

                        child: Column(
                          children: [

                            Container(
                              height: 200.r,
                              width: 200.r,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: AssetImage(
                                        Setting

                                      )
                                  )
                              ),

                            ),

                            Text('Are you Sure?',style: TextStyle(fontSize: 40.sp,fontWeight: FontWeight.w900),),
                            Spacer(),


                          ],
                        ),
                      ),
                      actions: [
                        ElevatedButton(onPressed: (){
                          Navigator.pop(context);
                        },
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(10.0.r),

                                ),


                                primary: Colors.redAccent,
                                elevation: 10,
                                textStyle: TextStyle(fontWeight: FontWeight.bold)),
                            child: Text('Cancle')),
                        ElevatedButton(onPressed: () async {
                          SharedPreferences prefs = await SharedPreferences.getInstance();
                          prefs.remove('userId');
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (BuildContext ctx) =>Background_desigen()));
                        },
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius:  BorderRadius.circular(10.0.r),
                                ),
                                primary: Colors.green,
                                elevation: 10,
                                textStyle: TextStyle(fontWeight: FontWeight.bold)),
                            child: Text('Logout')),
                      ],



                    );
                  },
                );
              },
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(elevation:6,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(80),
                        //set border radius more than 50% of height and width to make circle
                      )
                      ,
                      child: CircleAvatar(
                        radius:22,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(radius: 16,

                          backgroundImage: AssetImage(Setting),backgroundColor: Colors.white, ),
                      ),
                    ),
                  ),
                  Center(
                    child: Text('Log Out',style: gridText,),
                  ),
                  // title: name[index]
                ],
              ),
            ),

          ],
        ),

      ),
    );
  }
}
