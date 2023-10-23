import 'package:Sigma/constant/consstantcolor.dart';
import 'package:Sigma/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:Sigma/constant/textstyleconstant.dart';



class Login_button extends StatefulWidget {
  const Login_button({
    Key? key,
    required this.onTap,
    required this.text,
    this.btnColor = lightblue,
    this.textColor = black,
    this.border,
  }) : super(key: key);

  final Function() onTap;
  final String text;
  final Color? btnColor;
  final Color? textColor;
  final BoxBorder? border;

  @override
  State<Login_button> createState() => _Login_buttonState();
}

class _Login_buttonState extends State<Login_button> {

  @override
  Widget build(BuildContext context) {
    final height=MediaQuery.of(context).size.height;
    final width=MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        widget.onTap();
      },
      child: Ink(
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
            25
            ),
          ),
          child: Container(
            width: width*0.7,
            height: height*0.06,
            decoration: BoxDecoration(
              color: widget.btnColor,
              borderRadius: BorderRadius.circular(
                25,
              ),
              border: widget.border,
            ),
            child: Center(
              child: Text(
                widget.text,
                style: Theme.of(context).textTheme.headline4!.copyWith(
                  color: widget.textColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                  letterSpacing: 1.25,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }



}