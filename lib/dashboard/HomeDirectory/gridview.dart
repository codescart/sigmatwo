import 'package:Sigma/constant/assetsconstant.dart';
import 'package:Sigma/dashboard/HomeDirectory/bonus.dart';
import 'package:Sigma/dashboard/HomeDirectory/myteam.dart';
import 'package:Sigma/dashboard/HomeDirectory/weeklysalary.dart';
import 'package:Sigma/dashboard/MineDirectory/myproject.dart';
import 'package:Sigma/dashboard/ProductDirectory/refer_earn.dart';
import 'package:Sigma/recharge/Rechargeamount.dart';
import 'package:flutter/material.dart';
import 'package:Sigma/constant/textstyleconstant.dart';
import 'package:Sigma/dashboard/HomeDirectory/invitation.dart';
import 'package:Sigma/dashboard/HomeDirectory/monthlysalary.dart';
import 'package:Sigma/dashboard/HomeDirectory/myproject.dart';
import 'package:Sigma/dashboard/HomeDirectory/withdraw.dart';


class Grid_ViewPage extends StatefulWidget {
  const Grid_ViewPage({Key? key}) : super(key: key);

  @override
  State<Grid_ViewPage> createState() => _Grid_ViewPageState();
}

class _Grid_ViewPageState extends State<Grid_ViewPage> {
  @override
  Widget build(BuildContext context) {

    return GridView(
      shrinkWrap: true,
       physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 1.0,
      //   mainAxisSpacing: 5.0,
      ),
      // itemCount: 10,
      scrollDirection: Axis.vertical,
      children: [
        InkWell(
          onTap: (){
            Navigator.push(context,
                MaterialPageRoute(
                    builder: (context)=>recharge()));
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
                      backgroundImage: AssetImage(Recharge),backgroundColor: Colors.white, ),
                  ),
                ),
              ),
              Center(
                child: Text('Recharge',style: gridText,),
              ),
              // title: name[index]
            ],
          ),
        ),

        InkWell(
          onTap: (){
             Navigator.push(context, MaterialPageRoute(builder: (context)=>Withdraw_Page()));
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

                      backgroundImage: AssetImage(Withdraw),backgroundColor: Colors.white, ),
                  ),
                ),

              ),
              Center(
                child: Text('Withdraw',style: gridText,),
              ),
              // title: name[index]
            ],
          ),
        ),

        InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>My_Team(
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

                      backgroundImage: AssetImage(Teams),backgroundColor: Colors.white, ),
                  ),
                ),

              ),
              Center(
                child: Text('Teams',style: gridText,),
              ),
              // title: name[index]
            ],
          ),
        ),

        InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Refer_Earn()));
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
             Navigator.push(context, MaterialPageRoute(builder: (context)=>Bonus_Page()));

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
                    child: CircleAvatar(radius: 16,

                      backgroundImage: AssetImage(Project),backgroundColor: Colors.white, ),
                  ),
                ),

              ),
              Center(
                child: Text('My Project',style: gridText,),
              ),
              // title: name[index]
            ],
          ),
        ),
        InkWell(
          onTap: (){
             Navigator.push(context, MaterialPageRoute(builder: (context)=>WEEKLYSALARY()));
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
                      backgroundImage: AssetImage(WeeklySalary),backgroundColor: Colors.white, ),
                  ),
                ),

              ),
              Center(
                child: Text('Weekly Salary',style: gridText,),
              ),
              // title: name[index]
            ],
          ),
        ),
        InkWell(
          onTap: (){
             Navigator.push(context, MaterialPageRoute(builder: (context)=>Monthly_Salary(
            )));
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

                      backgroundImage: AssetImage(MonthlySalary),backgroundColor: Colors.white, ),
                  ),
                ),

              ),
              Center(
                child: Text('Monthly Salary',style: gridText,),
              ),
              // title: name[index]
            ],
          ),
        ),
      ],
    );
  }
}
