import 'package:Sigma/constant/consstantcolor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:Sigma/constant/textstyleconstant.dart';



class Circularbutton2 extends StatefulWidget {
  const Circularbutton2({
    Key? key,

    this.btnColor = lightblue,
    this.textColor = white,
    this.border,
  }) : super(key: key);



  final Color? btnColor;
  final Color? textColor;
  final BoxBorder? border;

  @override
  State<Circularbutton2> createState() => _Circularbutton2State();
}

class _Circularbutton2State extends State<Circularbutton2> {

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return InkWell(

      child: Ink(
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
                100
            ),
          ),
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: widget.btnColor,
              borderRadius: BorderRadius.circular(
                100,
              ),
              border: widget.border,
            ),
            child: Center(
                child: CircularProgressIndicator(color: white,)
            ),
          ),
        ),
      ),
    );
  }



}